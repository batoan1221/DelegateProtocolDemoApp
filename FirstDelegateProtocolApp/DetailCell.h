//
//  DetailCell.h
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/26/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailCell <NSObject>

- (void)detailCellPressed:(UITableViewCell *)cell button:(id)sender;

@end

@interface DetailCell : UITableViewCell

@property (nonatomic, assign) id <DetailCell> delegate;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@end
