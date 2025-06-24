import CxxLib
import CxxStdlib
import CxxSPM

print("Starting OpenCV test...")

var processor = ImageProcessor()

// Input and output paths
let inputPath = "TestImages/test.jpg"
let outputPath = "TestImages/output.jpg"
let grayOutputPath = "TestImages/output_gray.jpg"
let blurredOutputPath = "TestImages/output_blurred.jpg"

// Test 1: Load and save the original image
if processor.loadImage(inputPath.stdString) {
    print("✅ Successfully loaded the image")
    
    if processor.saveImage(outputPath.stdString) {
        print("✅ Successfully saved the original image copy")
    } else {
        print("❌ Failed to save the image")
    }
    
    // Test 2: Convert to grayscale and save
    processor.loadImage(inputPath.stdString) // Load the original again
    processor.convertToGrayscale()
    if processor.saveImage(grayOutputPath.stdString) {
        print("✅ Successfully saved the grayscale image")
    } else {
        print("❌ Failed to save the grayscale image")
    }
    
    // Test 3: Apply blur and save
    processor.loadImage(inputPath.stdString) // Load the original again
    processor.blur(15) // Apply a stronger blur to make it visible
    if processor.saveImage(blurredOutputPath.stdString) {
        print("✅ Successfully saved the blurred image")
    } else {
        print("❌ Failed to save the blurred image")
    }
} else {
    print("❌ Failed to load the image")
}

print("OpenCV test completed. Check the TestImages directory for the output files.") 