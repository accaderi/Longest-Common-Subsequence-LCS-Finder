# Longest Common Subsequence (LCS) Algorithm

## Overview

The Longest Common Subsequence (LCS) problem is a classic problem in computer science and bioinformatics. Given two sequences, the LCS problem aims to find the longest subsequence present in both of them. A subsequence is a sequence derived by deleting some or no elements without changing the order of the remaining elements.

This document provides an explanation of how the Longest Common Subsequence (LCS) algorithm works, including a detailed example, the final L matrix, and the backtracking algorithm for finding all possible LCS solutions.

## Algorithm Description

1. **Initialize the Matrix**:
   - Create a matrix `L` of size `(m+1) x (n+1)` where `m` is the length of string `a` and `n` is the length of string `b`. Initialize all elements to 0.

2. **Fill in the Matrix**:
   - Iterate through each character of the strings `a` and `b`.
   - For each pair of characters, update the matrix `L` as follows:
     - If `a[i] == b[j]`, then `L[i + 1, j + 1] = L[i, j] + 1`
     - Otherwise, `L[i + 1, j + 1] = max(L[i + 1, j], L[i, j + 1])`

3. **Final Matrix**:
   - The value at `L[m, n]` will be the length of the longest common subsequence.

4. **Bactracking Finding all LCS solutions**
    - Find all Longest Common Subsequences (LCS) from the provided `L` matrix


## Example for item 3.

Consider the following example:

- `a = "ABCBDAB"` (length 7)
- `b = "BDCAB"` (length 5)

### Initialize the Matrix

The matrix `L` is initially filled with zeros and has dimensions `(8 x 6)`:

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **C** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **D** | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |

### Fill in the Matrix

#### Row 1 (i = 1, comparing a[1] = 'A'):

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 1 | 1 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **C** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **D** | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |

#### Row 2 (i = 2, comparing a[2] = 'B'):

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 1 | 1 |
| **B** | 0 | 1 | 1 | 1 | 1 | 2 |
| **C** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **D** | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |

...

### Final Matrix

The final L matrix is:

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 1 | 1 |
| **B** | 0 | 1 | 1 | 1 | 1 | 2 |
| **C** | 0 | 1 | 1 | 2 | 2 | 2 |
| **B** | 0 | 1 | 1 | 2 | 2 | 3 |
| **D** | 0 | 1 | 2 | 2 | 2 | 3 |
| **A** | 0 | 1 | 2 | 3 | 3 | 3 |
| **B** | 1 | 2 | 2 | 3 | 3 | 4 |

Here, `L[7, 5] = 4` indicates that the length of the longest common subsequence between `a` and `b` is 4.

### Logic explanation
When computing the LCS matrix for:

- `a = "ABCBDAB"`
- `b = "BDCAB"`

We start by comparing `a` with `b`.

First we compare `'A'` with `b` using the following logic:

`'A'` vs `'B'`, then `'A'` vs `'BD'`, and so on.

In the next row, we compare `'AB'` with `b` again.
This means we check the subsequence `'AB'` against `'B'`, then `'AB'` against `'BD'`, and so forth. This way, we build upon the results from the previous row to compute the LCS values for progressively longer prefixes of `a`.

The process continues in this manner, ensuring that each entry in the matrix represents the length of the LCS for the corresponding prefixes of `a` and `b`.

Consider the following example:

### Row 3 (i = 3, comparing a[3] = 'C'):

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 1 | 1 |
| **B** | 0 | 1 | 1 | 1 | 1 | 2 |
| **C** | 0 | 1 | 1 | 2 | 2 | 2 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |
| **D** | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 0 | 0 |
| **B** | 0 | 0 | 0 | 0 | 0 | 0 |

### Row 3 (i = 3, comparing `a[3] = 'C'` to `b`)
(we are really comparing `a[1-3] with b[1], b[1-2], b[1-3] ... b[1-5]`)

1. **Cell `(3, 1)` (Comparing `'C'` to `'B'`)**:
   - `'C'` does not match `'B'`. Therefore, we take the number from the cell directly above it, as the LCS length for `"ABC"` and `"B"` is already 1:
     - From above: `L[2][1] = 1`
   - Hence, `L[3][1] = 1`.

2. **Cell `(3, 2)` (Comparing `'C'` to `'D'`)**:
   - `'C'` does not match `'D'`. Therefore, we take the maximum value from either the cell directly above it or the cell to the left, as this is the length of the LCS for `"ABC"` and `"DB"` which is 1:
     - From above: `L[2][2] = 1`
     - From the left: `L[3][1] = 1`
   - Hence, `L[3][2] = max(1, 1) = 1`.

3. **Cell `(3, 3)` (Comparing `'C'` to `'C'`)**:
   - `'C'` matches `'C'`. Therefore, we add 1 to the length of the LCS for `"ABC"` and `"BD"`:
     - From diagonally up and left: `L[2][2] = 1`
   - Hence, `L[3][3] = L[2][2] + 1 = 1 + 1 = 2`.

4. **Cell `(3, 4)` (Comparing `'C'` to `'A'`)**:
   - `'C'` does not match `'A'`. Therefore, we take the maximum value from either the cell directly above it or the cell to the left, as this is the length of the LCS of `"ABC"` and `"BDA"` which remains 2:
     - From above: `L[2][4] = 1`
     - From the left: `L[3][3] = 2`
   - Hence, `L[3][4] = max(1, 2) = 2`.

5. **Cell `(3, 5)` (Comparing `'C'` to `'B'`)**:
   - `'C'` does not match `'B'`. Therefore, we repeat the logic of item 4, taking the maximum value from either the cell directly above it or the cell to the left:
     - From above: `L[2][5] = 2`
     - From the left: `L[3][4] = 2`
   - Hence, `L[3][5] = max(2, 2) = 2`.

The LCS matrix provides a way to determine the length of the longest common subsequence between two strings. By tracing back from the final entry of the matrix, one can reconstruct the actual longest common subsequences.

## Example for item 4. (Backtracking to Collect All LCS)

To find all Longest Common Subsequences (LCS) from the provided `L` matrix, follow these steps:

### 1. Identify the Matrix

The final `L` matrix is:

|     |   | B | D | C | A | B |
|-----|---|---|---|---|---|---|
|     | 0 | 0 | 0 | 0 | 0 | 0 |
| **A** | 0 | 0 | 0 | 0 | 1 | 1 |
| **B** | 0 | 1 | 1 | 1 | 1 | 2 |
| **C** | 0 | 1 | 1 | 2 | 2 | 2 |
| **B** | 0 | 1 | 1 | 2 | 2 | 3 |
| **D** | 0 | 1 | 2 | 2 | 2 | 3 |
| **A** | 0 | 1 | 2 | 3 | 3 | 3 |
| **B** | 1 | 2 | 2 | 3 | 3 | 4 |

### 2. Backtrack Function

Implement a recursive backtracking function to traverse from the bottom-right corner of the matrix (`L[m, n]`, where `m` is the length of `a` and `n` is the length of `b`). Move to the adjacent cells based on the following conditions:

- **When Characters Match:**
  If `a[i] == b[j]`, the LCS includes the character at position `a[i]` or `b[j]`. Move diagonally up-left to `(i-1, j-1)` and append the character to the current LCS path.

- **When Characters Do Not Match:**
  If `a[i] != b[j]`, move to the cell that has the maximum value of:
  - The cell directly above `(i-1, j)`, or
  - The cell directly to the left `(i, j-1)`.

  If both cells have the same value, explore both paths recursively to collect all possible LCS.

### 3. Detailed Backtracking Example

- **Starting Point:**
  Begin at `L[7, 5]` with the value `4`, indicating the length of the LCS.

- **Trace Path:**
  - At `L[7, 5]`, the value is `4`. The characters `a[6]` (`'B'`) and `b[4]` (`'B'`) match. Move to `L[6, 4]` and include `'B'` in the LCS.

  - At `L[6, 4]`, the value is `3`. Characters `a[5]` (`'A'`) and `b[3]` (`'A'`) match. Move to `L[5, 3]` and include `'A'`.

  - Continue this process:
    - At L[5, 3], move to L[4, 2] if the characters match. If they don’t, explore the cells with the maximum value, either the one to the left or the one above. If the values are equal, explore both paths.
    - At `L[4, 2]`, move to `L[3, 1]`.
    - At `L[3, 1]`, move to `L[2, 0]`.

  - Collect all possible LCS paths by exploring different routes based on matching conditions.

### 4. Handle All Paths

Collect all unique subsequences that reach the top-left of the matrix. Each valid path through the matrix that accumulates the maximum length represents a potential LCS.

### 5. Return Results

Finally, return all unique LCS found during the backtracking process.

This backtracking ensures that you explore all possible LCS by considering both character matches and non-matches, making it possible to handle multiple longest common subsequences efficiently.

In this example the actual LCS could be `"BCAB"` or `"BDAB"` (both are valid).







