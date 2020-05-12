//: [Previous](@previous)

import Foundation
import Combine

/*:
# Scheduling operators
- Combine introduces the `Scheduler` protocol
- ... adopted by `DispatchQueue`, `RunLoop` and others
- ... lets you determine the execution context for subscription and value delivery
- 还可以设置延迟时间，或者反复调用
 
 
*/

let firstStepDone = DispatchSemaphore(value: 0)

/*:
## `receive(on:)`
- determines on which scheduler values will be received by the next operator and then on
- used with a `DispatchQueue`, lets you control on which queue values are being delivered
 
 `receive(on:)` 相当于ReactiveX中的`ObserveOn`
 
 表示observe方法会在哪个queue或者runloop中执行
*/
print("* Demonstrating receive(on:)")

let publisher = PassthroughSubject<String, Never>()
let receivingQueue = DispatchQueue(label: "receiving-queue")
let subscription = publisher
	.receive(on: receivingQueue)
	.sink { value in
		print("Received value: \(value) on thread \(Thread.current)")
		if value == "Four" {
			firstStepDone.signal()
		}
}

for string in ["One","Two","Three","Four"] {
	DispatchQueue.global().async {
		publisher.send(string)
	}
}

firstStepDone.wait()

/*:
## `subscribe(on:)`
- determines on which scheduler the subscription occurs
- useful to control on which scheduler the work _starts_
- may or may not impact the queue on which values are delivered
 
 `subscribe(on:)`与ReactiveX中的`SubscribeOn`一样
 
 表示observable发射数据会在哪个queue或者runloop中执行
*/
print("\n* Demonstrating subscribe(on:)")
let subscription2 = [1,2,3,4,5].publisher
	.subscribe(on: DispatchQueue.global())
	.handleEvents(receiveOutput: { value in
		print("Value \(value) emitted on thread \(Thread.current)")
	})
	.receive(on: receivingQueue)
	.sink { value in
		print("Received value: \(value) on thread \(Thread.current)")
}

//: [Next](@next)
