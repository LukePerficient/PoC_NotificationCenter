//
//  TestReceiver.m
//  NotificationCenter
//
//  Created by DDC.Mac2 on 9/26/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "TestReceiver.h"

@implementation TestReceiver

- (id) initWithId:(NSInteger)defaultId
{
    self = [super init];
    
    if (self) {
        _ID = defaultId;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"TestNotification"]) {
        NSDictionary *receivedMessage = notification.userInfo;
        _message = [receivedMessage objectForKey:@"messageKey"];
        
        NSLog(@"Receiver %lu Message: %@",_ID, _message);
    }
    
}

@end
