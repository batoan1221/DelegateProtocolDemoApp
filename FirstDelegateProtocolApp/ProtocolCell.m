//
//  ProtocolCell.m
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/25/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "ProtocolCell.h"

@interface ProtocolCell()


@end

@implementation ProtocolCell
- (IBAction)detailBtnPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(detailButtonPressed:button:)]) {
        [self.delegate detailButtonPressed:self button:sender];
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
