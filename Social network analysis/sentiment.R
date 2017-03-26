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

sometext <- read.csv("C:/Users/kainth/Desktop/mining.csv")
print(sometext)

class_emo = classify_emotion(sometext, algorithm="bayes", prior=1.0)

emotion=class_emo[,7]

emotion[is.na(emotion)]="unknown"

class_pol= classify_polarity(sometext,algorithm="bayes")

polarity=class_pol[,4]

sent_df = data.frame(text=sometext,emotion=emotion,polarity=polarity,stringsAsFactors = "FALSE")

sent_df=within(sent_df,emotion <- factor(emotion,levels=names(sort(table(emotion),decreasing = "TRUE"))))
               
sent_df1=within(sent_df,polarity <- factor(polarity,levels=names(sort(table(polarity),decreasing = "TRUE"))))               



ggplot(sent_df,aes(x=emotion))+geom_bar(aes(y=..count..,fill=emotion))+scale_fill_brewer(palette="Dark2")+labs(x="emotion categories",y="number of tweets",title="classification based on emotion")

ggplot(sent_df1,aes(x=polarity))+geom_bar(aes(y=..count..,fill=polarity))+scale_fill_brewer(palette="Dark2")+labs(x="polarity categories",y="number of tweets",title="classification based on polarity")

#
##
#pie chart for sentiment analysis on twitter#
emotions <- read.csv("C:/Users/kainth/Desktop/emotion.csv")
table(emotions)
pie(table(emotions$emotion),col = brewer.pal(7,"Set1"))

#
##
# bar graph for sentiment anlysis on twitter#
counts <- table(emotions$emotion)
barplot(counts, main="classification based on emotion",
        xlab="emotion categories",ylab = "number of tweets") 




## bar graph for sentiment analysis##

df <- data.frame(emotion_categories=c("unknown", "joy", "sadness","surprise","anger","fear","disgust"),
                 number_of_tweets=c(800,300,100,50,50,20,20))
head(df)
p<-ggplot(df, aes(x=emotion_categories, y=number_of_tweets, fill=emotion_categories)) +
  geom_bar(stat="identity")+theme_minimal()
p