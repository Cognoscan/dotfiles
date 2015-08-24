
" Vim syntax file
" Language:     Picoblaze Assembler (psm)
" quick mod on the default FASM 
 
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
 
setlocal iskeyword=a-z,A-Z,48-57,.,_
setlocal isident=a-z,A-Z,48-57,.,_
syn case ignore
 
syn keyword psmRegister s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 sA sB sC sD sE sF
syn keyword psmAddressSizes    byte dqword dword fword pword qword tword word
syn keyword psmDataDirectives  db dd df dp dq dt du dw file rb rd rf rp rq rt rw

syn keyword psmInstr   LOAD STAR AND OR XOR ADD ADDCY SUB SUBCY TEST TESTCY
syn keyword psmInstr   COMPARE COMPARECY SL0 SL1 SLX SLA RL SR0 SR1 SRX SRA RR
syn keyword psmInstr   REGBANK INPUT OUTPUT OUTPUTK STORE FETCH
syn keyword psmInstr   DISABLE ENABLE INTERRUPT RETURNI
syn keyword psmInstr   JUMP Z NZ C NC CALL RETURN LOAD&RETURN HWBUILD

syn keyword psmSymbol NUL BEL BS HT LF VT CR ESC DEL DCS ST

syn keyword psmPreprocess      INCLUDE STRING CONSTANT NAMEREG TABLE
syn keyword psmDirective       ADDRESS INST DEFAULT_JUMP
 
" numbers
syn match       psmBinaryNumber        "[01]\+'b"
syn match       psmDecimalNumber       "\(0\|[1-9]\d*\)'d"
syn match       psmHexNumber           "[, ]\x\+[, \n\r]"
syn region      psmString              start="\"" end="\""
syn match       psmSymbol              "[()|\[\]:]"
syn match       psmSpecial             "[#?%$,]"
syn region      psmComment             start=";" end="$"
syn match       psmLabel               "^\s*[^; \t]\+:"
 
hi def link     psmBinaryNumber        psmNumber
hi def link     psmHexNumber           psmNumber
hi def link     psmDecimalNumber       psmNumber
 
hi def link     psmSymbol             psmRegister
hi def link     psmPreprocess          psmDirective
 
"  link to standard syn groups so the 'colorschemes' work:
hi def link     psmComment  comment
hi def link     psmDirective   preproc
hi def link     psmRegister  type
hi def link     psmNumber   constant
hi def link     psmSymbol structure
hi def link     psmString  String
hi def link     psmSpecial     special
hi def link     psmInstr keyword
hi def link     psmLabel function
hi def link     psmPrefix preproc
let b:current_syntax = "psm"

