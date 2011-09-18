//
//  SAAppDelegate.m
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SAAppDelegate.h"
#import "SAEmployeesViewController.h"

@implementation SAAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (void)dealloc {
	[_window release];
	[_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	SAEmployeesViewController *employeesViewController = [[SAEmployeesViewController alloc] init];
	
	self.navigationController = [[[UINavigationController alloc] initWithRootViewController:employeesViewController] autorelease];
	[self.navigationController setNavigationBarHidden:YES];
	
	[employeesViewController release];
	
	[self.window addSubview:[self.navigationController view]];
	
    return YES;
}

@end
