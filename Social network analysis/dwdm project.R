library("sand")
library("rgl")
library("igraph")
#
g <- graph.formula(1-5,1-7,2-9,2-4,3-5,4-5,4-6,4-7,5-6,6-7,7-8,8-9)
g
#
g_2 <- graph.formula(1-7,1-11,2-9,2-4,3-5,4-5,4-6,4-7,5-6,6-7,7-8,8-9,9-11)
g_2
V(g)
E(g)
str(g)
plot(g)
##
#
V(g_2)
E(g_2)
str(g_2)
plot(g_2)

#3D plot
rglplot(g)
rglplot(g_2)

#Another graph/Network created
g1 <- make_lattice(c(5,5,5))
coords <- layout_with_fr(g1, dim=3)
rglplot(g1, layout=coords)
str(g1)
g1

##
g2 <- make_lattice(c(3,3,3))
coords <- layout_with_fr(g2, dim=3)
rglplot(g2, layout=coords)
str(g2)
##
# #Directional graph code1
dg <- graph.formula(Sam-+Mary , Sam-+Tom , Mary++Tom , ADAM-+SAMMY , JAKE-+BRAIN)
coords_dg <- layout_with_fr(dg, dim=3)
rglplot(dg, layout=coords_dg)
str(dg)

ig_96 <- read.csv("C:/Users/kainth/Desktop/net_analysis.csv")
ig_97 <- graph.incidence(ig_96 , mode=c("all"))
str(ig_97)
plot(ig_97)

V(ig_97)$color[1:10] = rgb(red=1 , green = 0 , blue = 0,alpha = 0.5)
V(ig_97)$color[5]
V(ig_97)$color[4]

E(ig_97)$color=rgb(.5,.5,0,.2)

t <- system.time({pdf("ig_97_2.pdf")
                plot(ig_97 , layout=layout.fruchterman.reingold)
                dev.off() })
t
#
t3_t <- system.time({coords_ig_97 <- layout_with_fr(ig_97 , dim=3)
                   rglplot(ig_97 , layout=coords_ig_97) })
t3_t
#
