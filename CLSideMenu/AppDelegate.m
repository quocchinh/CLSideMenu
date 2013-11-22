//
//  AppDelegate.m
//  CLSideMenu
//
//  Created by Chinh Le on 11/22/13.
//  Copyright (c) 2013 Chinh Le. All rights reserved.
//

#import "AppDelegate.h"
#import "CLSideMenuViewController.h"
#import "ExampleMenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navCon = [sb instantiateViewControllerWithIdentifier:@"navCon"];
    
    ExampleMenuViewController *menuViewController = [sb instantiateViewControllerWithIdentifier:@"menuViewController"];
    [menuViewController setMainViewController:navCon];
    
    CLSideMenuViewController *sideMenuViewController = [[CLSideMenuViewController alloc] initWithMenuViewController:menuViewController mainViewController:navCon];
    
    self.window.rootViewController = sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
