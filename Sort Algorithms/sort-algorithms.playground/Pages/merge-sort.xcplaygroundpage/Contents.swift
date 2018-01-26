import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 归并排序
// 最差时间复杂度 ---- O(nlogn)
// 最优时间复杂度 ---- O(nlogn)
// 平均时间复杂度 ---- O(nlogn)
// 辅助空间复杂度 ---- O(n)
// 稳定性 ----------- 稳定

func mergeSort(_ array: inout [Int]) {
    var gap = 1
    while gap < array.count {
        mergePass(&array, gap: gap)
        gap *= 2
    }
}

func mergePass(_ array: inout [Int], gap: Int) {
    var i = 0
    let count = array.count
    while i + 2 * gap - 1 < count {
        mergeArray(&array, low: i, mid: i + gap - 1, high: i + 2 * gap - 1)
        i += 2 * gap
    }
    if i + gap - 1 < count {
        mergeArray(&array, low: i, mid: i + gap - 1, high: count - 1)
    }
}

func mergeArray(_ array: inout [Int], low: Int, mid: Int, high: Int) {
    var i = low
    var j = mid + 1
    var k = 0
    
    var newArray = Array<Int>(repeating: 0, count: high - low + 1)
    
    while i <= mid && j <= high {
        if array[i] < array[j] {
            newArray[k] = array[i]
            i += 1
        } else {
            newArray[k] = array[j]
            j += 1
        }
        k += 1
    }
    while i <= mid {
        newArray[k] = array[i]
        i += 1
        k += 1
    }
    while j <= high {
        newArray[k] = array[j]
        j += 1
        k += 1
    }
    k = 0
    for i in low...high {
        array[i] = newArray[k]
        k += 1
    }
}

mergeSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

