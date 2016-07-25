library(ggplot2)
install.packages("ggthemes")
library(ggthemes)
install.packages("tm")
library(tm)
install.packages("SnowballC")
library(SnowballC)
install.packages("RWeka")
library(RWeka)
install.packages("reshape")
library(reshape)

# input the raw corpus raw text
# you could read directly from @bfist's source : http://l.rud.is/10tUR65
a = readLines("C:/Users/Alcircle/Desktop/blog.txt")

# convert raw text into a Corpus object
# each line will be a different "document"
c = Corpus(VectorSource(a))

# clean up the corpus (function calls are obvious)
c = tm_map(c, tolower)
c = tm_map(c, removePunctuation)
c = tm_map(c, removeNumbers)

# remove common stopwords
c = tm_map(c, removeWords, stopwords())

# remove custom stopwords (I made this list after inspecting the corpus)
c = tm_map(c, removeWords, c("week","report","security","weeks","tuesday","update","team"))

# perform basic stemming : background: http://l.rud.is/YiKB9G
# save original corpus
c_orig = c

# do the actual stemming
c = tm_map(c, stemDocument)
c = tm_map(c, stemCompletion, dictionary=c_orig)















