#!/usr/bin/env bash

type conda &> /dev/null || (echo "Installing miniconda...."; ./install_miniconda.sh)

#fortls
type fortls &> /dev/null || pip3 install fortran-language-server

pip3 install jedi-language-server pep8 pylint pylint-django

