//
//  SAEmployeesViewController.m
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SAEmployeesViewController.h"
#import "SAEmployee.h"

@implementation SAEmployeesViewController

#pragma mark -
#pragma mark Properties

@synthesize tableView;

#pragma mark -
#pragma mark UIViewController

- (void)loadView {
	[super loadView];
	
	// Set up the table view
	
	self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, [[self view] bounds].size.width, [[self view] bounds].size.height - 44.0f) style:UITableViewStylePlain] autorelease];
	[tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	[tableView setDataSource:self];
	[tableView setDelegate:self];
	
	[[self view] addSubview:self.tableView];
	
	// Add a header
	
	UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectInset(CGRectMake(0.0f, 0.0f, [[self view] bounds].size.width, 44.0f), 12.0f, 6.0f)];
	[headerLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
	[headerLabel setText:@"Employees"];
	[headerLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
	[[self view] addSubview:headerLabel];
	[headerLabel release];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	
	self.tableView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		return YES;
	}
	
	return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark -
#pragma mark UITableViewDatasource

- (int)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1.0f;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if ([SAEmployee employees]) {
		return [[SAEmployee employees] count];
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"cell"];
	
	if (!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"] autorelease];
	}
	
	SAEmployee *employee = [[SAEmployee employees] objectAtIndex:indexPath.row];
	
	[[cell textLabel] setText:[employee name]];
	[[cell detailTextLabel] setText:[employee title]];
	
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

@end
