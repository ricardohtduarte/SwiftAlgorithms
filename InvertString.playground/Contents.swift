import UIKit

var word: String = "Hello World"

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func replace(string: String, index: Int, by character: Character) -> String{
    var characters = Array(string)
    characters[index] = character
    let modifiedString = String(characters)
    return modifiedString
}

func invertString(word: String) -> String {
    return invertStringHelper(word: word, firstIndex: 0, lastIndex: word.count-1)
}

func invertStringHelper(word: String, firstIndex: Int, lastIndex: Int) -> String {
    
    guard firstIndex <= lastIndex, !word.isEmpty else {
        return word
    }
    
    let invertedWord = replace(string: word, index: firstIndex, by: word[lastIndex])
    let finalInvertedWord = replace(string: invertedWord, index: lastIndex, by: word[firstIndex])
    return invertStringHelper(word: finalInvertedWord, firstIndex: firstIndex+1, lastIndex: lastIndex-1)
}

func invertStringIteratively(word: String) -> String {
    guard word != "" else {
        return "Error: empty parameter"
    }
    var stringArray = Array(word)
    var firstIndex = 0
    var lastIndex = stringArray.count - 1
    while firstIndex < lastIndex {
        let firstElem = stringArray[firstIndex]
        stringArray[firstIndex] = stringArray[lastIndex]
        stringArray[lastIndex] = firstElem
        firstIndex += 1
        lastIndex -= 1
    }
    return String(stringArray)
}

print(invertStringIteratively(word: word))
