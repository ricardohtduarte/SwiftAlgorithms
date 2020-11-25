let triangleLevelNumber = 5

var triangle: [[Int]] = [[1]]
var previousLevel: [Int] = [1,1]

for _ in 1...triangleLevelNumber {
    var newLevel = [1]
    for (index, _) in previousLevel.enumerated() {
        let firstValue = previousLevel[index]
        var newAddition: Int
        let lastIndex = previousLevel.count-1
        if index == lastIndex {
            newAddition = 1
        } else {
            let secondValue = previousLevel[index+1]
            newAddition = firstValue + secondValue
        }
        newLevel.append(newAddition)
    }
    previousLevel = newLevel
    triangle.append(newLevel)
}

for level in triangle {
    print("\(level)\n")
}
