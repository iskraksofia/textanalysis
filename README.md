
# textanalysis

Analyses the mood of a text based on pre-identified positive and
negative words used in the text.

## Install

```r
devtools::install_github("YOUR-USERNAME/textanalysis")
```

## Try it

```r
library(textanalysis)

example_negative <- system.file("extdata", "Example_negative.txt",
                                package = "textanalysis")
text_mood_analysis(example_negative)
```

## How the functions work together

1. `preprocess_text()` reads the text file, changes all letters to
   lowercase and splits the text into separate words.
2. `compare_words()` compares these words to a list of positive or
   negative words and counts how many are found. A `*` in a list word
   allows any ending or beginning, e.g. `"overwhelm*"` matches
   *overwhelmed* and *overwhelming*.
3. `text_mood_analysis()` uses the two functions above to count the
   positive and negative words and calculates their ratio.

## Use your own word lists

```r
text_mood_analysis(example_negative,
                   negative = c(negative_words, "gloom*"))
```

See `?textanalysis` for more details.
```

