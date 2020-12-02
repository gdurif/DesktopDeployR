## download Rtools
library(stringr)

rtools_url_list <- c(
    "https://cran.r-project.org/bin/windows/Rtools/rtools40-x86_64.exe",
    "https://cran.r-project.org/bin/windows/Rtools/rtools40-i686.exe"
)

check <- sapply(
    rtools_url_list,
    function(exe_url) {
        download.file(
            exe_url,
            destfile = file.path("dist", basename(exe_url)),
            mode = "wb"
        )
    }
)

if(any(check))
    stop(str_c(
        "error when dowloading: ",
        str_c(rtools_url_list[check], collapse = ", ")
    )
