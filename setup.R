#############
# Install R #
#############
# update indices
system("sudo apt update -qq")
# install two helper packages we need
system("sudo apt install --no-install-recommends software-properties-common dirmngr")
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
system("wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc")
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
system("sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/'")
# Install R
system("sudo apt install --no-install-recommends r-base-dev")

#################
# Install LaTeX #
#################
system("sudo apt install texlive-latex-extra")

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