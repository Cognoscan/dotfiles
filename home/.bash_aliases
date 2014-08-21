#!/bin/bash

alias cu='cd ..'
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'
alias up8='cd ../../../../../../../..'
alias up9='cd ../../../../../../../../..'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'

source ~/.homesick/repos/homeshick/homeshick.sh

function pdfpextr()
{
    # this function uses 3 arguments:
    #     $1 is the first page of the range to extract
    #     $2 is the last page of the range to extract
    #     $3 is the input file
    #     output file will be named "inputfile_pXX-pYY.pdf"
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -dFirstPage=${1} \
       -dLastPage=${2} \
       -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
       ${3}
}

function pdfcombine()
{
    # This function uses 3 arguments:
    #   $1 is the first input file
    #   $2 is the second input file
    #   $3 is the output file name
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -sOutputFile=${3} ${1} ${2}
}

