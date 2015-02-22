//
//  ViewController.h
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "Result.h"
#import "Strings.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moneyTextFieldTopConstraint;

@end

