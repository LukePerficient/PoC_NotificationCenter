//
//  NotificationCenterTests.m
//  NotificationCenterTests
//
//  Created by DDC.Mac2 on 9/26/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObserver.h"
#import "TestReceiver.h"

@interface NotificationCenterTests : XCTestCase

@property (strong,nonatomic) TestObserver *observer;
@property (strong,nonatomic) NSMutableArray<TestReceiver *> *receivers;

@end

@implementation NotificationCenterTests

- (void)setUp {
    [super setUp];
    _observer = [[TestObserver alloc] init];
    _receivers = [[NSMutableArray<TestReceiver *> alloc] init];
}

- (void)tearDown {
    _observer = nil;
    _receivers = nil;
    [super tearDown];
}

- (void)testAddReceiversToObserverClass {
    // Add receivers to observer
    [_receivers addObject:[[TestReceiver alloc] initWithId:1]];
    [_receivers addObject:[[TestReceiver alloc] initWithId:2]];
    [_receivers addObject:[[TestReceiver alloc] initWithId:3]];
    
    // Send message to all receivers
    [_observer notifyReceivers:@"Hello Receivers"];
    
    // Verify receivers were added by validating they received the message
    XCTAssertEqual(_receivers[0].message, @"Hello Receivers");
    XCTAssertEqual(_receivers[1].message, @"Hello Receivers");
    XCTAssertEqual(_receivers[2].message, @"Hello Receivers");
}

- (void)testRemoveReceiversFromObserverClass {
    // Add receivers to observer
    [_receivers addObject:[[TestReceiver alloc] initWithId:1]];
    [_receivers addObject:[[TestReceiver alloc] initWithId:2]];
    [_receivers addObject:[[TestReceiver alloc] initWithId:3]];
    
    // Send message to all receivers
    [_observer notifyReceivers:@"Hello Receivers"];
    
    // Remove last added receiver from observer
    [_receivers removeObject:_receivers[2]];
    
    // Verify receivers were added by validating they received the message
    XCTAssert(_receivers[0] != nil);
    XCTAssert(_receivers[1] != nil);
    XCTAssertEqual([_receivers count], 2);
}

@end
