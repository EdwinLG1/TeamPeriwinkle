# TeamPeriwinkle

This is the main hub for any files pertaining to Team Periwinkle's Senior Design Project. Any software/documentation/reference files will be uploaded to this repo accordingly. This includes all the code used to create any image preprocessing functionality, as well as the scripting used in creating a working interface with the chosen Machine Learning model.


# How it Works
1.) Take pictures on with iphone camera and send them to computer <br />
2.) run shell script <br />
3.) covert .HEIC to .jpg Using the following command: <br />

* <code>(sips -s format jpeg Mille.heic --out myfile.jpg)</code> <br />
4.) Run MATLAB image preprocessing with:

* <code>Command (______) </code><br />
5.) Run image io-paint module using the following command:

* <code>(iopaint run --model=lama --device=cpu --image={path to input} --mask={path to mask} --output={path to output dir})</code> <br />

# Notes
* input image must be transparent where it will be masked
* mask should be white where masking, black otherwise

## Running MATLAB as script
### Windows
1.) Open Windows Powershell <br />
2.) Check MATLAB and current directory are added to user or system environmental path: <br />
* <code>echo $env:PATH</code>

2.5.) Add path <br />
* <code>$env:PATH += ';C\..\working_directory\'</code>

3.) Run matlab file: <br />
* <code>& matlab -batch "filename"</code>

### Mac
1.) Open terminal (newest versions will default to <code>.zsh</code>) <br />
2.) Run <code>echo $PATH</code> to see your path variables <br />
3.) Check <code>~/MATLAB_R2023b.app/bin</code> is in your system path. If not: <br />
3.5) <code>vim .zshrc</code> add the following line <br />
* <code> export PATH="$PATH:/Applications/MATLAB_R2023b.app/bin" </code> <br />

4.) Reload shell for the change to take effect <br />
5.) Run matlab file: <br />
* <code> matlab -nodisplay -nosplash -r "run('/Users/alecplano/Desktop/test.m'); exit;" </code> <br />

* Take note that the script filename can include the .m file extension for MacOS
