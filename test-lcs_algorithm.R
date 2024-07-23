# Source the main code
source("lcs_algorithm.R")

# Test function
test_lcs <- function() {
  test_cases <- list(
    list(a = "ABCBDAB", b = "BDCAB", expected = c("BCAB", "BDAB")),
    list(a = "AGGTAB", b = "GXTXAYB", expected = c("GTAB")),
    list(a = "ABC", b = "DEF", expected = c("")),
    list(a = "AAB", b = "ABA", expected = c("AA", "AB")),
    list(a = "", b = "ANYTHING", expected = c("")),
    list(a = "ANYTHING", b = "", expected = c("")),
    list(a = "", b = "", expected = c(""))
  )
  
  for (case in test_cases) {
    print(paste("Testing case: a =", case$a, ", b =", case$b))
    result <- longest_common_subsequence(case$a, case$b)
    if (!all(result %in% case$expected)) {
      print(paste("Test failed. Expected:", paste(case$expected, collapse = ", "), "but got:", paste(result, collapse = ", ")))
    } else {
      print(paste("Test passed. Result:", paste(result, collapse = ", ")))
    }
    print("---")
  }
}

# Run the tests
test_lcs()