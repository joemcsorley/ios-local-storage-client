//
//  LSAPIClient.swift
//  LSAPIClient
//
//  Created by Joe McSorley on 12/22/15.
//  Copyright © 2015 Lampo Licensing, LLC. All rights reserved.
//

import Foundation


typealias responseTransformerBlockType = ([NSObject : AnyObject]!) -> [NSObject : AnyObject]!


private let userID = "AXIDLOCALUSERIOS"

private let userProfile:[NSObject:AnyObject] = [
    "email": "local.user@yoyodyne.com",
    "first_name": "Local",
    "is_premium": 0,
    "is_verified": 1,
    "last_name": "User",
    "password_reset_initiated": 0,
    "user_id": userID,
    "zip_code": "38401",
]

private let signInData:[NSObject:AnyObject] = [
    "user": [
        "is_premium": 0,
        "is_verified": 1,
        "password_reset_initiated": 0,
        "user_id": userID,
    ],
    "oauth": [
        "access_token": "e637bc89-1513-4bcf-b87c-05584f7b1621",
        "access_token_secret": "MIICSwIBADCB7AYHKoZIzj0CATCB4AIBATAsBgcqhkjOPQEBAiEA/////wAAAAEAAAAAAAAAAAAA" +
            "\nAAD///////////////8wRAQg/////wAAAAEAAAAAAAAAAAAAAAD///////////////wEIFrGNdiq" +
            "\nOpPns+u9VXaYhrxlHQawzFOw9jvOPD4n0mBLBEEEaxfR8uEsQkf4vOblY6RA8ncDfYEt6zOg9KE5" +
            "\nRdiYwpZP40Li/hp/m47n60p8D54WK84zV2sxXs7LtkBoN79R9QIhAP////8AAAAA//////////+8" +
            "\n5vqtpxeehPO5ysL8YyVRAgEBBIIBVTCCAVECAQEEIO1QQdPSX/OwCs4ms0ZmR/AbK101SANpskXT" +
            "\nZbE8ipZZoIHjMIHgAgEBMCwGByqGSM49AQECIQD/////AAAAAQAAAAAAAAAAAAAAAP//////////" +
            "\n/////zBEBCD/////AAAAAQAAAAAAAAAAAAAAAP///////////////AQgWsY12Ko6k+ez671VdpiG" +
            "\nvGUdBrDMU7D2O848PifSYEsEQQRrF9Hy4SxCR/i85uVjpEDydwN9gS3rM6D0oTlF2JjClk/jQuL+" +
            "\nGn+bjufrSnwPnhYrzjNXazFezsu2QGg3v1H1AiEA/////wAAAAD//////////7zm+q2nF56E87nK" +
            "\nwvxjJVECAQGhRANCAAQOODNaYaSNTscYvEZ8S2/jID+nTEomPi6I7YpXZznMXpixOSh7p3maoaoT" +
            "\n6LR6arEQtNBCoEJKQbJTJmOQyZPX" +
        "\n",
        "refresh_token": "aaf2a912-bd21-4b8c-95d6-36573d43fdaf",
    ],
]


class LSAPIClient: NSObject {
    
    static func setApiRootURLString(str:String) {}
    static func setRequestPathGetURNRules(arr:[NSObject]) {}
    static func setRequestPathRefreshToken(arr:[NSObject]) {}
    static func setRequestPathUserSignIn(arr:[NSObject]) {}
    static func setRequestPathUserSignUp(arr:[NSObject]) {}
    static func setRequestPathChangePassword(arr:[NSObject]) {}
    static func addGlobalHeaderValue(value:String, forKey:String) {}
    
    static func resumeRequestSequence(requestSequence:LSRequestSequence, responseTransformer:responseTransformerBlockType?) -> PMKPromise {
        return PMKPromise.new({ (fulfill, reject) -> Void in
            let data:[NSObject:AnyObject] = ["data":"its all good"]
            var result = data
            if let transformer = responseTransformer {
                result = transformer(data)
            }
            fulfill(result)
        })
    }

    static func resumeRequestSequence(requestSequence:LSRequestSequence) -> PMKPromise {
        return resumeRequestSequence(requestSequence, responseTransformer: nil)
    }
    
    static func signUp(data:[NSObject : AnyObject]) -> PMKPromise {
        return PMKPromise.new({ (fulfill, reject) -> Void in
            fulfill(signInData);
        })
    }
    
    static func signInWithUserName(userName:String, password:String) -> PMKPromise {
        return PMKPromise.new({ (fulfill, reject) -> Void in
            fulfill(signInData);
        })
    }

    static func currentUserName() -> String? {
        if let userName = userProfile["email"] as? String {
            return userName
        }
        else {
            return nil
        }
    }
    
    static func lastSignedInUserName() -> String? {
        return currentUserName()
    }
    
    static func currentUserID() -> String? {
        return userID
    }
    
    static func signOut() {}
    
    static func isSignedIn() -> Bool {
        return true
    }
    
    
}

class LHAPIClient: LSAPIClient {}