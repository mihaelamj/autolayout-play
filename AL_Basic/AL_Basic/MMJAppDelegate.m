//
//  MMJAppDelegate.m
//  AL_Basic
//
//  Created by Mihaela Mihaljević Jakić on 20/04/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "MMJAppDelegate.h"

#import "ALViewController.h"

@implementation MMJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[ALViewController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
