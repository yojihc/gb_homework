import UIKit
import Foundation

struct cryptoBank<Element: Comparable> {
    var blockchain = [Element]()
    
    mutating func add (_ item: Element) {
        blockchain.append(item)
    }
    mutating func next() -> Element {
        print("Следующий в очереди \(blockchain.first!)")
        return blockchain.removeLast()
    }
    func filter(item: Element) {
        print("Поиск валюты \(blockchain.filter{$0 == item })")
    }
    mutating func propertySort() -> [Element] {
        return blockchain.sorted(by: >)
    }
    subscript (index: Int) -> Element? {
        return (index < blockchain.count ? blockchain[index] : nil)
    }
    func printCount() {
        print("В Вашем криптовалютном кошельке всего \(blockchain.count) монет", currency.blockchain)
    }
}

var currency = cryptoBank<String> (blockchain: ["Bitcoin"])
currency.add("Etherium")
currency.add("ZHash")
currency.add("KawPow")
currency.add("BeamV3")
currency.add("Ripple")
currency.add("Litecoin")

print("Sorting: \(currency.propertySort())")

currency.next()
currency.add("EOS")
print("В Вашем криптовалютном кошельке есть: \(currency.blockchain)")
currency.filter(item: "ZHash")
currency.printCount()
