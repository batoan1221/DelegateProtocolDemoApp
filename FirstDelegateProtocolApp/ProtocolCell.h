//
//  ProtocolCell.h
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/25/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolCell <NSObject>

- (void)detailButtonPressed:(UITableViewCell *)cell button:(id)sender;

@end

@interface ProtocolCell : UITableViewCell

@property (nonatomic, assign) id <ProtocolCell> delegate;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;

@end
