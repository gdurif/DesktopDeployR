## install diyabcGUI and dependencies (for Windows)
## to be run by R-Portable

# default CRAN repos
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.r-project.org"
    options(repos=r)
})

# requirement
install.package("devtools", lib = "app/library")
install.packages("jsonlite", lib = "app/library")
dep <- read.table("requirements.txt")
install.packages(dep, lib = "app/library")

# install from zip source
zip_src <- tail(sort(list.files(".", pattern = "diyabcGUI*")), 1)
install.packages(
    zip_src, repos = NULL, type = "win.binary", lib = "app/library"
)
