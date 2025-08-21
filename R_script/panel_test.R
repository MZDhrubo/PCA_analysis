head(data, 3)
data_panel_test <- read_excel("Data/panel_test.xlsx")

#checking data type
str(data_panel_test)

#change data type 
data_panel_test$Location <- as.factor(data_panel_test$Location)


# The variable Species (index = 5) is removed
# before PCA analysis
data_panel_test.pca <- PCA(data_panel_test[,-1], graph = FALSE)

fviz_pca_ind(data_panel_test.pca,
             geom.ind = "point", # show points only (nbut not "text")
             col.ind = data_panel_test$Location, # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07", "#3794bf"),
             addEllipses = TRUE, # Concentration ellipses
             legend.title = "Groups"
)

#use of BiPolot
fviz_pca_biplot(data_panel_test.pca, 
                col.ind = data_panel_test$Location, palette = "jco", 
                addEllipses = TRUE, label = "var",
                col.var = "black", repel = TRUE,
                legend.title = "Location")


#Graps for variables
var <- get_pca_var(data_waterbody.pca)
var

#finding the corelation using var
library("corrplot")
corrplot(var$cos2, is.corr=FALSE)
