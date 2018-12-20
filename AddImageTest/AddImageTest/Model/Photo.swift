//
//  Photo.swift
//  AddImageTest
//
//  Created by David E Bratton on 12/15/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation
import RealmSwift

class Photo: Object {
    @objc dynamic var photoID = UUID().uuidString
    @objc dynamic var photoName = ""
    @objc dynamic var photoImg: NSData? = nil
    
    override static func primaryKey() -> String? {
        return "photoID"
    }
}
