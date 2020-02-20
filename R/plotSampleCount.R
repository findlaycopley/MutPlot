#' @title plotSampleCount function
#' @param ReturnClass Description
#' @param Colour_List list - optional colours specified for the columns
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' ## Pass the function a MuationPlot object
#' plotSampleCount(MutationPlot)


## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
plotSampleCount <- function(ReturnClass, Colour_List = FALSE) {
        ReturnClass@plots[["SampleCount"]] <- ggplot(ReturnClass@plotdata$SampleData,
                              aes(
                                      x = as.factor(SampleCol),
                                      y = V1,
                                      fill = InfoCol
                              )) +
                geom_bar(stat = "identity") +
                labs(y = "Count") +
                theme(axis.text.x = element_blank(),
                      axis.ticks.x = element_blank(),
                      axis.title.x = element_blank(),
                      panel.background = element_blank(),
                      axis.line.y = element_line()
                ) +
                if (typeof(Colour_List) == "character" ) {
                        scale_fill_manual(name = "Type of Mutation", values = Colour_List)
                } else {scale_fill_discrete(name = "Type of Mutation")
                }
        ReturnClass
}
