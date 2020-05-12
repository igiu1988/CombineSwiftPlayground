/*:
 [Previous](@previous)
 # What is Combine?
 - A declarative Swift API for processing values over time
 - _"Customize handling of asynchronous events by combining event-processing operators."_
 
 # 学习流程

 ## 基础知识
 - 首先要知道Combine其实就是ReactiveX的Swift实现。ReactiveX规定了一些编程范式，该范式的特点就是面向数据流编程。
 - 使用该编程范式可以实现“响应式编程”
 - ReactiveX只是描述了这些范式的行为、规则。这些范式是通用的，可以用任何语言实现这些范式。

 ## 阅读文档
 - 先阅读[ReactiveX文档中文翻译](https://mcxiaoke.gitbooks.io/rxdocs/content/)，以便了解ReactiveX要解决什么样的问题，以及主要的规则。
 - 还可以配合[Swift Combine 入门导读](https://icodesign.me/posts/swift-combine/)了解一个Combine到底是什么
 - 实在不行，你自己再百度一下
 - 同时辅以[英文原版ReactiveX](http://reactivex.io/documentation)，确保理解正确。有时候中文翻译的比较难以理解，看英文反而好理解
 - 把Subject以前的章节阅读完成，并且理解了这几节大概的意思后，进入实践环节

 ## 实践
 - 使用该Combine playground进行实践练习
 - 此时需要配合[Apple Combine 文档](https://developer.apple.com/documentation/combine#overview)，以便理解Combine的使用方法
 - 最好再另开一个swift项目，有时在playground中查combine声明不太方便（Xcode不太好用）

 # Combine 与 RXSwift
 - RxSwift由ReactiveX社区维护
 - Combine由apple维护
 - [点击查看两者的对比](https://medium.com/gett-engineering/rxswift-to-apples-combine-cheat-sheet-e9ce32b14c5b)

 # 学习时间
 - 对响应式编程没有了解情况下，预计需要半天的时间了解背景，阅读文档
 - 完成实践，大概需要一天
 */
import Combine

//: [Next](@next)
