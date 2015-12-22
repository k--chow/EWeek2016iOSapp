//
//  Category.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/21/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class Category: NSObject, NSCoding {
    
    var name: String
    var photo: UIImage?
    
    static let DocumentsDirectory =
    NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("categories");
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    init?(name: String, photo: UIImage?) {
        self.name = name
        self.photo = photo
        super.init()
    }
    //what is this??
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey);
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        self.init(name: name, photo: photo)
    }


}

