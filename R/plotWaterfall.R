#' @title plotWaterfall function
#' @param ReturnClass instance of MutationPlot class
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' ## Pass the function a MuationPlot object
#' plotWaterfall(MutationPlot)

## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
plotWaterfall <- function(ReturnClass) {
        ReturnClass@plots[["Waterfall"]] <- ggplot(ReturnClass@plotdata$WaterFallData,
                            aes(x = as.factor(SampleCol),
                                y = factor(GeneCol,
                                           levels=ReturnClass@plotdata$GeneOrder),
                                fill = as.factor(V1))) +
                geom_tile(width=0.9, height=0.9) +
                labs(x = "Sample", y = "Gene", fill = "Count") +
                scale_fill_brewer(name = "Number of mutations", palette="Paired") +
                theme(axis.text.x = element_text(angle=45, hjust=1,vjust=1),
                      panel.background = element_blank(),
                      axis.line = element_line())
        ReturnClass
}
