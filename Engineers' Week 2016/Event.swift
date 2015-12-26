//
//  Event.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/21/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class Event: NSObject, NSCoding {
    var name: String
    var photo: UIImage?
    var date: String
    var location: String
    var desc: String
    var photoLink: String
    var society: String
    var director: String
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let dateKey = "date"
        static let locationKey = "location"
        static let descKey = "desc"
        static let photoLinkKey = "photoLink"
        static let societyKey = "society"
        static let directorKey = "director"
    }
    
    init?(name: String, photo: UIImage?, date: String, location: String, desc: String, photoLink: String, society: String, director: String) {
        self.name = name;
        self.photo = photo;
        self.date = date;
        self.location = location;
        self.desc = desc;
        self.photoLink = photoLink;
        self.society = society;
        self.director = director;
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey);
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey);
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey);
        aCoder.encodeObject(location, forKey: PropertyKey.locationKey)
        aCoder.encodeObject(desc, forKey: PropertyKey.descKey)
        aCoder.encodeObject(photoLink, forKey: PropertyKey.photoLinkKey)
        aCoder.encodeObject(society, forKey: PropertyKey.societyKey)
        aCoder.encodeObject(director, forKey: PropertyKey.directorKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! String
        let location = aDecoder.decodeObjectForKey(PropertyKey.locationKey) as! String
        let desc = aDecoder.decodeObjectForKey(PropertyKey.descKey) as! String
        let photoLink = aDecoder.decodeObjectForKey(PropertyKey.photoLinkKey) as! String
        let society = aDecoder.decodeObjectForKey(PropertyKey.societyKey) as! String
        let director = aDecoder.decodeObjectForKey(PropertyKey.directorKey) as! String
        self.init(name: name, photo: photo, date: date, location: location, desc: desc, photoLink: photoLink, society: society, director: director)
    }
}
