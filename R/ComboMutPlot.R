#' Create The Mutation Plot
#' @param ReturnClass instance of MutationPlot class
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' mutationPlot(Data, "SampleName", "GeneName", "Info")

## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
ComboMutPlot <- function(ReturnClass) {
        ##theme_set(MutTheme)
        ReturnClass@plots[["FinalPlot"]] <- ReturnClass@plots$SampleCount + theme(legend.position = "none") +
                plot_spacer() +
                ReturnClass@plots$Waterfall + theme(legend.position = "none") +
                ReturnClass@plots$GeneCount +
                plot_layout(widths = c(5, 1), ncol=2) +
                ({ReturnClass@plots$WaterLegend +
                                ReturnClass@plots$CountLegend +
                                plot_layout(ncol=1) }) +
                plot_layout(heights=c(10,50,10))
        print(ReturnClass@plots$FinalPlot)
        ReturnClass
}
