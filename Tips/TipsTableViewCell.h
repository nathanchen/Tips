//
//  TipsTableViewCell.h
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Layout.h"
#import "LayoutSpecs.h"

@interface TipsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *tipsPercentage;
@property (strong, nonatomic) IBOutlet UILabel *tipsAmount;
@property (strong, nonatomic) IBOutlet UILabel *totalAmount;

@end
