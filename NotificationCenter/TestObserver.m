//
//  TestObserver.m
//  NotificationCenter
//
//  Created by DDC.Mac2 on 9/26/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "TestObserver.h"

@implementation TestObserver

- (id)init
{
    self = [super init];
    
    if (!self) return nil;
    
    return self;
}

- (void)notifyReceivers:(NSString *)msg
{
    NSDictionary *message = [NSDictionary dictionaryWithObject:msg forKey:@"messageKey"];
    
    [[NSNotificationCenter defaultCenter]
        postNotificationName:@"TestNotification"
        object:self userInfo:message];
}

@end
