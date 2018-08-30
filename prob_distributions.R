#code to plot binomial, normal, and poisson probability distributions

#created on 8/30/2018

#@ Benjamin Tayo

library(tidyverse)
N<-100
n<-1:N
p<-0.5
mean<-N*p
sd<-sqrt(N*p*(1-p))

pdat<-data.frame(n=c(n,n,n),prob=c(dbinom(n,N,p),dnorm(n,mean,sd),dpois(n,mean)),
                 type=sort(rep(c("binomial","normal","poisson"),times=N)))

#plot distributions on same graph
pdat%>%mutate(type=factor(type))%>%ggplot(aes(n,prob,color=type))+geom_point(size=2)+geom_line(size=0.75)

#plot distributions side by side
pdat%>%mutate(type=factor(type))%>%ggplot(aes(n,prob))+geom_point(size=2)+geom_line(size=0.75)+facet_wrap(~type)
