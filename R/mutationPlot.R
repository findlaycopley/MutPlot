#' Create The Mutation Plot
#' @param Data Data frame of mutation data
#' @param SampleCol string - column name for samples
#' @param GeneCol string - column name for gene names
#' @param InfoCol string - column name for variant info (used to colour bar charts)
#' @param Colour_List named list - optional colours specified for the columns
#' @param PRINT TRUE/FALSE - print the final plot?
#' @keywords Mutation Waterfall
#' @export mutationPlot
#' @export ExampleMutationData
#' @examples
#' mutationPlot(Data, "SampleName", "GeneName", "Info")

ExampleMutationData <- cbind(c("Sample1","Sample1","Sample1","Sample2","Sample2"),
              c("Gene1","Gene2","Gene2","Gene2","Gene3"),
              c("Missense","Missense","Frame shift","Frame shift","Missense")) %>%
        as.data.frame() %>%
        setNames(c("Sample","Gene","Info"))

## Colour_List=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
mutationPlot <- function(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info", Colour_List = FALSE, PRINT = TRUE) {
        ReturnClass <- prepareMutData(Data, SampleCol=SampleCol, GeneCol=GeneCol, InfoCol=InfoCol)
        ReturnClass <- plotWaterfall(ReturnClass)
        ReturnClass <- plotGeneCount(ReturnClass, Colour_List)
        ReturnClass <- plotSampleCount(ReturnClass, Colour_List)
        ReturnClass <- plotLegend(ReturnClass)
        ReturnClass <- ComboMutPlot(ReturnClass, PRINT)
        ReturnClass
        }

