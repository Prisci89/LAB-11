####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

##########################################################################################
# LABORATORIO 4: Visión clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -Árbol de expansión máxima- (asegurar una visión clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como máximo
# Regla 2: Quitar las conexiones con el peso más bajo, nos vamos quedar con las del peso máximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------


# 1.Cómo crear una Visión clara del espacio-producto: árbol de expansión máxima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

library(EconGeo)
#cargar paquete


file.choose()
# ubicar archivo

M = as.matrix(
  read.csv("C:\\Users\\Usuario\\OneDrive\\Escritorio\\DOCTORADO\\DRA. CARLA-COMPLEJIDAD ECONÓMICA\\LABS\\LAB 11\\INPUT\\relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

#PARA DIMENSIONAR LA MATRIZ
head (M[,1:10])
dim (M)



#Importar matriz "relatednessbinario.csv"



library (igraph)
red_hidalgo1<-graph.adjacency(M,mode = "undirected",weighted = TRUE)
plot(red_hidalgo1)




#grafica la matriz de proximidades natural
M<--M
head(M[,1:6])




#Transforma la matriz en en NEGATIVA y para identificar los máximos
red_hidalgo2<-graph.adjacency(M,mode="undirected",weighted = TRUE)
MST<-minimum.spanning.tree(red_hidalgo2)
plot(MST,vertex.shape="none",vertex.label.cex=.7)


#grafica la nueva matriz negativa con MST





#nodos n-1
write.graph(MST,file = "redhidalgo2.gml",format = "gml")



# matriz de proximos adyaentes (nuevo relacionamiento)
A<-get.adjacency(MST,sparse = F)




#exportar LISTA DE EDGE


#exportar matriz de proximos adyacentes
write.csv(A,file = "AdyacetesCorMST.csv")
