# Longest Common Subsequence (LCS) Finder

This repository contains an R function to compute the Longest Common Subsequence (LCS) between two strings. The function follows a dynamic programming approach to build a matrix and then uses recursive backtracking to find all possible LCSs.

## How It Works

### Matrix Construction

The `L` matrix is built in a bottom-up manner to store the lengths of the longest common subsequence:

1. Initialize a matrix `L` of dimensions `(m+1) x (n+1)`, where `m` is the length of the first string and `n` is the length of the second string.
2. Populate the matrix:
   - If characters match (`a[i] == b[j]`), set `L[i+1][j+1] = L[i][j] + 1`.
   - If characters do not match, set `L[i+1][j+1] = max(L[i+1][j], L[i][j+1])`.

### Recursive Backtracking

The recursive function `find_all_lcs` is used to backtrack and find all LCS:

1. If characters match, move diagonally up-left in the matrix.
2. If characters do not match, move to the direction with the larger value (up or left). If values are equal, explore both paths.
3. Continue until the beginning of either string is reached.

### Handling Edge Cases

When either string is exhausted (`i == 0 || j == 0`), the function returns an empty string.

### Result Collection

The `longest_common_subsequence` function calls `compute_lcs` and processes the result to reverse the LCS strings to match the expected order.