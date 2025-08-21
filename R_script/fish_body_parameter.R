head(data, 3)
data <- read.csv("Data/fish_body_parameters.csv")

#checking data type
str(data)

#change data type 
data$Location <- as.factor(data$Location)


# The variable Species (index = 5) is removed
# before PCA analysis
data.pca <- PCA(data[,-1], graph = FALSE)

fviz_pca_ind(data.pca,
             geom.ind = "point", # show points only (nbut not "text")
             col.ind = data$Location, # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07", "#3794bf"),
             addEllipses = TRUE, # Concentration ellipses
             legend.title = "Groups"
)

#use of BiPolot
fviz_pca_biplot(data.pca, 
                col.ind = data$Location, palette = "jco", 
                addEllipses = TRUE, label = "var",
                col.var = "black", repel = TRUE,
                legend.title = "Location")


#Graps for variables
var <- get_pca_var(data.pca)
var

#finding the corelation using var
library("corrplot")
corrplot(var$cos2, is.corr=FALSE)




