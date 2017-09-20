## Zipf's Law in Language
*Shiny Application written for STAT360*

This application helps visualize how Zipf's Law appears in various language corpora.

**Overview**
Zipf's Law is an inverse power law distribution that appears to describe a wide range of phenomena, from the magnitudes of earthquakes to the numbers of academic paper citations to the frequency of words in natural language. Simply put, it states that the frequency of events are inversely proportional to their ranks (i.e. their ordered magnitudes). In the case of language, for example, the second-most common word appears about half as often as the most common word, and the third-most common word about one third as often, and so on. Zipf's Law's simplicity and effectiveness has made it the subject of research into why and how it appears in different domains.

**Shiny App**
This app was used in a presentation on Zipf's Law to help visualize how it appears in various language corpora. The corpora used were: 1) Professor's webpage, 2) A selection of children's books about cats, 3) Charles Dickens' works, 4) The Brown Corpus, and 5) Chapter One of the Count of Monte Cristo, in French. The log-log scale helps visualize the power relationship, and the Zipf-Mendelbrot distribution is calculated using the ZipfR package. All the corpora seem to roughly follow Zipf's Law.
