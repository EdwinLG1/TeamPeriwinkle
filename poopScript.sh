#!/bin/bash

rm Mask.png
rm Stitched_Image.png
rm output/Stitched_Image.png

matlab -nosplash -nodesktop -r "run('ImageStitchMain.m');exit;"

while [ ! -f Mask.png ] || [ ! -f Stitched_Image.png ];
    do sleep 1
done

iopaint run --model=lama --device=cpu --image=./Stitched_Image.png --mask=./Mask.png --output=./output

rm Mask.png
rm Stitched_Image.png