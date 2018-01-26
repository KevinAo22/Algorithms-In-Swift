import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 简单选择排序
// 最差时间复杂度 ---- O(n2)
// 最优时间复杂度 ---- O(n2)
// 平均时间复杂度 ---- O(n2)
// 辅助空间复杂度 ---- O(1)
// 稳定性 ----------- 不稳定

func simpleSelectionSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        for j in (i+1)..<array.count {
            if array[i] > array[j] {
                (array[i], array[j]) = (array[j], array[i])
            }
        }
    }
}

simpleSelectionSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

