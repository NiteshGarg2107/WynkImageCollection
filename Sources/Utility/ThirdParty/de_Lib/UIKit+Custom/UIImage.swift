//
//  UIImage.swift
import UIKit

//Results
public enum ImageSavedResponse {
    case success
    case error(String)
}

var imageSavedSuccessfully: ((ImageSavedResponse)-> ())?

// MARK: Public Methods
extension UIImage {
    func saveToGallery( callback: inout ((_ result: ImageSavedResponse)-> ())?) -> Void {
        UIImageWriteToSavedPhotosAlbum(self, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

// MARK: FilePrivate Methods
extension UIImage  {
    @objc fileprivate func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            imageSavedSuccessfully!(.error(error.localizedDescription))
        } else {
            imageSavedSuccessfully!(.success)
        }
    }
    
    ///convert into base64String
    var base64String: String? {
        return self.pngData()!.base64EncodedString(options: .lineLength64Characters)
    }
}
