#' Positive words
#'
#' Example list of positive words. A "*" at the end allows any ending
#' (e.g. "happ*" matches happy and happiness).
#' @export
positive_words <- c("good", "great", "happ*", "joy*", "love*",
                    "hope*", "excit*", "grateful", "smil*", "better")
#' Negative words
#'
#' Example list of negative words. A "*" at the end allows any ending,
#' a "*" at the start allows any beginning (e.g. "*ache" matches headache).
#'
#' @export
negative_words <- c("sad*", "fatigue*", "bad", "overwhelm*", "anxi*", "lonel*",
                    "tired", "cry*", "worr*", "stress*", "*ache")
#'
#' Count how often words from a list appear in a text
#'
#' @param words Word vector from preprocess_text().
#' @param word_list A positive or negative word vector. "*" at the end
#'   allows any suffix; "*" at the start allows any prefix, if "*" is from both
#'   sides it means anywhere in the word .
#' @return A named vector - how many times each entry was found.
#'
#' @examples
#' words <- c("sad", "sadness", "happy", "unhappy")
#' compare_words(words, c("sad*", "*happy"))
#'
#' @export
compare_words <- function(words, word_list) {

  counts <- integer(length(word_list))
  names(counts) <- word_list

  for (i in seq_along(word_list)) {
    pattern <- word_list[i]

    star_at_start <- startsWith(pattern, "*")
    star_at_end   <- endsWith(pattern, "*")
    core <- gsub("*", "", pattern, fixed = TRUE)

    if (star_at_start && star_at_end) {
      hits <- grepl(core, words, fixed = TRUE)
    } else if (star_at_end) {
      hits <- startsWith(words, core)
    } else if (star_at_start) {
      hits <- endsWith(words, core)
    } else {
      hits <- words == core
    }

    counts[i] <- sum(hits)
  }

  return(counts)
}
