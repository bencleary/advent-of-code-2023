use std::collections::HashMap;

use regex::Regex;

fn day1(s: &str) -> u32 {
    let re_first =
        Regex::new(r"\d|(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine)").unwrap();
    let re_last =
        Regex::new(r".*(\d|(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine))")
            .unwrap();
    let digits = HashMap::from([
        ("one", 1),
        ("two", 2),
        ("three", 3),
        ("four", 4),
        ("five", 5),
        ("six", 6),
        ("seven", 7),
        ("eight", 8),
        ("nine", 9),
    ]);

    let d = re_first.find(s).unwrap().as_str();
    let first = u32::from_str_radix(d, 10).unwrap_or_else(|_| digits[d]);
    let last_match = re_last.captures(s).unwrap();
    let d = last_match.get(1).unwrap().as_str();
    let last = u32::from_str_radix(d, 10).unwrap_or_else(|_| digits[d]);

    first * 10 + last
}

fn main() {
    let mut found_numbers = Vec::<u32>::new();
    let input = std::fs::read_to_string("./files/input.txt").unwrap();
    input.split("\n").into_iter().for_each(|s| {
        let parsed = day1(s);
        println!("{}", parsed);
        // println!("{}", number);
        found_numbers.push(parsed);
    });
    println!("{}", found_numbers.iter().sum::<u32>());
}
