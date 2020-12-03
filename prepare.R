## install diyabcGUI and dependencies (for Windows)
## to be run by R-Portable

# default CRAN repos
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.r-project.org"
    options(repos=r)
})

# R lib
R_lib <- file.path("app", "library")
if(dir.exists(R_lib)) dir.create(R_lib)

# requirement
install.package("devtools", lib = R_lib)
install.packages("jsonlite", lib = R_lib)
dep <- unlist(read.table("requirements.txt", header = FALSE, stringsAsFactors = FALSE))
install.packages(dep, lib = R_lib)

# local install from Rcpp
devtools::install("Rcpp", args = c('--library="./app/library/"'))

# install from zip source
zip_src <- tail(sort(list.files("src", pattern = "diyabcGUI*")), 1)
install.packages(
    file.path("src", zip_src), repos = NULL, type = "win.binary", lib = R_lib
)
