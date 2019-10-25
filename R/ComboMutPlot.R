#' Create The Mutation Plot
#' @param ReturnClass instance of MutationPlot class
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' mutationPlot(Data, "SampleName", "GeneName", "Info")

## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
ComboMutPlot <- function(ReturnClass) {
        theme_set(MutTheme)
        ReturnClass@plots[["FinalPlot"]] <- ReturnClass@plots$SampleCount + theme(legend.position = "none") +
                        plot_spacer() +
                        ReturnClass@plots$Waterfall + theme(legend.position = "none") +
                        ReturnClass@plots$GeneCount +
                        plot_layout(widths = c(3, 1), ncol=2) +
                {ReturnClass@plots$WaterLegend +
                                ReturnClass@plots$CountLegend +
                                plot_layout(nrow=2) } +
                plot_layout()
        print(ReturnClass@plots$FinalPlot)
        ReturnClass
}
#
# finalplot <- { SampleCount + plot_spacer() +
#                 Waterfall +
#                 GeneCount +
#                 plot_layout(widths = c(3, 1), ncol=2) } +
#         {WaterLeg + CountLeg + plot_layout(nrow=2) } + plot_layout(heights=c(2,10,1,1))
