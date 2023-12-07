import Foundation


func extractNumbers(from calibration:String.SubSequence) -> String {
    var digits: [String] = []
    for char in calibration {
        if (char.isNumber) {
            digits.append(char.description)
        }
    }
    let number = [digits.first!, digits.last!]
    return number.joined(separator: "")
}

let inputText = try! String(contentsOfFile: "../files/input.txt")

var calibrationValues: [Int] = []

for entry in inputText.split(separator: "\n") {
    let value = extractNumbers(from: entry)
    if let calibrationValue = Int(value) {
        calibrationValues.append(calibrationValue)
    }
}

let sum = calibrationValues.reduce(0, +)

print(sum)