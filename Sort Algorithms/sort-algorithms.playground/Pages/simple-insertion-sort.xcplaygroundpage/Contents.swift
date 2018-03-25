import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 简单插入排序
// 最差时间复杂度 ---- O(n2)
// 最优时间复杂度 ---- O(n)
// 平均时间复杂度 ---- O(n2)
// 辅助空间复杂度 ---- O(1)
// 稳定性 ----------- 稳定

func simpleInsertionSort<T: Comparable>(_ array: inout [T]) {
    for i in 1..<array.count {
        if array[i] < array[i-1] {
            let temp = array[i]
            var index = i
            for j in (0..<i).reversed() {
                if array[j] > temp {
                    array[j+1] = array[j]
                    index = j
                }
            }
            array[index] = temp
        }
    }
}

simpleInsertionSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)
