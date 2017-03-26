library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(wordcloud)
library(sentimentr)
library(SnowballC)
library(tm)
library(RColorBrewer)

data <- read.csv("C:/Users/kainth/Desktop/mining.csv")

mycorpus <- Corpus(VectorSource(data$Tweets))

mycorpus <- tm_map(mycorpus,PlainTextDocument)

mycorpus <- tm_map(mycorpus,removePunctuation)

mycorpus <- tm_map(mycorpus,removeWords,stopwords (kind="en"))

mycorpus <- tm_map(mycorpus,stemDocument)

pal <- brewer.pal(8,"Dark2")

wordcloud(mycorpus,min.freq = 2,max.words = Inf,width=1000,height=1000,random.order = FALSE,color=pal)

mycorpus <- tm_map(mycorpus,PlainTextDocument)