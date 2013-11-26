//
//  DetailCell.m
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/26/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "DetailCell.h"


@implementation DetailCell

- (void)tap:(UITapGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
