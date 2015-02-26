//
//  QueryPageViewController.h
//  Tips
//
//  Created by Nate on 23/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "ResultPageViewController.h"

#define TAG_BILL_AMOUNT_TEXT_FIELD 1
#define TAG_PARTY_SIZE_TEXT_FIELD 2

@interface QueryPageViewController : ViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UIView *selectSplitView;
@property (weak, nonatomic) IBOutlet UIView *selectSplitViewContainer;

@end
