import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 快速排序
// 最差时间复杂度 ---- O(n2)
// 最优时间复杂度 ---- O(nlogn)
// 平均时间复杂度 ---- O(nlogn)
// 辅助空间复杂度 ---- O(nlogn)
// 稳定性 ----------- 不稳定

func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let privotKey = array[low]
    var low = low
    var high = high
    while low < high {
        while low < high && array[high] >= privotKey {
            high -= 1
        }
        (array[low], array[high]) = (array[high], array[low])
        while low < high && array[low] <= privotKey {
            low += 1
        }
        (array[low], array[high]) = (array[high], array[low])
    }
    return low
}

func quickSort(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let p = partition(&array, low: low, high: high)
        quickSort(&array, low: 0, high: p-1)
        quickSort(&array, low: p+1, high: high)
    }
}

quickSort(&numsArray, low: 0, high: numsArray.count-1)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

