
library(fuzzyjoin)
library(dplyr)
library(plyr)

d<-stringdist_join(c,b , 
                by = "X1_1",
                mode = "left",
                ignore_case = FALSE, 
                method = "hamming", 
                max_dist = 0, 
                distance_col = "dist"
)%>%group_by(X1_1.x)%>%top_n(1, -dist)



colnames(d)[names(d) == 'X1_1.x'] <- 'X1_1'


k<-d[(d$X1_1 %in% a$X1_1),]


k$segment[k$V.Mean.Sum > 5]<- "Good"
k$segment[k$V.Mean.Sum < 5]<- "Bad"



gc<-length(which(k$V.Mean.Sum >5))

bc<-length(which(k$V.Mean.Sum <5))