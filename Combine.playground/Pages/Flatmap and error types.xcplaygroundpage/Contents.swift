//: [Previous](@previous)

import Foundation
import UIKit
import Combine

/*:
[Previous](@previous)
## flatmap
- with `flatmap` you provide a new publisher every time you get a value from the upstream publisher
- ... values all get _flattened_ into a single stream of values
- ... it looks like Swift's `flatMap` where you flatten inner arrays of an array, just asynchronous.

## matching error types
- use `mapError` to map a failure into a different error type
*/

//: define the error type we need
enum RequestError: Error {
	case sessionError(error: Error)
}

//: we will send URLs through this publisher to trigger requests
let URLPublisher = PassthroughSubject<URL, RequestError>()

//: use `flatMap` to turn a URL into a requested data publisher
/*
 有些地方我没有弄明白
 1. flatMap返回的类型到底是什么
 
 查看flatMap的函数定义，
 public func flatMap<T, P>(maxPublishers: Subscribers.Demand = .unlimited, _ transform: @escaping (Self.Output) -> P) -> Publishers.FlatMap<P, Self> where T == P.Output, P : Publisher, Self.Failure == P.Failure
 发现其返回的类型是 Publishers.FlatMap<P, Self>，并且也是继承于 Publisher
 
 将这里的泛型替换为本例的具体类型后，得到的返回类型为
 anotherPublisher = FlatMap<URLSession.DataTaskPublisher, URLPublisher>
 
 2. 上面的返回类型直接影响了sink函数的理解
 根据sink函数的字义
 public func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
 闭包中的Self.output就是 URLSession.DataTaskPublisher.Output
 该Output的类型为元组(data: Data, response: URLResponse)

 所以 result.data 是 URLSession.DataTaskPublisher.Output.data
  
 */
let subscription = URLPublisher.flatMap { requestURL in
	URLSession.shared
		.dataTaskPublisher(for: requestURL)
		.mapError { error -> RequestError in
			RequestError.sessionError(error: error)
	}
} // 返回 anotherPublisher = Publishers.FlatMap<URLSession.DataTaskPublisher, URLPublisher>
.assertNoFailure()
.sink { result in // 此处的 reslut = anotherPublisher.output，对应的类型为 URLSession.DataTaskPublisher.(data: Data, response: URLResponse)
	print("Request completed!")
	_ = UIImage(data: result.data)
}

URLPublisher.send(URL(string: "https://httpbin.org/image/jpeg")!)


//: [Next](@next)
