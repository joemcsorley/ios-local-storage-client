//
//  ViewController.m
//  LSAPIClient
//
//  Created by Joe McSorley on 12/22/15.
//  Copyright © 2015 Lampo Licensing, LLC. All rights reserved.
//

#import "ViewController.h"
#import <PromiseKit/PromiseKit.h>
#import <PureLayout/PureLayout.h>
#import "LSAPIClient.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        LSRequestSequence* requestSequence = [[LSRequestSequence alloc] initWithLinkRelations:@[@"one", @"two"]
                                                                                   urnToParse:nil];
        requestSequence.requestData = nil;
        NSLog(@"link relations = %@, urn = %@", requestSequence.linkRelations, requestSequence.urn);
        
        [LHAPIClient resumeRequestSequence:requestSequence responseTransformer:nil].then(^(NSDictionary* data) {
            NSLog(@"Got data from call: %@", data);
        }).catch(^(NSError* error) {
            NSLog(@"Got error from call: %@", error);
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    UILabel* label = [[UILabel alloc] initForAutoLayout];
    [self.view addSubview:label];
    [label autoCenterInSuperview];
    label.text = @"LSAPIClient Test";
}

@end
