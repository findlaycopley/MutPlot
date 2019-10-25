#'
#' @param Data Data frame of mutation data
#' @param SampleCol string - column name for samples
#' @param GeneCol string - column name for gene names
#' @param InfoCol string - column name for variant info (used to colour bar charts)
#' @keywords Mutation Waterfall
#' @export
#' @examples


## FuncColour=c("frameshift deletion" = "#7CAE00","." = "#00BFC4","nonsynonymous SNV" = "#F8766D")
prepareMutData <- function(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info") {

        ReturnClass <- MutationPlot(mutationData=Data)
        ReturnClass@plotdata <- list("WaterFallData" = ddply(Data, .(SampleCol = Data[,SampleCol], GeneCol = Data[,GeneCol]), nrow),
                                  "SampleData" = ddply(Data, .(SampleCol = Data[,SampleCol], InfoCol = Data[,InfoCol]), nrow),
                                  "GeneData" = ddply(Data, .(GeneCol = Data[,GeneCol], InfoCol = Data[,InfoCol]), nrow),
                                  "GeneOrder" = table(Data[,GeneCol] %>% droplevels()) %>% sort(.) %>% names())
        ReturnClass
}
