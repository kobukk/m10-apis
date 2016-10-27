### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd("~/Desktop/Info Class Modules/m10-apis/exercise-2")


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist

Top10.Tracks <- function (artist) {
  
  base <- 'https://api.spotify.com/v1/'
  
  search <- paste0('search?q=', artist)
  type <- '&type=artist'
  
  query.url <- paste0(base, search, type)
  
  artist.information <- fromJSON(query.url)
  
  artist.id <- artist.information$artists$items$id[1]
  
  
  top.tracks.url <- paste0(base, 'artists/', artist.id, '/top-tracks?country=US' )
  
  top.tracks <- fromJSON(top.tracks.url)
  
  return(top.tracks$tracks)
}

Top10.Tracks('Drake')


# What are the top 10 tracks by Nelly?




### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

