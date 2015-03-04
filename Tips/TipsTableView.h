//
//  TipsTableView.h
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Result.h"
#import "TipsTableViewCell.h"
#import "LayoutSpecs.h"

#define DEFAULT_TIPS_PERCENTAGE 0.10

@interface TipsTableView : UITableView <UITableViewDataSource>

@property (nonatomic) float tipsPercentage;
@property (nonatomic) NSMutableArray *results;

- (instancetype)initWithBillAmount: (float)billAmount;

@end
