//
//  WebResourceTests.swift
//  ComicsTests
//
//  Created by Bharath Kongara on 4/24/22.
//

import XCTest
import CryptoKit

@testable import Comics

class WebResourceTests: XCTestCase {

    func testMD5Hash() throws {
        let webResource = WebResource(url: "sample", method: .get)
          
        let hashData = webResource.md5Hash()
        let privateKey = "e6e5641e7a179ae96dda79d547903a6c73e48ecf"
        let publicKey = "56f3feb485c4062fa0a83afc21481cbb"
    
        let signRequestString = "\(hashData.1)\(privateKey)\(publicKey)"
        
        let digest = Insecure.MD5.hash(data: signRequestString.data(using: .utf8) ?? Data())
        XCTAssertEqual(digest.map { String(format: "%02hhx", $0) }.joined(), hashData.0)
        
    }

}
