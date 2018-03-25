import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 希尔排序
// 最差时间复杂度 ---- O(n2)
// 最优时间复杂度 ---- O(n)
// 平均时间复杂度 ---- O(n1.3)
// 辅助空间复杂度 ---- O(1)
// 稳定性 ----------- 不稳定

func shellSort<T: Comparable>(_ array: inout [T]){
    var increment = array.count / 2
    while increment >= 1 {
        for i in increment..<array.count {
            let temp = array[i]
            var j = i - increment
            while j >= 0 && temp < array[j] {
                array[j+increment] = array[j];
                j -= increment;
            }
            array[j+increment] = temp;
        }
        increment = increment / 2
    }
}

shellSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)
