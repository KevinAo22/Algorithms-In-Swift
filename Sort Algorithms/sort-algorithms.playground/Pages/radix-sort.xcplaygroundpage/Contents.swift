import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

// 基数排序
// 最差时间复杂度 ---- O(d(n+r))
// 最优时间复杂度 ---- O(d(n+r))
// 平均时间复杂度 ---- O(d(n+r))
// 辅助空间复杂度 ---- O(n+r)
// 稳定性 ----------- 稳定

func radixSort(_ array: inout [Int] ) {
    let radix = 10 // 0-9 十进制
    var digit = 1 // 从个位开始
    var isCompleted = false
    var index: Int
    while !isCompleted {
        isCompleted = true
        var buckets: [[Int]] = []
        for _ in 0..<radix {
            buckets.append([])
        }
        
        for number in array {
            index = number / digit
            buckets[index % radix].append(number)
            if isCompleted && index > 0 {
                isCompleted = false
            }
        }
        
        var i = 0
        
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        
        digit *= radix
    }
}

radixSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

