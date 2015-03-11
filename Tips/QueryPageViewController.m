//
//  QueryPageViewController.m
//  Tips
//
//  Created by Nate on 4/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "QueryPageViewController.h"

@interface QueryPageViewController ()
{
    UIView *billAmountView;
    UITextField *billAmountTextField;
    UILabel *billAmountLabel;
    
    UIView *selectSplitView;
    UILabel *questionLabel;
    UILabel *partySizeLabel;
    UIButton *increaseButton;
    UIButton *decreaseButton;
    
    UIButton *doneButton;
    
    BOOL hasTransformed;
    
    int numberOfPeopleToSplitBillWith;
}

@end

@implementation QueryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.view.backgroundColor = [UIColor whiteColor];
    
    numberOfPeopleToSplitBillWith = 1;
    
    hasTransformed = NO;
    
    [self layoutSelectSplitViewContainer];
    
    [self layoutBillAmountViewContainer];
}

#pragma mark - textfield delegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [billAmountTextField resignFirstResponder];
    return NO;
}

- (void)textFieldDidEndEditing: (UITextField *)textField
{
    if (! hasTransformed)
    {
        [self layoutTransformedBillAmountViewContainer];
        [UIView animateWithDuration:0.3
                         animations:^{
                             [self.view layoutIfNeeded];
                         }
                         completion:^(BOOL finished) {
                             [self layoutTransformedSelectSplitViewContainer];
                             [self layoutDoneButton];
                             [UIView transitionWithView:selectSplitView
                                               duration:0.5
                                                options:UIViewAnimationOptionTransitionFlipFromLeft
                                             animations:^{
                                                 selectSplitView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
                                             }
                                             completion:^(BOOL finished) {
                                                 
                                             }];
                         }];
        
        hasTransformed = YES;
    }
}

#pragma mark - layout containers
- (void)layoutBillAmountViewContainer
{
    [self layoutBillAmountView];
    [self layoutBillAmountTextField];
    [self layoutBillAmountLabel];
    
    [billAmountLabel setHidden:YES];
}

- (void)layoutTransformedBillAmountViewContainer
{
    [Layout setTextFiled:billAmountTextField withText:billAmountTextField.text fontSize:30 textColor:[UIColor whiteColor] isBold:YES];
    billAmountTextField.placeholder = @"";
    billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    [billAmountView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:billAmountViewWidthRatioTrans * DEVICE_WIDTH]);
        make.height.equalTo([NSNumber numberWithFloat:billAmountViewHeightRatio * DEVICE_HEIGHT]);
        make.top.equalTo(self.view).offset(billAmountViewMarginTopRatio * DEVICE_HEIGHT);
        make.left.equalTo(self.view.mas_left);
    }];
    
    billAmountLabel.hidden = NO;
}

- (void)layoutSelectSplitViewContainer
{
    [self layoutSelectSplitView];
    [self layoutQuestionLabel];
    [self layoutPartySizeLabel];
    [self layoutIncreaseButton];
    [self layoutDecreaseButton];
    
    selectSplitView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    
    [questionLabel setHidden:YES];
    [partySizeLabel setHidden:YES];
    [increaseButton setHidden:YES];
    [decreaseButton setHidden:YES];
}

- (void)layoutTransformedSelectSplitViewContainer
{
    [questionLabel setHidden:NO];
    [partySizeLabel setHidden:NO];
    [increaseButton setHidden:NO];
    [decreaseButton setHidden:NO];
}

#pragma mark - layout seperate views
- (void)layoutBillAmountView
{
    billAmountView = UIView.new;
    billAmountView.backgroundColor = GREENISH_COLOR;
    [self.view addSubview:billAmountView];
    
    [billAmountView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithFloat:billAmountViewHeightRatio * DEVICE_HEIGHT]);
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).offset(billAmountViewMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutBillAmountTextField
{
    billAmountTextField = UITextField.new;
    billAmountTextField.placeholder = @"Tap to enter your bill amount";
    [Layout setTextFiled:billAmountTextField withText:@"" fontSize:23 textColor:[UIColor whiteColor] isBold:YES];
    billAmountTextField.delegate = self;
    billAmountTextField.textAlignment = NSTextAlignmentCenter;
    billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [billAmountTextField sizeToFit];
    [billAmountView addSubview:billAmountTextField];
    
    [billAmountTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(billAmountView);
    }];
}

- (void)layoutBillAmountLabel
{
    billAmountLabel = UILabel.new;
    [Layout setLabel:billAmountLabel withText:@"Bill Amount" fontSize:13 textColor:DARK_GREENISH_COLOR isBold:YES];
    [self.view addSubview:billAmountLabel];
    
    [billAmountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(billAmountLabelTopRatio * DEVICE_HEIGHT);
        make.centerX.equalTo(billAmountView);
    }];
}

- (void)layoutSelectSplitView
{
    selectSplitView = UIView.new;
    selectSplitView.backgroundColor = LIGHT_YELLOWISH_COLOR;
    [self.view addSubview:selectSplitView];
    
    [selectSplitView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:selectSplitViewWidthRatio * DEVICE_WIDTH]);
        make.height.equalTo([NSNumber numberWithFloat:selectSplitViewHeightRatio * DEVICE_HEIGHT]);
        make.top.equalTo(self.view).offset(selectSplitViewMarginTopRatio * DEVICE_HEIGHT);
        make.left.equalTo(self.view.mas_left).offset(billAmountViewWidthRatioTrans * DEVICE_WIDTH);
    }];
}

- (void)layoutQuestionLabel
{
    questionLabel = UILabel.new;
    [Layout setLabel:questionLabel withText:@"Split the bill with" fontSize:13 textColor:DARK_GREENISH_COLOR isBold:YES];
    [selectSplitView addSubview:questionLabel];
    
    [questionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(questionLabelTopRatio * DEVICE_HEIGHT);
        make.centerX.equalTo(selectSplitView);
    }];
}

- (void)layoutPartySizeLabel
{
    partySizeLabel = UILabel.new;
    [Layout setLabel:partySizeLabel withText:[NSString stringWithFormat:@"%d", numberOfPeopleToSplitBillWith] fontSize:30 textColor:DARK_GREENISH_COLOR isBold:YES];
    [selectSplitView addSubview:partySizeLabel];
    
    [partySizeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(selectSplitView);
    }];
}

- (void)layoutIncreaseButton
{
    increaseButton = UIButton.new;
    [increaseButton setTitle:@"+" forState:UIControlStateNormal];
    [increaseButton setTitleColor:DARK_GREENISH_COLOR forState:UIControlStateNormal];
    [increaseButton addTarget:self action:@selector(increaseButtonPressed) forControlEvents:UIControlEventTouchDown];
    [Layout setLabel:increaseButton.titleLabel withText:@"+" fontSize:40 textColor:DARK_GREENISH_COLOR isBold:YES];
    [increaseButton sizeToFit];
    [selectSplitView addSubview:increaseButton];
    
    [increaseButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selectSplitView.mas_centerY);
        make.right.equalTo(selectSplitView.mas_right).offset(-increaseButtonMarginRightRatio * DEVICE_WIDTH);
    }];
}

- (void)layoutDecreaseButton
{
    decreaseButton = UIButton.new;
    [decreaseButton setTitle:@"-" forState:UIControlStateNormal];
    [decreaseButton setTitleColor:DARK_GREENISH_COLOR forState:UIControlStateNormal];
    [decreaseButton addTarget:self action:@selector(decreaseButtonPressed) forControlEvents:UIControlEventTouchDown];
    [Layout setLabel:decreaseButton.titleLabel withText:@"-" fontSize:40 textColor:DARK_GREENISH_COLOR isBold:YES];
    [decreaseButton sizeToFit];
    [selectSplitView addSubview:decreaseButton];
    
    [decreaseButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selectSplitView.mas_centerY);
        make.left.equalTo(selectSplitView.mas_left).offset(decreaseButtonMarginLeftRatio * DEVICE_WIDTH);
    }];
}

- (void)layoutDoneButton
{
    doneButton = UIButton.new;
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton setTitleColor:DARK_GREENISH_COLOR forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButtonPressed) forControlEvents:UIControlEventTouchDown];
    [Layout setLabel:doneButton.titleLabel withText:@"" fontSize:20 textColor:DARK_GREENISH_COLOR isBold:YES];
    [doneButton sizeToFit];
    [self.view addSubview:doneButton];
    
    [doneButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(doneButtonMarginTopRatio * DEVICE_HEIGHT);
    }];
}

#pragma mark - buttons clicked methods
- (void)increaseButtonPressed
{
    if (numberOfPeopleToSplitBillWith < NUMBER_OF_PEOPLE_SPLIT_BILL_WITH_THRESHOLD)
    {
        numberOfPeopleToSplitBillWith ++;
    }
    [partySizeLabel setText:[NSString stringWithFormat:@"%d", numberOfPeopleToSplitBillWith]];
}

- (void)decreaseButtonPressed
{
    if (numberOfPeopleToSplitBillWith > 1)
    {
        numberOfPeopleToSplitBillWith --;
    }
    [partySizeLabel setText:[NSString stringWithFormat:@"%d", numberOfPeopleToSplitBillWith]];
}

- (void)doneButtonPressed
{
    ResultPageViewController *resultPageVC = [[ResultPageViewController alloc] init];
    resultPageVC.billAmount = [billAmountTextField.text floatValue];
    resultPageVC.partySize = numberOfPeopleToSplitBillWith;
    
    [self presentViewController:resultPageVC animated:YES completion:nil];
}


@end
