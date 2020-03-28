#!/bin/sh

#latex thesis_sg
#latex thesis_sg
dvips  -Ppdf -Pcmz -Pamz -o thesis_sg.ps thesis_sg.dvi
ps2pdf -dPDFSETTINGS=/prepress  -dCompatibilityLevel=1.4 -dAutoFilterColorImages=false -dAutoFilterGrayImages=false -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode -dMonoImageFilter=/FlateEncode -dDownsampleColorImages=false -dDownsampleGrayImages=false  thesis_sg.ps
