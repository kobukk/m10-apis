### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:

  
  
GetReview <- function (movie.input ) {
 
  # Replace all of the spaces in your movie title with plus signs (+)
  movie.no.spaces <- gsub(' ', '+', movie.input) 
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  base <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  
  api.key <- '&api-key=13535f512b1d4cd68deb9a30e8e3717a'
  
  request.url <- paste0(base, 'query=', movie.no.spaces, api.key)
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
 
  
  # Request data using your search query
  
  results <- fromJSON(request.url)
  
  # What type of variable does this return?
  
  # Flatten the data stored in the `$results` key of the data returned to you
  
  results.flattened <- flatten(results$results)
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  
  headline <- results.flattened$headline[1]
  short.summary <- results.flattened$summary_short[1]
  link.to.full<- results.flattened$link[1]
  
  info <- list(headline = headline, summary = short.summary, link = link.to.full)
  return(info)
  # Return an list of the three pieces of information from above
  }
GetReview('Almost Famous')
# Test that your function works with a movie of your choice

