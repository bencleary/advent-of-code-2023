import Foundation

var calibrationValues: [Int] = []

func extractDigits(from calibration: String.SubSequence) -> String {
  var digits: [String] = []

  for char in calibration {
    if char.isNumber {
      digits.append(char.description)
    }
  }

  return [digits.first!, digits.last!].joined(separator: "")
}

if let inputText = try? String(contentsOfFile: "./files/input.txt") {
  for entry in inputText.split(separator: "\n") {
    let value = extractDigits(from: entry)
    if let calibrationValue = Int(value) {
      calibrationValues.append(calibrationValue)
    }
  }
  
  let sum = calibrationValues.reduce(0, +)

  print(sum)

} else {
  print("Failed to open file...")
}
