
if [ `uname` == "Linux" ]; then
	url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
elif [ `uname` == "Darwin" ]; then
	url=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
else
	echo "Only Linux and Mac Os installation supported"; exit 1
fi

wget -c $url -O inmico.sh

bash inmico.sh

