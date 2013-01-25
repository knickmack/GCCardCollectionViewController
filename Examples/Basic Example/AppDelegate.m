//
//  AppDelegate.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-23.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "AppDelegate.h"
#import "GamesViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic, readonly) GamesViewController *collectionViewController;
@property (strong, nonatomic, readonly) UINavigationController *navigationController;

@end

@implementation AppDelegate

@synthesize collectionViewController = _collectionViewController;
@synthesize navigationController = _navigationController;

#pragma mark - AppDelegate

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        _window.rootViewController = self.navigationController;
    }
    
    return _window;
}

- (GamesViewController *)collectionViewController {
    if (!_collectionViewController) {
        _collectionViewController = [GamesViewController new];
    }
    
    return _collectionViewController;
}

- (UINavigationController *)navigationController {
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:self.collectionViewController];
    }
    
    return _navigationController;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
