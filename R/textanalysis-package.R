#' textanalysis
#'
#' The package analyses the mood of the text based on the pre-identified
#' negative and positive words used in the text.
#'
#' @details
#' The functions work together in three steps:
#'
#' 1. preprocess_text() reads the text file, changes all letters to
#' lowercase and splits the text into separate words.
#'
#' 2. compare_words() compares these words to a list of positive or
#' negative words and counts how many are found.
#'
#' 3. text_mood_analysis() uses the two functions above to count the
#' positive and negative words and tells you their ratio in the text.
#'
#'@section Example data:
#' The package includes an example diary text. To try the package, run:
#' \code{text_mood_analysis(system.file("extdata", "Example_negative.txt",
#' package = "textanalysis"))}
#'
#' @author Sofiia Iskrak

## usethis namespace: start
## usethis namespace: end
"_PACKAGE"
