//
//  SAEmployeeCell.h
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAEmployee.h"

@interface SAEmployeeCell : UITableViewCell {
	UILabel *_nameLabel;
	UILabel *_jobLabel;
	UILabel *_titleLabel;
	UILabel *_yearsEmployedLabel;
	
	UIImageView *_thumbnailImageView;
}

- (void)setEmployee:(SAEmployee *)employee;

+ (CGFloat)cellHeight;

@end
