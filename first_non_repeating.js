// Given a string s consisting of small English letters, find and return the first instance of a non-repeating character in it. If there is no such character, return '_'.

// Example

// For s = "abacabad", the output should be
// first_not_repeating_character(s) = 'c'.

// There are 2 non-repeating characters in the string: 'c' and 'd'. Return c since it appears in the string first.

// For s = "abacabaabacaba", the output should be
// first_not_repeating_character(s) = '_'.

// There are no characters in this string that do not repeat.

// [execution time limit] 4 seconds (js)

// [input] string s

// A string that contains only lowercase English letters.

// [output] char

// The first non-repeating character in s of '_' if there are no characters that do not repeat.



// MY NOTES

// Being that we need to find something - this probably means that we need to iterate or loop over the string
// next, we need to define the characters 


function first_not_repeating_character(s) {
  // Being that we need to find something - this probably means that we need to iterate or loop over the string
    for (let i = 0; i < s.length; i++) {
    // next we need to define the characters we looped over
    let char = s[i];
    // now we need to return only the first character that does not repeat
    // we can use the indexOf() method - because it represents a position where the specified search value occurs for the first time
    // it also returns -1 if the character never occurs again
    // with the indexOf() method we can check if the first occurrence of each character is ever repeated
    // if a particular first character occurrence is not repeated then we simply return that particular character
    // we can do this by s.indexOf()
    // else we return "_"
    if (s.indexOf(char) == i && s.indexOf(char, i + 1) == -1) {
      return char;
    }
  }
  return "_";
}