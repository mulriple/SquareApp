//
//  SAEmployeeCell.m
//  SquareApp
//
//  Created by Tim Johnsen on 9/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SAEmployeeCell.h"

#define THUMBNAIL_SIZE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? 60.0f : 120.0f)

#define KEY_LABEL_FONT [UIFont boldSystemFontOfSize:16.0f]
#define VALUE_LABEL_FONT [UIFont systemFontOfSize:16.0f]

#define LABEL_HEIGHT ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? 22.0f : 28.0f)

@implementation SAEmployeeCell

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
	[_nameLabel release];
	[_jobLabel release];
	[_titleLabel release];
	[_yearsEmployedLabel release];
	
	[_thumbnailImageView release];
	
	[super dealloc];
}

#pragma mark -
#pragma mark UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {
		
		[self setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		// Setup Thumbnail
		
		_thumbnailImageView = [[UIImageView alloc] init];
		[_thumbnailImageView setFrame:CGRectMake(12.0f, 4.0f, THUMBNAIL_SIZE, THUMBNAIL_SIZE)];
		[_thumbnailImageView setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
		[_thumbnailImageView setBackgroundColor:[UIColor blackColor]];
		[_thumbnailImageView setContentMode:UIViewContentModeScaleAspectFill];
		[_thumbnailImageView setClipsToBounds:YES];
		[[self contentView] addSubview:_thumbnailImageView];
		
		// Setup Name labels
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(THUMBNAIL_SIZE + 24.0f, 4.0f, self.contentView.bounds.size.width - (THUMBNAIL_SIZE + 24.0f), LABEL_HEIGHT)];
		[label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[label setFont:KEY_LABEL_FONT];
		[label setText:@"Name:"];
		
		[[self contentView] addSubview:label];
		[label release];
		
		_nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x + [@"Name:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f, label.frame.origin.y, self.contentView.bounds.size.width - (label.frame.origin.x + [@"Name:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f), label.frame.size.height)];
		[_nameLabel setText:@"name"];
		[_nameLabel setFont:VALUE_LABEL_FONT];
		[_nameLabel setAutoresizingMask:[label autoresizingMask]];
		[[self contentView] addSubview:_nameLabel];
		
		// Setup Job labels
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(THUMBNAIL_SIZE + 24.0f, 4.0f + LABEL_HEIGHT, self.contentView.bounds.size.width - (THUMBNAIL_SIZE + 24.0f), LABEL_HEIGHT)];
		[label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[label setFont:KEY_LABEL_FONT];
		[label setText:@"Job:"];
		
		[[self contentView] addSubview:label];
		[label release];
		
		_jobLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x + [@"Job:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f, label.frame.origin.y, self.contentView.bounds.size.width - (label.frame.origin.x + [@"Job:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f), label.frame.size.height)];
		[_jobLabel setFont:VALUE_LABEL_FONT];
		[_jobLabel setAutoresizingMask:[label autoresizingMask]];
		[[self contentView] addSubview:_jobLabel];
		
		// Setup Title labels
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(THUMBNAIL_SIZE + 24.0f, 4.0f + 2.0f * LABEL_HEIGHT, self.contentView.bounds.size.width - (THUMBNAIL_SIZE + 24.0f), LABEL_HEIGHT)];
		[label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[label setFont:KEY_LABEL_FONT];
		[label setText:@"Title:"];
		
		[[self contentView] addSubview:label];
		[label release];
		
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x + [@"Title:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f, label.frame.origin.y, self.contentView.bounds.size.width - (label.frame.origin.x + [@"Title:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f), label.frame.size.height)];
		[_titleLabel setFont:VALUE_LABEL_FONT];
		[_titleLabel setAutoresizingMask:[label autoresizingMask]];
		[[self contentView] addSubview:_titleLabel];
		
		// Setup Years Employed labels
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(THUMBNAIL_SIZE + 24.0f, 4.0f + 3.0f * LABEL_HEIGHT, self.contentView.bounds.size.width - (THUMBNAIL_SIZE + 24.0f), LABEL_HEIGHT)];
		[label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[label setFont:KEY_LABEL_FONT];
		[label setText:@"Years Employed:"];
		
		[[self contentView] addSubview:label];
		[label release];
		
		_yearsEmployedLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x + [@"Years Employed:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f, label.frame.origin.y, self.contentView.bounds.size.width - (label.frame.origin.x + [@"Years Employed:" sizeWithFont:KEY_LABEL_FONT].width + 6.0f), label.frame.size.height)];
		[_yearsEmployedLabel setFont:VALUE_LABEL_FONT];
		[_yearsEmployedLabel setAutoresizingMask:[label autoresizingMask]];
		[[self contentView] addSubview:_yearsEmployedLabel];
	}
	
	return self;
}

- (UILabel *)textLabel {
	// Make this a no-op
	return nil;
}

- (UILabel *)detailTextLabel {
	// Make this a no-op	
	return nil;
}

- (UIImageView *)imageView {
	return _thumbnailImageView;
}

#pragma mark -
#pragma mark Instance Methods

- (void)setEmployee:(SAEmployee *)employee {
	[_nameLabel setText:[employee name]];
	[_jobLabel setText:[employee job]];
	[_titleLabel setText:[employee title]];
	[_yearsEmployedLabel setText:[NSString stringWithFormat:@"%d Year%c", [[employee yearsEmployed] intValue], ([[employee yearsEmployed] intValue] == 1 ? '\0' : 's')]];
	
	[_thumbnailImageView setImage:[UIImage imageNamed:[employee imageName]]];
}

#pragma mark -
#pragma mark Class Methods

+ (CGFloat)cellHeight {
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		return 120.0f;
	}
	
	return 140.0f;
}

@end
