import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 计数排序
// 最差时间复杂度 ---- O(n)
// 最优时间复杂度 ---- O(n)
// 平均时间复杂度 ---- O(n)
// 辅助空间复杂度 ---- O(n)
// 稳定性 ----------- 不稳定

func countingSort(_ array: inout [Int]) {
    // 创建计数数组，保存数组数据的出现次数。
    let maxElement = array.max() ?? 0
    
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for element in array {
        countArray[element] += 1
    }
    
    // 每一个元素等于之前的元素的和。
    for index in 1 ..< countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    // 还原原数组
    for element in array {
        countArray[element] -= 1
        array[countArray[element]] = element
    }
}

countingSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

