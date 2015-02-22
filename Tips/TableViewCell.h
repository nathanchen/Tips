//
//  TableViewCell.h
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tipsPercentage;
@property (weak, nonatomic) IBOutlet UILabel *tipsAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;

@end
