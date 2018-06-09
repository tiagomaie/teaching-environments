# Installs python Miniconda3 for OSX and Linux

# OSX does not come with a preinstalled python
#if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then 
#    brew update;
#    brew install python3;
#    virtualenv venv -p python3;
#    source venv/bin/activate;
#fi

# System config steps
if [ "$TRAVIS_OS_NAME" = linux ]; then
    sudo apt-get update
    sudo apt-get install build-essential
    sudo apt-get autoremove -y
    sudo apt-get clean
    MINICONDAVERSION="Linux"
else
    brew update;
    MINICONDAVERSION="MacOSX"
fi

# Install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-$MINICONDAVERSION-x86_64.sh -O miniconda.sh
bash miniconda.sh -b
export PATH="$HOME/miniconda3/bin:$PATH"
rm miniconda.sh
conda config --set always_yes yes --set changeps1 no
conda update -q conda

