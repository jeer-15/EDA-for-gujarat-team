library(dplyr)
library(lattice)
library(ggplot2)
library(plyr)
library(readr)

df=read_csv("ipl dataset.csv")
summary(df)
histogram(~first_ings_score,data=df,col=c("yellow","red"))
histogram(~second_ings_score,data=df,col=c("pink","red"))

count(df,'match_winner')

df2=subset(df,match_winner=='Gujarat')

df2$toss_decision[df2$toss_decision=='Field']=0
df2$toss_decision[df2$toss_decision=='Bat']=1

df2 %>% ggplot(aes(toss_decision))+ geom_bar(stat="Count",fill='#1d30db')

df3=subset(df2,toss_decision==0)
df4=subset(df2,toss_decision==1)

df3 %>% ggplot(aes(venue))+ geom_bar(stat="Count",fill='#1ddba5')+ scale_x_discrete(guide = guide_axis(angle = -90))
df4 %>% ggplot(aes(venue))+ geom_bar(stat="Count",fill='#dbd51d')+scale_x_discrete(guide = guide_axis(angle = 90))

df5=rbind(df3,df4)
boxplot(first_ings_score~toss_decision,data=df5,fill='#db401d')
boxplot(second_ings_score~toss_decision,data=df5)
plot(x=df5$first_ings_score, y=df5$second_ings_score)

