" Use <C-r>=[REGEX NAME] to insert a regex
" Use <C-r>=/ to insert the last search term
let vCopySignals = 's/\.\(\<\w\+\>\)/.\1(\1)/g'
let incLabelNums = 's/\d\+ :/\=(submatch(0)+1)." :"/g'
let xilFDCE = 's/\v^\s*FDCE\s+(\S+)\s*\(\n\s*\.C\(([^)]+)\),\s*\n\s*\.CE\(([^)]+)\),\s*\n\s*\.CLR\(([^)]+)\),\s*\n\s*\.D\(([^)]+)\),\s*\n\s*\.Q\(([^)]+)\)\s*\n\s*\);/always @(posedge \2 or posedge \4)\r    if (\4)\r        \6 <= 1''b0;\r    else if (\3)\r        \6 <=\r            \5;\r/g'
let xilFDC = 's/\v^\s*FDC\s+(\S+)\s*\(\n\s*\.C\(([^)]+)\),\s*\n\s*\.CLR\(([^)]+)\),\s*\n\s*\.D\(([^)]+)\),\s*\n\s*\.Q\(([^)]+)\)\s*\n\s*\);/always @(posedge \2 or posedge \3)\r    if (\3)\r        \5 <= 1''b0;\r    else\r        \5 <=\r            \4;\r/g'
let xilFDE = 's/\v^\s*FDE\s+(\S+)\s*\(\n\s*\.C\(([^)]+)\),\s*\n\s*\.CE\(([^)]+)\),\s*\n\s*\.D\(([^)]+)\),\s*\n\s*\.Q\(([^)]+)\)\s*\n\s*\);/always @(posedge \2)\r    if (\3)\r        \5 <=\r            \4;\r/g'
let xilFDPE = 's/\v^\s*FDPE\s+(\S+)\s*\(\n\s*\.C\(([^)]+)\),\s*\n\s*\.CE\(([^)]+)\),\s*\n\s*\.D\(([^)]+)\),\s*\n\s*\.PRE\(([^)]+)\),\s*\n\s*\.Q\(([^)]+)\)\s*\n\s*\);/always @(posedge \2 or posedge \5)\r    if (\5)\r        \6 <= 1''b1;\r    else if (\3)\r        \6 <=\r            \4;\r/g'
let xilFDP = 's/\v^\s*FDP\s+(\S+)\s*\(\n\s*\.C\(([^)]+)\),\s*\n\s*\.D\(([^)]+)\),\s*\n\s*\.PRE\(([^)]+)\),\s*\n\s*\.Q\(([^)]+)\)\s*\n\s*\);/always @(posedge \2 or posedge \4)\r    if (\4)\r        \5 <= 1''b1;\r    else\r        \5 <=\r            \3;\r/g'
let xilINV = 's/\v^\s*INV\s+(\S+)\s*\(\n\s*\.I\(([^)]+)\),\s*\n\s*\.O\(([^)]+)\)\s*\n\s*\);/assign \3 =\r    \~(\2);/g'
