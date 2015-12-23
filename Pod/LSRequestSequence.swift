//
//  LSRequestSequence.swift
//  LSAPIClient
//
//  Created by Joe McSorley on 12/22/15.
//  Copyright © 2015 Lampo Licensing, LLC. All rights reserved.
//

import Foundation

class LSRequestSequence: NSObject {
    
    let linkRelations:[String]?
    let urn:String?
    var requestData:[NSObject:AnyObject]?
    
    init(withLinkRelations linkRelations:[String]?, urnToParse urn:String?) {
        self.urn = urn
        self.linkRelations = linkRelations
    }
    
    convenience init(withURNToResolve urn:String) {
        self.init(withLinkRelations:[], urnToParse:urn)
    }
}

class LHRequestSequence: LSRequestSequence {
    
    convenience init(withLinkRelations linkRelations:[String]?, urnToParse urn:String?, signingStrategy strategy:Int?) {
        self.init(withLinkRelations:linkRelations, urnToParse:urn)
    }
    
    convenience init(withURNToResolve urn:String, signingStrategy strategy:Int?) {
        self.init(withLinkRelations:[], urnToParse:urn)
    }
}