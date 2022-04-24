//
//  Image+Extensions.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: URL, completion: @escaping (Bool) -> Swift.Void) {
        URLSession(configuration: .ephemeral).dataTask(with: url)  { (data, response, error) in
            guard let responseData = data , let image = UIImage(data: responseData), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
            
            return
        }.resume()
    }
}
