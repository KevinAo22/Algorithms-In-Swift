import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 堆排序
// 最差时间复杂度 ---- O(nlogn)
// 最优时间复杂度 ---- O(nlogn)
// 平均时间复杂度 ---- O(nlogn)
// 辅助空间复杂度 ---- O(1)
// 稳定性 ----------- 不稳定

func heapSort<T: Comparable>(_ array: inout [T]){
    let count = array.count
    
    buildHeap(&array, count: count)
    
    for i in 1..<count {
        (array[0], array[count - i]) = (array[count - i], array[0])
        heapAdjust(&array, parent: 0, count: count-i)
    }
}

func buildHeap<T: Comparable>(_ array: inout [T], count: Int) {
    var i = count / 2 - 1;
    while i >= 0 {
        heapAdjust(&array, parent: i, count: count)
        i -= 1
    }
}

func heapAdjust<T: Comparable>(_ array: inout [T], parent: Int, count: Int) {
    let temp = array[parent]
    var parent = parent
    var i = parent * 2 + 1
    while i < count {
        if i < count-1 && array[i] < array[i+1] {
            i = i + 1;
        }
        if temp < array[i] {
            (array[parent], array[i]) = (array[i], array[parent])
            parent = i
            i = i * 2 + 1
        } else {
            break
        }
    }
}

heapSort(&numsArray)


let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

