//
//  ResultPageViewController.h
//  Tips
//
//  Created by Nate on 24/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#define DEVICE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DEVICE_WIDTH  ([[UIScreen mainScreen] bounds].size.width)

@interface ResultPageViewController : ViewController
@property (weak, nonatomic) IBOutlet UIView *billDetailView;
@property (weak, nonatomic) IBOutlet UIImageView *billDetailViewVerticalSplitOne;
@property (weak, nonatomic) IBOutlet UIImageView *billDetailViewVerticalSplitTwo;
@property (weak, nonatomic) IBOutlet UIImageView *billDetailViewHorizontalSplit;
@property (weak, nonatomic) IBOutlet UILabel *billAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *partySizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end
