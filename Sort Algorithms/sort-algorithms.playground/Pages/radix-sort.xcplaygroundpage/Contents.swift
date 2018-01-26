import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()


let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

