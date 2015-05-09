//
//  AppDelegate.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "AppDelegate.h"

// Controllers
#import "CCCryptoListViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[CCCryptoListViewController alloc] initWithStyle:UITableViewStylePlain]];
    
    [self.window makeKeyAndVisible];
    
    [self applyAppearance];
    
    return YES;
}

- (void)applyAppearance {
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont cc_navbarTitleFont], NSForegroundColorAttributeName : [UIColor cc_darkTealColor] }];
    [[UINavigationBar appearance] setTintColor:[UIColor cc_darkTealColor]];
    [[UINavigationBar appearance] setBarTintColor: [UIColor cc_lightTealColor]];
}

@end
