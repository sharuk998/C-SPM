import CxxLib

// Create an image processor
let processor = ImageProcessor()

// Load an image
let loaded = processor.loadImage("/path/to/image.jpg")
if loaded {
    // Process the image
    processor.convertToGrayscale()
    processor.blur(5)  // 5x5 Gaussian blur
    processor.resize(800, 600)
    
    // Save the processed image
    let saved = processor.saveImage("/path/to/output.jpg")
    print("Image saved successfully: \(saved)")
} 