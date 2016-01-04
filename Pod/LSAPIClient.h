//
//  LSAPIClient.h
//  LSAPIClient
//
//  Created by Joe McSorley on 1/4/16.
//  Copyright © 2016 Lampo Licensing, LLC. All rights reserved.
//

#ifndef LHAPIClient_LHAPIClient_h
#define LHAPIClient_LHAPIClient_h

@import Foundation;
#import <PromiseKit/PromiseKit.h>
#import "LSAPIClient-Swift.h"


typedef NSDictionary* (^responseTransformerBlockType)(NSDictionary *inputDict);


@interface LSAPIClient : NSObject

+ (void)setApiRootURLString:(NSString*)urlString;
+ (void)setRequestPathGetURNRules:(NSArray*)requestPath;
+ (void)setRequestPathRefreshToken:(NSArray*)requestPath;
+ (void)setRequestPathUserSignIn:(NSArray*)requestPath;
+ (void)setRequestPathUserSignUp:(NSArray*)requestPath;
+ (void)setRequestPathChangePassword:(NSArray*)requestPath;
+ (void)addGlobalHeaderValue:(NSString*)value forKey:(NSString*)key;

+ (PMKPromise*)resumeRequestSequence:(LHRequestSequence*)requestSequence responseTransformer:(responseTransformerBlockType)transformer;
+ (PMKPromise*)resumeRequestSequence:(LHRequestSequence*)requestSequence;

+ (PMKPromise*)signUp:(NSDictionary*)signUpData;
+ (PMKPromise*)signInWithUserName:(NSString*)userName password:(NSString*)password;
+ (void)signOut;

+ (PMKPromise*)changePassword:(NSString*)newPassword;

+ (BOOL)isSignedIn;
+ (NSString*)lastSignedInUserName;
+ (NSString*)currentUserName;
+ (NSString*)currentUserID;

@end


@interface LHAPIClient: LSAPIClient
@end

#endif