setwd("~/Downloads/Master_Thesis/3_SPR_Study/Results_Analysis/")

get_consent <- function(
    consentpath
) {
  dt <- fread(consentpath)
  colnames(dt) <- c("timeReceipt", "IPhash", "Controller", "IbexItemNum", "Type", "Group", 
                    "PennElType", "PennElName", "Parameter", "Value", "EventTime", "survey", "Comments")
  
  # remove trial start entries
  dt <- dt[Parameter != "_Trial_"]
  dt <- dt[Parameter != "_Header_"]
  
  df <- dcast(dt, IPhash ~ Parameter, value.var="Value")
  df <- df[!(IPhash %in% c("c6c58a4e2da5ed0040e8e1fbcf513083")),]
  df
}

cn <- get_consent("consent.txt")
