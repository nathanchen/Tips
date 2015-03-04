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
        float labelHeight = size.height / 2;

        _tipsPercentage = [Layout setUpLabelWithFrame:CGRectMake(20, labelHeight, 80, labelHeight) text:@"" textColor:[UIColor whiteColor] textFont:21 textAlignment:NSTextAlignmentCenter isBold:YES];
        _tipsAmount = [Layout setUpLabelWithFrame:CGRectMake(140, labelHeight, 100, labelHeight) text:@"" textColor:[UIColor whiteColor] textFont:21 textAlignment:NSTextAlignmentCenter isBold:YES];
        _totalAmount = [Layout setUpLabelWithFrame:CGRectMake(270, labelHeight, 100, labelHeight) text:@"" textColor:[UIColor whiteColor] textFont:21 textAlignment:NSTextAlignmentCenter isBold:YES];
        
        [self.contentView addSubview:_tipsPercentage];
        [self.contentView addSubview:_tipsAmount];
        [self.contentView addSubview:_totalAmount];
//        [self colorLabels];
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
