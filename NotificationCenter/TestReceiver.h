//
//  TestReceiver.h
//  NotificationCenter
//
//  Created by DDC.Mac2 on 9/26/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestReceiver : NSObject

@property NSInteger ID;
@property (strong, nonatomic) NSString *message;

- (id) initWithId:(NSInteger)defaultId;
- (void) receiveTestNotification:(NSNotification *) notification;

@end
