## install diyabcGUI from github

# default CRAN repos
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.r-project.org"
    options(repos=r)
})

# install
library(devtools)
devtools::install_github(
    "diyabc/diyabcGUI",
    subdir = "R-pkg"
)

# get latest required bin
library(diyabcGUI)
diyabcGUI::dl_all_latest_bin()
