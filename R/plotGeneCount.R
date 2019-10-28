#'
#' @param ReturnClass instance of MutationPlot class
#' @param FuncColour list - optional colours specified for the columns
#' @keywords Mutation Waterfall
#' @export
#' @examples

plotGeneCount <- function(ReturnClass, FuncColour = FALSE) {
        ReturnClass@plots[["GeneCount"]] <- ggplot(ReturnClass@plotdata$GeneData,
                            aes(x = factor(GeneCol,
                                           levels=ReturnClass@plotdata$GeneOrder),
                                y = V1,
                                fill = InfoCol
                            )) +
                geom_bar(stat = "identity") +
                labs(y = "Count", fill = "Type of Mutation") +
                coord_flip() +
                MutTheme +
                theme(legend.position = "none",
                      axis.text.y = element_blank(),
                      axis.ticks.y = element_blank(),
                      axis.title.y = element_blank(),
                      panel.background = element_blank(),
                      axis.line.x = element_line()
                      ) +
                if (typeof(FuncColour) == "character" ) {
                        scale_fill_manual(name = "Type of Mutation", values = FuncColour)
                } else {
                        scale_fill_discrete(name = "Type of Mutation")
                }
        ReturnClass
}
