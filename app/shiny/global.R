## install diyabcGUI from github

# default CRAN repos
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cran.r-project.org"
    options(repos=r)
})

# function to (re)install diyabcGUI
install_diyabcGUI <- function() {
    require(devtools)
    devtools::install_github(
        "diyabc/diyabcGUI",
        subdir = "R-pkg",
        ref = "prod",
        upgrade = "never",
        lib = dirname(system.file(package = "devtools"))
    )

    # get latest required bin
    library(diyabcGUI)
    diyabcGUI::dl_all_latest_bin()

    # record latest install
    require(lubridate)
    path <- system.file(package = "diyabcGUI")
    logfile <- file.path(path, "latest_install")
    con <- file(logfile)
    writeLines(as.character(today()), con)
}

# install diyabcGUI if necessary
if(!require("diyabcGUI")) {
    install_diyabcGUI()
} else {
    # reinstall if too fold
    require(lubridate)
    path <- system.file(package = "diyabcGUI")
    logfile <- file.path(path, "latest_install")
    con <- file(logfile)
    latest = readLines(con)

    if(month(as.period(interval(ymd(latest), today()))) > 3){
        install_diyabcGUI()
    }
}
