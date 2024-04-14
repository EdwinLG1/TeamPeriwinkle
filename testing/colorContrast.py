import cv2
import numpy as np

def adjust_contrast(image, alpha, beta):
    """
    Adjusts the contrast and brightness of an image using alpha and beta parameters.
    """
    adjusted_image = cv2.convertScaleAbs(image, alpha=alpha, beta=beta)
    return adjusted_image

def match_histograms(source, target):
    """
    Matches the histograms of two images.
    """
    source_hist, _ = np.histogram(source.flatten(), 256, [0, 256])
    target_hist, _ = np.histogram(target.flatten(), 256, [0, 256])

    # Compute cumulative distribution functions (CDF)
    source_cdf = source_hist.cumsum()
    target_cdf = target_hist.cumsum()

    # Normalize CDFs
    source_cdf_normalized = source_cdf / source_cdf.max()
    target_cdf_normalized = target_cdf / target_cdf.max()

    # Interpolate matching values
    matched_values = np.interp(source_cdf_normalized, target_cdf_normalized, range(256))

    # Apply the matched values to the source image
    matched_image = np.interp(source.flatten(), range(256), matched_values).reshape(source.shape)
    
    return matched_image.astype(np.uint8)

def minimize_color_and_contrast_difference(image1, image2):
    """
    Minimizes color and contrast differences between two images.
    """
    # Convert images to LAB color space
    lab_image1 = cv2.cvtColor(image1, cv2.COLOR_BGR2LAB)
    lab_image2 = cv2.cvtColor(image2, cv2.COLOR_BGR2LAB)

    # Adjust the contrast of the second image to match the first
    adjusted_image2 = adjust_contrast(lab_image2, 1.0, 10)

    # Match histograms of the LAB channels
    matched_image2 = np.zeros_like(lab_image2)
    for i in range(3):
        matched_image2[:, :, i] = match_histograms(lab_image1[:, :, i], adjusted_image2[:, :, i])

    # Convert the matched image back to BGR color space
    result_image = cv2.cvtColor(matched_image2, cv2.COLOR_LAB2BGR)

    return result_image

# Example usage:
image1 = cv2.imread('image1.jpg')
image2 = cv2.imread('image2.jpg')

result = minimize_color_and_contrast_difference(image1, image2)

# Display the result
cv2.imshow('Result', result)
cv2.waitKey(0)
cv2.destroyAllWindows()
