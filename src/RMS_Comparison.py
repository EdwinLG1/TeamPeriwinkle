from PIL import Image
import math

def compare_images(image1_path, image2_path):
    # Open images
    image1 = Image.open(image1_path)
    image2 = Image.open(image2_path)

    # Check if images have the same size
    if image1.size != image2.size:
        print("Images are not of the same size.")
        return
    
    rms = 0
    # Compare pixel by pixel
    width, height = image1.size
    for y in range(height):
        for x in range(width):
            pixel1 = image1.getpixel((x, y))
            pixel2 = image2.getpixel((x, y))
            rms = rms + ((pixel1[0]-pixel2[0])/255)**2
            rms = rms + ((pixel1[1]-pixel2[1])/255)**2
            rms = rms + ((pixel1[2]-pixel2[2])/255)**2

    rms = math.sqrt(rms / (width*height*3))

    print("Comparison completed. rms = %f\n", rms)

# Provide the paths to your images
image1_path = "/Users/alecplano/Desktop/more_tests/testIM.png"
image2_path = "/Users/alecplano/Desktop/more_tests/test1in.png"

# Call the function to compare images
compare_images(image1_path, image2_path)