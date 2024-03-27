# TeamPeriwinkle

This is the main hub for any files pertaining to Team Periwinkle's Senior Design Project. Any software/documentation/reference files will be uploaded to this repo accordingly. This includes all the code used to create any image preprocessing functionality, as well as the scripting used in creating a working interface with the chosen Machine Learning model.


# How it Works
1.) Take pictures on with iphone camera and send them to computer <br />
2.) run shell script <br />
3.) covert .HEIC to .jpg Using the following command (sips -s format jpeg Mille.heic --out myfile.jpg) <br />
4.) Run mat lab image preprocessing with matlab Command (______) <br />
5.) Run image io paint module using the following command (iopaint run --model=lama --device=cpu --image={path to input} --mask={path to mask} --output={path to output dir}) <br />

# Notes
.) input image must be transparent where it will be masked
.) mask should be white where masking, black otherwise
