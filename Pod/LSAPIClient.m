//
//  LSAPIClient.m
//  LSAPIClient
//
//  Created by Joe McSorley on 1/4/16.
//  Copyright © 2016 Lampo Licensing, LLC. All rights reserved.
//

#import "LSAPIClient.h"

static const NSString* userID = @"AXIDLOCALUSERIOS";

NSDictionary* userProfile()
{
    static NSDictionary* u = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        u = @{
            @"email":@"local.user@yoyodyne.com",
            @"first_name"              :@"Local",
            @"is_premium"              :@0,
            @"is_verified"             :@1,
            @"last_name"               :@"User",
            @"password_reset_initiated":@0,
            @"user_id"                 :userID,
            @"zip_code"                :@"38401",
        };
    });
    return u;
}

NSDictionary* signInData()
{
    static NSDictionary* data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = @{
            @"user":@{
                @"is_premium":@0,
                @"is_verified"             :@1,
                @"password_reset_initiated":@0,
                @"user_id"                 :userID,
            },
            @"oauth":@{
                @"access_token":@"e637bc89-1513-4bcf-b87c-05584f7b1621",
                @"access_token_secret":
                @"MIICSwIBADCB7AYHKoZIzj0CATCB4AIBATAsBgcqhkjOPQEBAiEA/////wAAAAEAAAAAAAAAAAAA"
                "\nAAD///////////////8wRAQg/////wAAAAEAAAAAAAAAAAAAAAD///////////////wEIFrGNdiq"
                "\nOpPns+u9VXaYhrxlHQawzFOw9jvOPD4n0mBLBEEEaxfR8uEsQkf4vOblY6RA8ncDfYEt6zOg9KE5"
                "\nRdiYwpZP40Li/hp/m47n60p8D54WK84zV2sxXs7LtkBoN79R9QIhAP////8AAAAA//////////+8"
                "\n5vqtpxeehPO5ysL8YyVRAgEBBIIBVTCCAVECAQEEIO1QQdPSX/OwCs4ms0ZmR/AbK101SANpskXT"
                "\nZbE8ipZZoIHjMIHgAgEBMCwGByqGSM49AQECIQD/////AAAAAQAAAAAAAAAAAAAAAP//////////"
                "\n/////zBEBCD/////AAAAAQAAAAAAAAAAAAAAAP///////////////AQgWsY12Ko6k+ez671VdpiG"
                "\nvGUdBrDMU7D2O848PifSYEsEQQRrF9Hy4SxCR/i85uVjpEDydwN9gS3rM6D0oTlF2JjClk/jQuL+"
                "\nGn+bjufrSnwPnhYrzjNXazFezsu2QGg3v1H1AiEA/////wAAAAD//////////7zm+q2nF56E87nK"
                "\nwvxjJVECAQGhRANCAAQOODNaYaSNTscYvEZ8S2/jID+nTEomPi6I7YpXZznMXpixOSh7p3maoaoT"
                "\n6LR6arEQtNBCoEJKQbJTJmOQyZPX"
                "\n",
                @"refresh_token"      :@"aaf2a912-bd21-4b8c-95d6-36573d43fdaf",
            },
        };
    });
    return data;
}

@implementation LSAPIClient

+ (void)setApiRootURLString:(NSString*)urlString
{
}

+ (void)setRequestPathGetURNRules:(NSArray*)requestPath
{
}

+ (void)setRequestPathRefreshToken:(NSArray*)requestPath
{
}

+ (void)setRequestPathUserSignIn:(NSArray*)requestPath
{
}

+ (void)setRequestPathUserSignUp:(NSArray*)requestPath
{
}

+ (void)setRequestPathChangePassword:(NSArray*)requestPath
{
}

+ (void)addGlobalHeaderValue:(NSString*)value forKey:(NSString*)key
{
}

+ (PMKPromise*)resumeRequestSequence:(LHRequestSequence*)requestSequence responseTransformer:(responseTransformerBlockType)transformer
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
        NSDictionary* result = @{@"data":@"its all good"};
        if (transformer) {
            result = transformer(result);
        }
        fulfill(result);
    }];
}

+ (PMKPromise*)resumeRequestSequence:(LHRequestSequence*)requestSequence
{
    return [self resumeRequestSequence:requestSequence responseTransformer:nil];
}

+ (PMKPromise*)signUp:(NSDictionary*)signUpData
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
        fulfill(signInData());
    }];
}

+ (PMKPromise*)signInWithUserName:(NSString*)userName password:(NSString*)password
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
        fulfill(signInData());
    }];
}

+ (void)signOut
{
}

+ (PMKPromise*)changePassword:(NSString*)newPassword
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
        fulfill(@{@"data":@"its changed"});
    }];
}

+ (BOOL)isSignedIn
{
    return YES;
}

+ (NSString*)lastSignedInUserName
{
    return userProfile()[@"email"];
}

+ (NSString*)currentUserName
{
    return [self lastSignedInUserName];
}

+ (NSString*)currentUserID
{
    return userID;
}

@end


@implementation LHAPIClient
@end
