#DATA
x <- sample(10:200, 10, replace = F)
x <- data.frame(Country= LETTERS[1:10], CrimeRate = x)

#COLORS
f.color <- colorRampPalette( c("white", "light grey","dodgerblue4"))
colors <- f.color( 10 ) # number of colors
colors <- as.character(colors)
colors <- colors[rank(x$CrimeRate)]




# Create two panels side by side
layout(matrix(c(rep(1,9), 2, 3, 3), nrow=3, ncol=4), widths=c(5,1))
# Set margins and turn all axis labels horizontally (with `las=1`)
par(mar=rep(.5, 4), oma=rep(3, 4), las=1)
barplot(x$CrimeRate,col=colors)

# Draw the color legend
par(mar=c(0,1,0,4))
image(matrix(1:10, ncol = 10, nrow= 1), col=colors, axes = F)
axis(4, at= seq(0,1, by=1/4), col = "grey", cex.axis = 1,  labels= c("High", "",  "Mid", "", "Low"))




######################################
#ANOTHER NICE PLOT

library(latticeExtra)
dat <- data.frame(x = rnorm(1000), y = rnorm(1000), z = rnorm(1000, mean = 1))
maxz <- max(abs(dat$z))
levelplot(z ~ x * y, dat, at = seq(-maxz, maxz, length = 100), panel = panel.levelplot.points, par.settings = custom.theme.2())

