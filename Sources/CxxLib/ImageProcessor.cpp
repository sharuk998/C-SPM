#include "include/ImageProcessor.hpp"

ImageProcessor::ImageProcessor() {}

bool ImageProcessor::loadImage(const std::string& path) {
    image = cv::imread(path);
    return !image.empty();
}

bool ImageProcessor::saveImage(const std::string& path) {
    return cv::imwrite(path, image);
}

void ImageProcessor::convertToGrayscale() {
    if (!image.empty()) {
        cv::cvtColor(image, image, cv::COLOR_BGR2GRAY);
    }
}

void ImageProcessor::blur(int kernelSize) {
    if (!image.empty()) {
        cv::GaussianBlur(image, image, cv::Size(kernelSize, kernelSize), 0);
    }
}

void ImageProcessor::resize(int width, int height) {
    if (!image.empty()) {
        cv::resize(image, image, cv::Size(width, height));
    }
} 
