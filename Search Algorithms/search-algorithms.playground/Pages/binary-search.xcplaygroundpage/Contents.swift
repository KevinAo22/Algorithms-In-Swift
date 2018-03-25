import Foundation

// unsorted array of numbers
let numsArray = [11, 60, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

// sorted array of numbers, low to high
let numsArraySorted = numsArray.sorted()


// Recursive
func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    let mid = (range.upperBound + range.lowerBound) / 2
    if array[mid] > key {
        return binarySearch(array, key: key, range: range.lowerBound ..< mid)
    } else if array[mid] < key {
        return binarySearch(array, key: key, range: mid + 1 ..< range.upperBound)
    } else {
        return mid
    }
}

// Iterative
func binarySearch<T: Comparable>(_ array: [T], key: T) -> Int? {
    var low = 0
    var up = array.count
    while low < up {
        let mid = (up + low) / 2
        if array[mid] == key {
            return mid
        } else if array[mid] < key {
            low = mid + 1
        } else {
            up = mid
        }
    }
    return nil
}

// Using recursive
binarySearch(numsArraySorted, key: 2, range: 0 ..< numsArraySorted.count)
binarySearch(numsArraySorted, key: 67, range: 0 ..< numsArraySorted.count)
binarySearch(numsArraySorted, key: 43, range: 0 ..< numsArraySorted.count)
binarySearch(numsArraySorted, key: 42, range: 0 ..< numsArraySorted.count)

// Using iterative
binarySearch(numsArraySorted, key: 2)
binarySearch(numsArraySorted, key: 67)
binarySearch(numsArraySorted, key: 43)
binarySearch(numsArraySorted, key: 42)

