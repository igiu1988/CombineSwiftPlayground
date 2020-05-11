//: [Previous](@previous)
import Foundation
import Combine

/*:
# Subjects
- A subject is a publisher ...
- ... relays values it receives from other publishers ...
- ... can be manually fed with new values
- ... subjects as also subscribers, and can be used with `subscribe(_:)`
*/

/*:
## Example 1
Using a subject to relay values to subscribers
 
 - PassthroughSubject 只会将订阅后的数据转发给 Observe
 - 属于[ReactiveX](https://mcxiaoke.gitbooks.io/rxdocs/content/Subject.html)中的 PublishSubject
*/

let relay = PassthroughSubject<String, Never>()
// relay 在本例中可以认为是Observable，使用sink返回的subscription是Observe
let subscription = relay
    .sink { value in
        print("subscription1 received value: \(value)")
}
relay.send("Hello")
relay.send("World!")

//: What happens if you send "hello" before setting up the subscription?


/*:
## Example 2
Subscribing a subject to a publisher
 
 根据[subject的特性](https://mcxiaoke.gitbooks.io/rxdocs/content/Subject.html)
 
 此处的subject变成了Observe，在例子中，publisher的数据传送给了subject，subject来处理
*/

let publisher = ["Here","we","go!"].publisher

publisher.subscribe(relay)



print("")
/*:
## Example 3
Using a `CurrentValueSubject` to hold and relay the latest value to new subscribers
 
 根据[苹果文档](https://developer.apple.com/documentation/combine/currentvaluesubject) 和 [ReactiveX文档](https://mcxiaoke.gitbooks.io/rxdocs/content/Subject.html)
 - CurrentValueSubject 应该属于 BehaviorSubject.
 - 其特点是会存最近的一个数据
*/

// 初始化也算作一次值的改变
let variable = CurrentValueSubject<String, Never>("")
variable.send("Initial text")
let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}
variable.send("More text")
//: [Next](@next)
