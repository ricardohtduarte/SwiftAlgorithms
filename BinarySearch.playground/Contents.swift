import UIKit

// BinarySearch searching algorithm
// Splits the data in half and compares the middle value with the key value we're looking for, if the key is less than the middle value we call the function recursively with a new array with only the left half. This process is repeated until the we get the key, otherwise, it returns false. Has the complexity of O(logn) due to its smaller array in each function call.

var data: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
var key: Int = 16

func binarySearch(array: [Int], key: Int) -> Bool {
    guard array.count > 0 else {
        return false
    }
    
    let minIndex = 0
    let maxIndex = array.count-1
    
    let middleIndex = maxIndex/2
    let middleValue = array[middleIndex]
    
    if key > array[maxIndex] || key < array[minIndex] {
        return false
    }
    
    if array[minIndex] == key || array[maxIndex] == key {
        return true
    }
    
    if key > middleValue {
        let rightSlicedArray = Array(array[middleIndex...maxIndex])
        print("Right sliced array: \(rightSlicedArray)")
        return binarySearch(array: rightSlicedArray, key: key)
    }
    
    if key < middleValue {
        let leftSlicedArray = Array(array[minIndex...middleIndex])
        print("Left sliced array: \(leftSlicedArray)")
        return binarySearch(array: leftSlicedArray, key: key)
    }
    
    if middleValue == key {
        return true
    }
    
    return false
}

print("Data: \(data)")
print("Key: \(key)")
print("")

binarySearch(array: data, key: key)
    ? print("Key value was found")
    : print("Key value was not found")
