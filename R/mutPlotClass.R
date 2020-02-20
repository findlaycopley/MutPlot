#' Run the whole pipeline start to finish
#' This function will take a dataframe with sample, chr, start.pos, end.pos and call.
#' It will create an instance of the CNVvault class
#' Then it will order this class based on the total amount of the geneome editted.
#' Then it will generate the positions for each sample on the y-axis
#' Then it will plot the output
#' @param mutationData dataframe of variant calls
#' @param plots Description
#' @param geneList Description
#' @param plotData Description
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' Mut <- MutationPlot()
#'

MutationPlot <- setClass("MutationPlot",
                         slots = c(mutationData = "data.frame",
                                   plots="list",
                                   genelist="table",
                                   plotdata="list"))

setMethod("show", "MutationPlot",
          function(object) {
                  if (is.ggplot(object@plots$FinalPlot)) {
                          print(object@plots$FinalPlot)
                  } else {
                          cat("This is an instance of MutationPlot","\n")
                          cat("Samples:",
                              object@plotdata$SampleData$SampleCol %>%
                                      levels(),
                              "\n")
                          cat("Genes:",
                              object@plotdata$GeneData$GeneCol %>%
                                      levels(),
                              "\n")
                          cat("Number of Mutations:",
                              object@mutationData %>%
                                      dim(.) %>%
                                      .[1])
                          }
                  }
          )

MutTheme <- theme_classic() +
        theme(axis.text = element_text(size=8),
              legend.background = element_blank(),
              legend.position = "bottom",
              legend.box = "horizontal",
              legend.text = element_text(size = 10),
              legend.title = element_text(size = 10,
                                          face = "bold"),
              legend.key.height = unit(0.2, "cm")
        )

