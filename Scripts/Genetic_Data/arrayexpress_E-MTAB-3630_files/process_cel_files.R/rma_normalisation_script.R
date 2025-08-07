# Load required libraries
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("affy")

library(affy)

# Set your CEL folder manually if not running from command line
input_dir <- "C:/Users/emman/Downloads/PM2.5_Pollution_Data-Public/Scripts/Genetic_Data/arrayexpress_E-MTAB-3630_files"  # adjust this if needed
output_csv <- file.path(input_dir, "rma_normalised_expression_matrix.csv")

# Step 1: Read the CEL files
data <- ReadAffy(celfile.path = input_dir)

# Step 2: Normalise using RMA
exprs_matrix <- exprs(rma(data))

# Step 3: Save to CSV
write.csv(exprs_matrix, file = output_csv)


