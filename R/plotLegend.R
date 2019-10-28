#' Create The Mutation Plot
#' @param ReturnClass instance of MutationPlot class
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' mutationPlot(Data, "SampleName", "GeneName", "Info")

plotLegend <- function(ReturnClass) {
        ReturnClass@plots[["WaterLegend"]] <- as_ggplot(
                get_legend(ReturnClass@plots$Waterfall + MutTheme)
                )

        ReturnClass@plots[["CountLegend"]] <-  as_ggplot(
                get_legend(ReturnClass@plots$SampleCount + MutTheme)
                )
        ReturnClass
}
