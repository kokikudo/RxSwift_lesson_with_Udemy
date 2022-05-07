import UIKit
import RxSwift
import RxCocoa

let dispose = DisposeBag()

let behaviorSubject = BehaviorSubject(value: "init value")

behaviorSubject.onNext("last value")

behaviorSubject.subscribe{
    print($0)
}.disposed(by: dispose)

behaviorSubject.onNext("next value")

print("--ReplaySubject--")
let replaySub = ReplaySubject<String>.create(bufferSize: 2)

replaySub.onNext("value 1")
replaySub.onNext("value 2")
replaySub.onNext("value 3")

replaySub.subscribe { print($0) }.disposed(by: dispose)

replaySub.onNext("value 4")
replaySub.onNext("value 5")
replaySub.onNext("value 6")

print("--ReplaySubject2--")
replaySub.subscribe { print($0) }.disposed(by: dispose)

print("--BehaviorRelay--")
let behaviorReplay = BehaviorRelay(value: "init value")
behaviorReplay.subscribe { print($0) }.disposed(by: dispose)
behaviorReplay.accept("next Value")
// 配列に要素を追加
let behaviorArray = BehaviorRelay(value: ["item 1"])
behaviorArray.subscribe { print($0) }.disposed(by: dispose)
var newArray = behaviorArray.value
newArray.append("item 2")
newArray.append("item 3")
behaviorArray.accept(newArray)


