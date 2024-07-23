# Function to compute LCS using given matrix dimensions
compute_lcs <- function(a, b) {
  m <- nchar(a)
  n <- nchar(b)
  
  # Handle case where either string is empty
  if (m == 0 || n == 0) return(list(""))
  
  # Create a matrix to store lengths of longest common subsequence
  L <- matrix(0, nrow = m + 1, ncol = n + 1)
  
  # Building the matrix in bottom-up way
  for (i in 1:m) {
    for (j in 1:n) {
      if (substr(a, i, i) == substr(b, j, j)) {
        L[i + 1, j + 1] <- L[i, j] + 1
      } else {
        L[i + 1, j + 1] <- max(L[i + 1, j], L[i, j + 1])
      }
    }
  }
  
  # Recursive function to find all LCS
  find_all_lcs <- function(i, j) {
    if (i == 0 || j == 0) return(list(""))
    if (substr(a, i, i) == substr(b, j, j)) {
      prev_lcs <- find_all_lcs(i - 1, j - 1)
      return(lapply(prev_lcs, function(lcs) paste0(lcs, substr(a, i, i))))
    } else {
      lcs_set <- list()
      if (L[i, j + 1] > L[i + 1, j]) {
        lcs_set <- find_all_lcs(i - 1, j)
      } else if (L[i, j + 1] < L[i + 1, j]) {
        lcs_set <- find_all_lcs(i, j - 1)
      } else {
        lcs_set <- c(find_all_lcs(i - 1, j), find_all_lcs(i, j - 1))
      }
      return(unique(lcs_set))
    }
  }
  
  # Start the backtracking from the bottom-right corner of the matrix
  all_lcs <- find_all_lcs(m, n)
  return(unique(all_lcs))
}

# Main function to handle LCS calculation
longest_common_subsequence <- function(a, b) {
  lcs <- compute_lcs(a, b)
  return(lcs)
}

