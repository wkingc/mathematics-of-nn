########################
# Virutal Environments #
########################
# Setup the R virual environment
source("renv/activate.R")
renv::restore()
install.packages("jsonlite")

# Setup the Python virtual environment
library("reticulate")
install_python(version = "3.12.1")
virtualenv_create("./pyenv")
use_virtualenv("./pyenv", required = TRUE)
virtualenv_install(requirements = "./requirements.txt")