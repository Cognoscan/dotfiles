let vCopySignals = 's/\.\(\<\w\+\>\)/.\1(\1)/g'
let incLabelNums = 's/\d\+ :/\=(submatch(0)+1)." :"/g'
