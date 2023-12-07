import Foundation

let calibrationWords: [String: Int] = [
  "one": 1,
  "two": 2,
  "three": 3,
  "four": 4,
  "five:": 5,
  "six": 6,
  "seven": 7,
  "eight": 8,
  "nine": 9
]

var calibrationValues: [Int] = []

let testString = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

let pattern = #"(\d+)"#

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
