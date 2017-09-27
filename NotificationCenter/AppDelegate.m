//
//  AppDelegate.m
//  NotificationCenter
//
//  Created by DDC.Mac2 on 9/26/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "AppDelegate.h"
#import "TestObserver.h"
#import "TestReceiver.h"
#import "KSPromise.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    KSPromise *step1 = [self takeTest];
    
    [step1 then:^id (id value) {
        return [self notifyUserScore];
    }];
    
    return YES;
}


- (KSPromise *)takeTest
{
    // Take the test
    KSPromise *step1 = [KSPromise promise:^(resolveType resolve, rejectType reject) {
        
        // Take Test
        
        BOOL isTestComplete = YES;
        
        if (isTestComplete) {
            resolve(@"Test Complete.");
        } else {
            NSError *error = [NSError errorWithDomain:@"com.yourcompany.appname" code:3456 userInfo:@{NSLocalizedDescriptionKey:@"Test Incomplete."}];
            reject(error);
        }
    }];
    
    
    return step1;
}


// Notification Center calls, don't mind the KSPromise logic aswell
- (KSPromise *)notifyUserScore
{
    KSPromise *step2 = [KSPromise promise:^(resolveType resolve, rejectType reject) {
        
        // Notify user of score
        // Allocate observer and three receiver objects.
        TestObserver *observer = [[TestObserver alloc] init];
        
        TestReceiver *receiver1 = [[TestReceiver alloc] initWithId:1];
        TestReceiver *receiver2 = [[TestReceiver alloc] initWithId:2];
        TestReceiver *receiver3 = [[TestReceiver alloc] initWithId:3];
        
        // Modify observer state
        [observer notifyReceivers:@"11"];
        [observer notifyReceivers:@"5"];
        [observer notifyReceivers:@"10"];
        
        // Deallocate a receiver object and modify the observer state one more time.
        receiver3 = nil;
        
        [observer notifyReceivers:@"12"];
        
        BOOL isUserNotified = YES;
        
        if (isUserNotified) {
            resolve(@"User Notified.");
        } else {
            NSError *error = [NSError errorWithDomain:@"com.yourcompany.appname" code:3456 userInfo:@{NSLocalizedDescriptionKey:@"Error notifing user."}];
            reject(error);
        }
    }];
    
    
    return step2;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
