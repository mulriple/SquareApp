//
//  SAEmployee.m
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SAEmployee.h"

@implementation SAEmployee

#pragma mark -
#pragma mark Properties

@synthesize name;
@synthesize job;
@synthesize title;
@synthesize yearsEmployed;

@synthesize imageURL;

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
	[name release];
	[job release];
	[title release];
	
	[imageURL release];
	
	[super dealloc];
}

#pragma mark -
#pragma mark Class Methods

+ (NSMutableArray *)employees {
	static NSMutableArray *employees = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{		
		
		// In a real App, this would load from CoreData or a file outside of the bundle
		
		NSMutableArray *serializedEmployees = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"employees" ofType:@"plist"]];
		
		employees = [[NSMutableArray alloc] init];
		
		for (NSDictionary *serializedEmployee in serializedEmployees) {
			SAEmployee *employee = [[SAEmployee alloc] init];
			
			for (NSString *key in serializedEmployee) {
				[employee setValue:[serializedEmployee valueForKey:@"key"] forKey:key];
			}
			
			[employees addObject:employee];
			[employee release];
		}
	});
	
	return employees;
}

@end
