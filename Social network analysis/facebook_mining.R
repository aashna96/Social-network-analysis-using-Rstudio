library(Rfacebook)
library(httpuv)
library(RColorBrewer)
#
##

# on the basis of relationship status#
friend <- read.csv("C:/Users/kainth/Desktop/face.csv")
table(friend)
pie(table(friend$rel_status),col = brewer.pal(9,"Set1"))
#
#on the basis of gender#
pie(table(friend$gender),col = brewer.pal(9,"Set2"))