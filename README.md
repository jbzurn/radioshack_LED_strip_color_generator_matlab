radioshack_LED_strip_color_generator_matlab
===========================================
------Relevant hardware:-----------
RadioShack Tricolor 1m LED strip (Model: 2760249  | Catalog #: 276-249)

------Problem:---------------------
The LED strip colors must be programmed using hexadecimal code, and the format does NOT match the standard format used by websites.

Website format: RRGGBBB (R=red, G = green, B = blue)
LED strip: GGBBRR

------Solution:--------------------
This code uses MATLAB to convert standard (website) hexadecimal colors to the format needed by the LED strip, and generates a text file containing the PROGMEM code that can be pasted directly into the sample Arduino code provided by RadioShack.  Two examples are here: 1) display the same color on the entire strip, 2) display alternating colors on the strip (here, the Irish flag colors).  Some sample generated color files are also included.

The code is written using the interpreter Matlab.  However, if you don't have Matlab, it probably runs on Octave as well.

If you don't know what Matlab is, you probably don't have it.  However, if you are familiar with another programming language, try opening the .m file in a text editor, and using it as pseudocode to write a similar routine in your preferred language.

------Relevant files:--------------

FYI, as of February 22, 2013, The Radio Shack part can be found at http://www.radioshack.com/product/index.jsp?productId=16306856#stuff-you-want

and the code you NEED to run the LED strip is located at http://www.radioshack.com/graphics/uc/rsk/Support/SoftwareDownload/2760249.zip (scroll down to Product Summary, and click on "Support PDE Files and Schematics (ZIP format)")
