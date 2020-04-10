try:
    from PIL import Image
except ImportError:
    import Image
import pytesseract


def ocr_core(filename):
    """
    This function will handle the core OCR processing of images.
    chinese simple : https://github.com/tesseract-ocr/tessdata/blob/master/chi_sim.traineddata
    path: /usr/local/share/tessdata/
    """
    text = pytesseract.image_to_string(Image.open(filename), lang="chi_sim",)
    # We'll use Pillow's Image class to open the image and pytesseract to detect the string in the image
    return text


print(ocr_core(filename))
