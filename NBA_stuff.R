## NBA stuff

fp<-file.path(getwd(),"R","nba_ceil_floor.csv")
player_stats <- read.csv(file = fp, header=TRUE, sep=",")
floor_cost <-player_stats$Floor/player_stats$Salary
ceil_cost <-player_stats$Ceil/player_stats$Salary
player_stats <- cbind(cbind(player_stats,floor_cost),ceil_cost)

top_plays <-player_stats[player_stats$floor_cost>3 & player_stats$ceil_cost > 4,]
top_plays_pg<-subset(top_plays,top_plays$Pos =="PG")

plot(top_plays[,c("Salary","Floor")])
text(top_plays$Salary,top_plays$Floor,top_plays$Player)
abline(lm(top_plays$Floor~top_plays$Salary),col="red",lwd=1.5)


plot(top_plays_pg[,c("Salary","Floor")])
text(top_plays_pg$Salary,top_plays_pg$Floor,top_plays_pg$Player)
abline(lm(top_plays_pg$Floor~top_plays_pg$Salary),col="red",lwd=1.5)

player_pos <- split(player_stats,player_stats$Pos) 
lapply(player_pos,function(player_pos) max(player_pos$C))
lapply(player_pos,function(x) mean(x$Salary))