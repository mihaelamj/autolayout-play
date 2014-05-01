//
//  MMJAppDelegate.m
//  AL_Simple
//
//  Created by Mihaela Mihaljević Jakić on 01/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "MMJAppDelegate.h"

#import "ALChooserViewController.h"

@implementation MMJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //setup navigation controller and put it as a root
    self.window.rootViewController = self.navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Properties

- (UINavigationController *)navigationController
{
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:[[ALChooserViewController alloc] init]];
    }
    return _navigationController;
}

@end
