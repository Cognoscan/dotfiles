#!/bin/bash

alias feh2='feh *.{jpg,png,gif}'

alias dl='du -ch --max-depth=1'
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

source ~/.homesick/repos/homeshick/homeshick.sh

function vdecompile()
{
  netgen -ofmt verilog ${1}
}

function 7ztargz()
{
  7z x -so "${2}" | 7z ${1} -si -ttar
}

function displayattach()
{
  xrandr --output LVDS1 --auto \
         --output VGA1 --auto --left-of LVDS1 \
         --output DVI-${1}-${2} --auto --right-of LVDS1
}

function displaydetach()
{
  xrandr --output LVDS1 --auto \
         --output VGA1 --off \
         --output DVI-${1}-${2} --off
}

function md5sumdir()
{
    find "${1}" -type f -exec md5sum {} + | sort | md5sum
    #| awk '{print $1}' | sort | md5sumdir
}

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
       -sOutputFile="${3%.pdf}_p${1}-p${2}.pdf" \
       "${3}"
}

function pdfcombine()
{
    # This function uses 3 arguments:
    #   $1 is the first input file
    #   $2 is the second input file
    #   $3 is the output file name
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -sOutputFile="${3}" "${1}" "${2}"
}

