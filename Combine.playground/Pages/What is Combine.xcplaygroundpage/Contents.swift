/*:
 [Previous](@previous)
 # What is Combine?
 - A declarative Swift API for processing values over time
 - _"Customize handling of asynchronous events by combining event-processing operators."_
 
 # 我的阅读方式
 首先要知道Combine其实就是ReactiveX的Swift实现。ReactiveX规定了一些编程范式，该范式的特点就是面向数据流编程。
 
 - 先阅读[ReactiveX文档中文翻译](https://mcxiaoke.gitbooks.io/rxdocs/content/)，以便了解ReactiveX要解决什么样的问题，以及主要的规则。
 - 还可以配合[Swift Combine 入门导读](https://icodesign.me/posts/swift-combine/)了解一个Combine到底是什么
 - 实在不行，你自己再百度一下
 - 同时辅以[英文原版ReactiveX](http://reactivex.io/documentation)，确保理解正确。有时候中文翻译的比较难以理解，看英文反而好理解
 - 把Subject以前的章节阅读完成，并且理解了这几节大概的意思后，进入实践环节
 - 使用该Combine playground进行实践练习
 - 此时需要配合[Apple Combine 文档](https://developer.apple.com/documentation/combine#overview)，以便理解Combine的使用方法
 - 最好再另开一个swift项目，有时在playground中查combine声明不太方便（Xcode不太好用）
 
 上面有提到“Combine其实就是ReactiveX的Swift实现”，所以自然会想到RxSwift，没错RxSwift也是ReactiveX的Swift实现。
 - RxSwift由ReactiveX社区维护
 - Combine由apple维护
 - [这是两者的对比](https://medium.com/gett-engineering/rxswift-to-apples-combine-cheat-sheet-e9ce32b14c5b)
 */
import Combine

//: [Next](@next)
