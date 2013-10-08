youtube-view () {
  mplayer -cache 200 -really-quiet $(youtube-dl -g --max-quality mp4 "$@" )     
}

alias nmgui='~/scripts/nmgui.sh'
alias markdown='~/scripts/Markdown.pl'
alias mmd='~/programs/multimarkdown'

alias redlocal='redshift -l 42:-71.5'

alias homeshick='~/.homesick/repos/homeshick/home/.homeshick'
alias ccs='/opt/ti/ccsv5/eclipse/ccstudio'
alias ise='/opt/Xilinx/14.5/ISE_DS/ISE/bin/lin64/ise'
alias vcom='~/altera/13.0sp1/modelsim_ase/bin/vcom'
alias vsim='~/altera/13.0sp1/modelsim_ase/bin/vsim'
alias vlog='~/altera/13.0sp1/modelsim_ase/bin/vlog'
alias vlib='~/altera/13.0sp1/modelsim_ase/bin/vlib'
alias vdir='~/altera/13.0sp1/modelsim_ase/bin/vdir'
alias vmap='~/altera/13.0sp1/modelsim_ase/bin/vmap'
alias vmake='~/altera/13.0sp1/modelsim_ase/bin/vmake'

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
