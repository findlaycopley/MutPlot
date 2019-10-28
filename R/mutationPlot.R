#' Create The Mutation Plot
#' @param Data Data frame of mutation data
#' @param SampleCol string - column name for samples
#' @param GeneCol string - column name for gene names
#' @param InfoCol string - column name for variant info (used to colour bar charts)
#' @param FuncColour list - optional colours specified for the columns
#' @keywords Mutation Waterfall
#' @export
#' @examples
#' mutationPlot(Data, "SampleName", "GeneName", "Info")

Data <- cbind(c("Sample1","Sample1","Sample1","Sample2","Sample2"),
              c("Gene1","Gene2","Gene2","Gene2","Gene3"),
              c("Missense","Missense","Frame shift","Frame shift","Missense")) %>%
        as.data.frame() %>%
        setNames(c("Sample","Gene","Info"))

## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
mutationPlot <- function(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info", FuncColour = FALSE) {
        ReturnClass <- prepareMutData(Data)
        ReturnClass <- plotWaterfall(ReturnClass)
        ReturnClass <- plotGeneCount(ReturnClass)
        ReturnClass <- plotSampleCount(ReturnClass)
        ReturnClass <- plotLegend(ReturnClass)
        ReturnClass <- ComboMutPlot(ReturnClass)
        ReturnClass
        }

