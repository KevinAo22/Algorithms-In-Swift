import Foundation

var numsArray = Int.randomArray(range: Range<Int>(1..<100), count: 10)
let numsArraySorted = numsArray.sorted()

func countingSort(_ array: inout [Int]) {
    // Step 1
    // Create an array to store the count of each element
    let maxElement = array.max() ?? 0
    
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for element in array {
        countArray[element] += 1
    }
    
    // Step 2
    // Set each value to be the sum of the previous two values
    for index in 1 ..< countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    // Step 3
    // Place the element in the final array as per the number of elements before it
    for element in array {
        countArray[element] -= 1
        array[countArray[element]] = element
    }
}

countingSort(&numsArray)

let isSorted = numsArray.elementsEqual(numsArraySorted)
print(isSorted)

