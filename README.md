# My_grep: Custom `grep` Command

`mygrep.sh` is a simple custom implementation of the popular `grep` command in Linux, designed to search for strings in text files and display matching or non-matching lines. It includes several command-line options for enhanced functionality.

## Features
- Search for a string (case-insensitive)
- Print matching lines from a text file
- Supports the following options:
  - `-n` → Show line numbers for each match
  - `-v` → Invert the match (print lines that **do not** match)
  - Combinations of options like `-vn` and `-nv` work the same
- Handles invalid inputs and provides feedback when required arguments are missing
- Mimics the basic functionality of the `grep` command in a simplified manner

## Command Usage

To use the script, simply run the following command:

```bash
./mygrep.sh <search_string> <file>
