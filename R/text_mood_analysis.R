#' Summarise positive and negative words in a text file
#'
#' @param file_path Path to the text file.
#' @param positive Positive word vector. Defaults to positive_words, but can
#' be replaced by user to any other prefered words.
#' @param negative Negative word vector. Defaults to negative_words, but can
#' be replaced by user to any other prefered words.
#' @return A list with the number of positive and negative words,
#'   the positive/negative ratio and the matches for each list entry.
#'
#' @examples
#' #Example diary included in the package
#' example_negative <- system.file("extdata", "Example_negative.txt",
#'                                 package = "textanalysis")
#' text_mood_analysis(example_negative)
#'
#' @export
text_mood_analysis <- function(file_path,
                              positive = positive_words,
                              negative = negative_words) {

# Use the first function to get the words
  words <- preprocess_text(file_path)

# Use the second function once for each list
  pos_counts <- compare_words(words, positive)
  neg_counts <- compare_words(words, negative)

  n_pos <- sum(pos_counts)
  n_neg <- sum(neg_counts)

# Ratio; avoid dividing by zero
  if (n_neg == 0) {
    ratio <- if (n_pos == 0) NA else Inf
  } else {
    ratio <- n_pos / n_neg
  }

# Print a short report for the user
  cat("Total words:   ", length(words), "\n")
  cat("Positive words:", n_pos, "\n")
  cat("Negative words:", n_neg, "\n")
  cat("Pos/neg ratio: ", round(ratio, 2), "\n")

# Return the numbers so they can be used later
  invisible(list(positive = n_pos,
                 negative = n_neg,
                 ratio = ratio,
                 positive_matches = pos_counts[pos_counts > 0],
                 negative_matches = neg_counts[neg_counts > 0]))
}

