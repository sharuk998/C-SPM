#pragma once
#include <opencv2/opencv.hpp>
#include <string>

class ImageProcessor {
public:
    ImageProcessor();
    
    // Load and save images
    bool loadImage(const std::string& path);
    bool saveImage(const std::string& path);
    
    // Basic image operations
    void convertToGrayscale();
    void blur(int kernelSize);
    void resize(int width, int height);
    
private:
    cv::Mat image;
};
