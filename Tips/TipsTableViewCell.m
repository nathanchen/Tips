//
//  TipsTableViewCell.m
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "TipsTableViewCell.h"

@implementation TipsTableViewCell

const int tipsPercentageLabelWidthRatio = 0.1;
const float tipsAmountLabelWidthRatio = 0.4;
const float totalAmountLabelWidthRatio = 0.4;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGSize size = self.frame.size;
        
        _tipsPercentage = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 50, 20)];
        _tipsAmount = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        _totalAmount = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 100, 20)];
        
        [self.contentView addSubview:_tipsPercentage];
        [self.contentView addSubview:_tipsAmount];
        [self.contentView addSubview:_totalAmount];
        
        [self colorLabels];
    }
    return self;
}

#pragma mark - for debuging only
- (void)colorLabels
{
    _tipsPercentage.backgroundColor = [UIColor redColor];
    _tipsAmount.backgroundColor = [UIColor greenColor];
    _totalAmount.backgroundColor = [UIColor yellowColor];
}

@end
