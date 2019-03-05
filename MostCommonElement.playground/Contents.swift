//: Playground - noun: a place where people can play

import UIKit

var bands:[String] = ["car seat headrest", "car seat headrest", "radiohead", "joy division", "beach house", "arcade fire", "james blake",
                            "radiohead", "joy division", "joy division", "joy division", "james blake", "james blake", "james blake",]

func find_most_common(array: [String]) -> [String]{
    var ocurrences = [String:Int]()
    var most_common:[String] = []
    
    //fills the dicitonary
    for band in bands{
        if let count = ocurrences[band]{
            ocurrences[band] = count + 1
        }
        else{
            ocurrences[band] = 1
        }
    }
    
    let max_count = ocurrences.values.max()
    print(ocurrences)
    
    //iterates trought the dictionary
    
    for (name, count) in ocurrences{
        if count == max_count{
            most_common.append(name)
            
        }
    }
    return most_common
}


print(find_most_common(array: bands))
