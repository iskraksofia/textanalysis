#' Read a text file and split it into words
#'
#' Loads a text file with read.delim(), converts it to lowercase,
#' removes punctuation (stopwords) and returns one word per element.
#'
#' @param file_path Path to the text file, e.g. "data/mytext.txt".
#' @param stopwords Characters to remove. Default: . , ; : ! ?
#' @return A character vector with one word per element.
#' @examples
#'example_negative <- system.file("extdata", "Example_negative.txt",
#'                                 package = "textanalysis")
#' words <- preprocess_text(example_negative)
#' head(words)
#'
#' @importFrom utils read.delim
#' @importFrom stringr str_to_lower
#' @export
preprocess_text <- function(file_path,
                            stopwords = c(".", ",", ";", ":", "!", "?")) {

# 1. Load the file
  text <- read.delim(file_path, header = FALSE, quote = "",
                    stringsAsFactors = FALSE)

# 2. Remove the spaces between the lines and put all lines into one long string
  one_string <- paste(unlist(text), collapse = " ")

# 3. Change uppercase -> lowercase
  one_string <- str_to_lower(one_string)

# 4. Remove stopwords
  for (sw in stopwords) {
    one_string <- gsub(sw, " ", one_string, fixed = TRUE)
  }

# 5. Split on spaces so each word becomes its own element
  words <- strsplit(one_string, " ", fixed = TRUE)[[1]]

# 6. Drop the empty strings left by double spaces
  words <- words[words != ""]

  return(words)
}



