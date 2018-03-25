import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 冒泡排序
// 最差时间复杂度 ---- O(n2)
// 最优时间复杂度 ---- O(n)
// 平均时间复杂度 ---- O(n2)
// 辅助空间复杂度 ---- O(1)
// 稳定性 ----------- 稳定

func bubbleSort<T: Comparable>(_ array: inout [T]) {
    for i in 0..<array.count {
        for j in 0..<(array.count-i-1) {
            if array[j] > array[j+1] {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    }
}

//bubbleSort(&numsArray)

// 冒泡排序改进版

func bubbleSortBetter<T: Comparable>(_ array: inout [T]) {
    var isChanged = true
    for i in 0..<array.count {
        if !isChanged {
            break
        }
        isChanged = false
        for j in 0..<(array.count-i-1) {
            if array[j] > array[j+1] {
                (array[j], array[j+1]) = (array[j+1], array[j])
                isChanged = true
            }
        }
    }
}

bubbleSortBetter(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

