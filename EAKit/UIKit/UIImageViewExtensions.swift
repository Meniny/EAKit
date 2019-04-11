//
//  UIImageViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/25/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UIImageView {
	
	/// EAKit: Set image from a URL.
	///
	/// - Parameters:
	///   - url: URL of image.
	///   - contentMode: imageView content mode (default is .scaleAspectFit).
	///   - placeHolder: optional placeholder image
	///   - completionHandler: optional completion handler to run when download finishs (default is nil).
	public func download(
		from url: URL,
		contentMode: UIView.ContentMode = .scaleAspectFit,
		placeholder: UIImage? = nil,
		completionHandler: ((UIImage?) -> Void)? = nil) {
		
		image = placeholder
		self.contentMode = contentMode
		URLSession.shared.dataTask(with: url) { (data, response, _) in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data,
				let image = UIImage(data: data)
				else {
					completionHandler?(nil)
					return
			}
			DispatchQueue.main.async {
				self.image = image
				completionHandler?(image)
			}
			}.resume()
	}
	
	/// EAKit: Make image view blurry
	///
	/// - Parameter style: UIBlurEffectStyle (default is .light).
	public func blur(withStyle style: UIBlurEffect.Style = .light) {
		let blurEffect = UIBlurEffect(style: style)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
		addSubview(blurEffectView)
		clipsToBounds = true
	}
	
	/// EAKit: Blurred version of an image view
	///
	/// - Parameter style: UIBlurEffectStyle (default is .light).
	/// - Returns: blurred version of self.
	public func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
		let imgView = self
		imgView.blur(withStyle: style)
		return imgView
	}
	
}
#endif
