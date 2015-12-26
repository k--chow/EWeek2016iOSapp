//
//  Director.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/26/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class Director: NSObject, NSCoding {
    var name: String
    var photo: UIImage?
    var photoLink: String
    var position: String
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let photoLinkKey = "photoLink"
        static let positionKey = "position"
    }
    
    init?(name: String, photo: UIImage?, photoLink: String, position: String) {
        self.name = name;
        self.photo = photo;
        self.photoLink = photoLink;
        self.position = position;
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey);
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey);
        aCoder.encodeObject(photoLink, forKey: PropertyKey.photoLinkKey)
        aCoder.encodeObject(position, forKey: PropertyKey.positionKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let photoLink = aDecoder.decodeObjectForKey(PropertyKey.photoLinkKey) as! String
        let position = aDecoder.decodeObjectForKey(PropertyKey.positionKey) as! String
        self.init(name: name, photo: photo, photoLink: photoLink, position: position)
    }
}
