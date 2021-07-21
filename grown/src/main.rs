use std::fs::File;
use std::io::{prelude::*, BufReader};

fn main() {
    let f = File::open("/usr/share/cracklib/cracklib-small").unwrap();
    let f = BufReader::new(f);

    let mut total: i32 = 0;
    let mut total_chars: f32 = 0.0;
    let mut longest_len: usize = 0;
    let mut longest: String = String::new();

    for line in f.lines() {
        let word = line.unwrap();
        let is_all_letters: bool = word.chars().all(|c| c.is_ascii_alphabetic());
        let is_long_enough: bool = word.len() > 2;
        let is_palindromic: bool = word == word.chars().rev().collect::<String>();

        if is_all_letters && is_long_enough && is_palindromic {
            total += 1;
            total_chars += word.len() as f32;
            if word.len() >= longest_len {
                longest_len = word.len();
                longest = word;
            }
        }
    }

    println!("Found {} total palindromes", total);
    println!("Average palindrome length: {}", total_chars / total as f32);
    println!("Longest palindrome length: {}", longest_len);
    println!("Longest palindrome: {}", longest);
}
