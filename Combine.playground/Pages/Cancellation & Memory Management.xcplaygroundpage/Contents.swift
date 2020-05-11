//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/*:
# Cancellation
A subscription returns a `Cancellable` object

Correct memory management using `Cancellable` makes sure you're not retaining any references.
 
 这个例子用来帮助理解 Cancellable 协议的用途。通过OpenCombine这个库，可以大致了解到 Cancellable 的对象在deinit时会调用cancel方法来解除对其的observe
*/

class MyClass {
	var cancellable: Cancellable? = nil
	var variable: Int = 0 {
		didSet {
			print("MyClass object.variable = \(variable)")
		}
	}

	init(subject: PassthroughSubject<Int,Never>) {
		cancellable = subject.sink { value in
			// Note that we are introducing a retain cycle on `self`
			// on purpose, by not using `weak` or `unowned`
			self.variable += value
		}
	}

	deinit {
		print("MyClass object deallocated")
	}
}

func emitNextValue(from values: [Int], after delay: TimeInterval) {
	DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
		var array = values
		subject.send(array.removeFirst())
		if !array.isEmpty {
			emitNextValue(from: array, after: delay)
		}
	}
}

let subject = PassthroughSubject<Int,Never>()
var object: MyClass? = MyClass(subject: subject)

emitNextValue(from: [1,2,3,4,5,6,7,8], after: 0.5)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
	print("Nullify object")
	//: **TODO** uncomment the next line to see the change
	object?.cancellable = nil
	object = nil
}

//: [Next](@next)
