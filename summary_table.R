library(knitr)

system('paste original.lst wayback.lst pages.lst | tr "\t" "," > tmp.csv')

table <- "tmp.csv" |>
  read.csv(header = FALSE) |>
  setNames(c("original", "wayback", "page")) |>
  (\(x) { 
    x <- lapply(x, gsub, pattern = " ", replacement = "%20")
    return(data.frame(x))
  })() |>
  knitr::kable()

readme <- readLines("README.md")

if (length(grep("\\|", readme)) > 0){
  #if there is already a table: replace it
  table_start_index <- min(grep("^\\|", readme))
  readme[table_start_index:(table_start_index + length(table) - 1)] <- table
} else {
  #if there is no table: create first table
  readme <- c(readme, "", "## Summary table", "", table)
}

writeLines(readme, "README.md")

system('rm tmp.csv')
