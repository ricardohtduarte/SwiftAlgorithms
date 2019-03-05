import UIKit

var word1 = "abbc"
var word2 = "abcba"
var word3 = "abccba"

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

//ITERATIVE

func isPalindromeIteratively(word: String) -> Bool {
    
    var firstIndex = 0
    var lastIndex = word.count-1
    
    while firstIndex < lastIndex {
        if word[firstIndex] != word[lastIndex] {
            return false
        }
        
        firstIndex += 1
        lastIndex -= 1
    }
    
    return true
}


//RECURSIVE

func isPalindromeRecursively(word: String) -> Bool {
    guard word.count > 1 else {
        return true
    }
    
    let firstChar = word[0]
    let lastChar = word[word.count-1]
    
    guard firstChar == lastChar else {
        return false
    }
    
    let processedWord = (word.dropFirst()).dropLast()
    return isPalindromeRecursively(word: String(processedWord))
}

print(isPalindromeRecursively(word: word1))
print(isPalindromeIteratively(word: word3))

