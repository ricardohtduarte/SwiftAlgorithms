import UIKit

var word: String = "hello world"

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
    
    guard firstIndex < lastIndex, !word.isEmpty else {
        return word
    }
    
    let invertedWord = replace(string: word, index: firstIndex, by: word[lastIndex])
    let finalInvertedWord = replace(string: invertedWord, index: lastIndex, by: word[firstIndex])
    return invertStringHelper(word: finalInvertedWord, firstIndex: firstIndex+1, lastIndex: lastIndex-1)
}

print(invertString(word: word))

