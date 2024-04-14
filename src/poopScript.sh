
echo "../input/$1" > image1.txt
echo "../input/$2" > image2.txt

#matlab -nosplash -nodesktop -r "run('ImagePreProcess_color.m');exit;"

matlab -nosplash -nodesktop -r "run('ImageStitchMain.m');exit;"

while [ ! -f Mask.png ] || [ ! -f Stitched_Image.png ];
    do sleep 1
done

iopaint run --model=lama --device=cpu --image=./Stitched_Image.png --mask=./Mask.png --output=../output/$3

rm Mask.png
rm Stitched_Image.png

rm image1.txt
rm image2.txt
