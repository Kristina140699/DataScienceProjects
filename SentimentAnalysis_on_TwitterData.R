## Sentiment Analysis Project using R programming Language

#URL of my dataset:
#https://www.kaggle.com/datasets/cosmos98/twitter-and-reddit-sentimental-analysis-dataset


### 1.Sentiment Analysis on the Data of Twitter



#applying the required library
library(syuzhet)

#Import and Read the data
twitter <- read.csv('C:/Users/Hp1/Downloads/Twitter_Data.csv')

#Store the data in character format
tweet <- as.character(twitter$clean_text)
#View(tweet)

#Obtain Sentiment Score
get_nrc_sentiment('Happy')
get_nrc_sentiment('Abuse')

#store this dataset into new variable
t1 <- get_nrc_sentiment(tweet)
t1

#Combine Text and Sentiment Columns
twitter_sentiment <- cbind(twitter$clean_text, t1)

#Bar Plot for Sentiments

barplot(colSums(t1), xlab = "Twitter Sentiments",
        ylab = "Count", col = rainbow(10), main= "Twitter Sentiment Analysis",
        col.axis = "black",
        col.lab = "black")

#Pie Plot
# creating pie chart
pie(colSums(t1), xlab = "Twitter Sentiments",
    ylab = "Count", col = rainbow(10), main= "Twitter Sentiment Analysis", radius = -1,
    col.axis = "black",
    col.lab = "black")

library(plotrix)
#3d Pie Plot

names(colSums(t1)) <- c("anger", "anticipation", "digust", "fear", "joy", "sadness", "surprise", "trust", "negative")
pie3D(colSums(t1),main="Twitter Sentiment Analysis", labels=names(colSums(t1)))


#Scatter Plot
# plotting
plot(colSums(t1), col = rainbow(10), ylab = 'Count', main= "Twitter Sentiment Analysis")

library("scatterplot3d")
scatterplot3d(t1)
