# Loading the required libraries.
# install.packages('recommenderlab')
# install.packages('usdata')
# install.packages('factoextra')
# install.packages('fossil')
library(recommenderlab)
library(usdata)
library(cluster)
library(factoextra)
library(dendextend)
library(dplyr)
library(tidyr)
library(fossil)
# install.packages('recmetrics')
# library(recmetrics)


# Loading the data and taking a look at it. 
data('MovieLense')
ml <- MovieLense

# Splitting the data into Training and Testing sets.
iter <- sample(1:nrow(ml),0.8*nrow(ml))
train_set <- ml[iter,]
test_set <- ml[-iter,]

# Building the Recommendation engine.
recommender_engine <- Recommender(train_set, method='UBCF')

# Predictions with test data. 
recc_pred <- predict(recommender_engine, newdata = test_set,n=10)
recc_pred

#Recommendations as ‘topNList’ with n = 10 for 189 users. 

# Trying it out with 3 demo users. 
# User-1
user1 <- recc_pred@items[[1]]
movie_titles1 <- recc_pred@itemLabels[user1]
cat('Top 10 Recommendations:',paste(movie_titles1, collapse = "\n"),'\n')

# Top 10 Recommendations: Marvin's Room (1996)
# Close Shave, A (1995)
# Grumpier Old Men (1995)
# Homeward Bound II: Lost in San Francisco (1996)
# Amistad (1997)
# Die Hard: With a Vengeance (1995)
# Big Lebowski, The (1998)
# Fallen (1998)
# Local Hero (1983)
# C'est arrive pres de chez vous (1992) 


# User-35
user35 <- recc_pred@items[[35]]
movie_titles35 <- recc_pred@itemLabels[user35]
cat('Top 10 Recommendations:',paste(movie_titles35, collapse = "\n"),'\n')

# Top 10 Recommendations: Bogus (1996)
# Bulletproof (1996)
# Shall We Dance? (1996)
# When We Were Kings (1996)
# Edge, The (1997)
# Silence of the Lambs, The (1991)
# Schindler's List (1993)
# While You Were Sleeping (1995)
# Ace Ventura: Pet Detective (1994)
# Maverick (1994) 


# User-78
user78 <- recc_pred@items[[78]]
movie_titles78 <- recc_pred@itemLabels[user78]
cat('Top 10 Recommendations:',paste(movie_titles78, collapse = "\n"),'\n')

# Top 10 Recommendations: Men in Black (1997)
# French Kiss (1995)
# Paradise Lost: The Child Murders at Robin Hood Hills (1996)
# Four Days in September (1997)
# Sweet Hereafter, The (1997)
# Hugo Pool (1997)
# Tango Lesson, The (1997)
# Star Kid (1997)
# That Darn Cat! (1997)
# Shadow Conspiracy (1997) 