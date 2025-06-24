import CxxLib

public class ImageProcessorSwift {
    private var processor: ImageProcessor!
    
    public init() {
        processor = ImageProcessor()
    }

    public func loadImage(_ path: String) -> Bool {
        return processor.loadImage(std.string(path))
    }
    
    public func saveImage(_ path: String) -> Bool {
        return processor.saveImage(std.string(path))
    }
    
    public func convertToGrayscale() {
        return processor.convertToGrayscale()
    }
    
    public func blur(_ kernelSize: Int32) {
        return processor.blur(Int32(kernelSize))
    }
    
    public func resize(_ width: Int32, _ height: Int32) {
        return processor.resize(width, height)
    }
}
