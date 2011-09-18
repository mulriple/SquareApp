//
//  SAEmployee.h
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAEmployee : NSObject

// Specified in job description

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *job;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) NSTimeInterval *yearsEmployed;

// Bonus Points

@property (nonatomic, retain) NSString *imageURL;

// Class Methods

+ (NSMutableArray *)employees;

@end
