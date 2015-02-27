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

@interface TipsTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithBillAmount: (float)billAmount;

@end
