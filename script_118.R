setwd("C:/Users/miaou/OneDrive/Bureau/align16/biodata/exons/trees")
library(ape)
library(phytools)

#faire une boucle pour lire tous les arbres en même temps
fichiers <- list.files("C:/Users/miaou/OneDrive/Bureau/align16/biodata/exons/trees/")
i = 1
for (i in fichiers) {
  arbres <- read.tree(file=paste("C:/Users/miaou/OneDrive/Bureau/align16/biodata/exons/trees/",i, sep = ""))
  vecteur <- arbres$tip.label
  vecteur
  species <- c("Homo_sapiens", "Mus_musculus", "Macaca_fascicularis", "Rattus_norvegicus")
  tree_clean <- keep.tip(arbres, species)
  #plot(tree_clean)    #juste pour ne pas faire ramer l'ordinateur
  #taux d'évolution ???
  
  #médiane
  median(tree_clean, na.rm = FALSE)
  
}

#tests
median(tree_clean, na.rm = FALSE)
quantile(tree_clean, probs = (0.05))
quantile(tree_clean, probs = (0.95))


#faire l'arbre et l'afficher
tree = read.tree("AAA.rootree")
plot(tree, type = "f", root.edge = TRUE)
truc <- plot(tree, cex = 0.7)

#???
mrca <- getMRCA(tree_clean, tree_clean$tip.label)
mrca

tree$tip.label    #nom des espèces
tree$edge.length  #longueur des branches
tree$edge         #identité des branches d'un noeud à un autre

#pour enlever une branche 
tree2 <- drop.tip(tree, "Choloepus_hoffmanni") 
tree2$tip.label

#pour nommer les trucs
plot <- plotTree(tree)
nodelabels(plot)

#faire l'arbre avec les 4 valeurs
species <- c("Homo_sapiens", "Mus_musculus", "Macaca_fascicularis", "Rattus_norvegicus")
tree_clean <- keep.tip(tree, species)
plot(tree_clean)


