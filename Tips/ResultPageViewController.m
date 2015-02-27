//
//  ResultPageViewController.m
//  Tips
//
//  Created by Nate on 24/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "ResultPageViewController.h"

@interface ResultPageViewController ()
{
    UIView *superview;
    UIView *billDetailView;
    UIImageView *billDetailViewVerticalSplitOne;
    UIImageView *billDetailViewVerticalSplitTwo;
    UIImageView *billDetailViewHorizontalSplit;
    UILabel *billAmountLabel;
    UILabel *partySizeLabel;
    UILabel *tipsLabel;
    UILabel *totalLabel;
    
    UILabel *billAmountValueLabel;
    UILabel *partySizeValueLabel;
    UILabel *tipsValueLabel;
    UILabel *totalValueLabel;
    
    UIView *paymentForEachView;
    UILabel *paymentForEachLabel;
    UILabel *eachLabel;
    UIButton *roundButton;
    
    TipsTableView *tipsTableView;
    NSMutableArray *results;
    
    Layout *layout;
}

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    superview = self.view;
    [superview setBackgroundColor:[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]];
    
    results = [[NSMutableArray alloc] init];
    layout = [[Layout alloc] init];
    _billAmount = 120;
    
    [self layoutBillDetailView];
    [self layoutBillDetailViewVerticalSplitOne];
    [self layoutBillDetailViewVerticalSplitTwo];
    [self layoutBillDetailViewHorizontalSplit];
    
    [self layoutBillAmountLabel];
    [self layoutTipsLabel];
    [self layoutPartySizeLabel];
    [self layoutTotalLabel];
    
    [self layoutBillAmountValueLabel];
    [self layoutPartySizeValueLabel];
    [self layoutTipsValueLabel];
    [self layoutTotalValueLabel];
    
    [self layoutPaymentForEachView];
    [self layoutPaymentForEachLabel];
    [self layoutEachLabel];
    [self layoutRoundButton];
    
    [self layoutTipsTableView];
    [self updateTipsTableView];
    
//    [self colorLabels];
}

- (void)updateTipsTableView
{
    [tipsTableView reloadData];
}

- (void)layoutBillDetailView
{
    billDetailView = UIView.new;
    [superview addSubview:billDetailView];
    
    [billDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithInt:billDetailViewHeight]);
        make.top.equalTo([NSNumber numberWithInt:billDetailViewMarginTop]);
    }];
}

- (void)layoutBillDetailViewVerticalSplitOne
{
    billDetailViewVerticalSplitOne = UIImageView.new;
    [billDetailViewVerticalSplitOne setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderVerticalSplit"]]];
    [superview addSubview:billDetailViewVerticalSplitOne];
    
    [billDetailViewVerticalSplitOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitOneHeight]);
        make.width.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitOneWidth]);
        make.centerY.equalTo(billDetailView.mas_top).offset(billDetailViewVerticalSplitOneCenterY);
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewVerticalSplitTwo
{
    billDetailViewVerticalSplitTwo = UIImageView.new;
    [billDetailViewVerticalSplitTwo setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderVerticalSplit"]]];
    [superview addSubview:billDetailViewVerticalSplitTwo];
    
    [billDetailViewVerticalSplitTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitTwoHeight]);
        make.width.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitTwoWidth]);
        make.centerY.equalTo(billDetailView.mas_top).offset(billDetailViewVerticalSplitTwoCenterY);
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewHorizontalSplit
{
    billDetailViewHorizontalSplit = UIImageView.new;
    [billDetailViewHorizontalSplit setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderHorizontalSplit"]]];
    [superview addSubview:billDetailViewHorizontalSplit];
    
    [billDetailViewHorizontalSplit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithInt:billDetailViewHorizontalSplitHeight]);
        make.center.equalTo(billDetailView);
    }];
}

- (void)layoutBillAmountLabel
{
    billAmountLabel = UILabel.new;
    [layout setLabel:billAmountLabel withText:@"BILL AMOUNT" fontSize:15 textColor:[UIColor lightGrayColor] isBold:YES];
    [billAmountLabel sizeToFit];
    [superview addSubview:billAmountLabel];
    
    [billAmountLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - billAmountLabel.bounds.size.width / 2);
        make.centerY.equalTo(billDetailViewVerticalSplitOne.mas_top);
    }];
}

- (void)layoutTipsLabel
{
    tipsLabel = UILabel.new;
    [layout setLabel:tipsLabel withText:@"TIPS" fontSize:15 textColor:[UIColor lightGrayColor] isBold:YES];
    [tipsLabel sizeToFit];
    [superview addSubview:tipsLabel];
    
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - tipsLabel.bounds.size.width / 2);
        make.centerY.equalTo(billDetailViewVerticalSplitTwo.mas_top);
    }];
}

- (void)layoutPartySizeLabel
{
    partySizeLabel = UILabel.new;
    [layout setLabel:partySizeLabel withText:@"PARTY SIZE" fontSize:15 textColor:[UIColor lightGrayColor] isBold:YES];
    [partySizeLabel sizeToFit];
    [superview addSubview:partySizeLabel];
    
    [partySizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + partySizeLabel.bounds.size.width / 2);
        make.centerY.equalTo(billDetailViewVerticalSplitOne.mas_top);
    }];
}

- (void)layoutTotalLabel
{
    totalLabel = UILabel.new;
    [layout setLabel:totalLabel withText:@"TOTAL" fontSize:15 textColor:[UIColor lightGrayColor] isBold:YES];
    [totalLabel sizeToFit];
    [superview addSubview:totalLabel];
    
    [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + totalLabel.bounds.size.width / 2);
        make.centerY.equalTo(billDetailViewVerticalSplitTwo.mas_top);
    }];
}

- (void)layoutBillAmountValueLabel
{
    billAmountValueLabel = UILabel.new;
    [layout setLabel:billAmountValueLabel withText:@"123" fontSize:17 textColor:[UIColor blackColor] isBold:NO];
    [billAmountValueLabel sizeToFit];
    [superview addSubview:billAmountValueLabel];
    
    [billAmountValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - billAmountValueLabel.bounds.size.width / 2);
        make.top.equalTo(billAmountLabel.mas_bottom).offset(billAmountValueLabelMarginTop);
    }];
}

- (void)layoutPartySizeValueLabel
{
    partySizeValueLabel = UILabel.new;
    [layout setLabel:partySizeValueLabel withText:@"123" fontSize:17 textColor:[UIColor blackColor] isBold:NO];
    [partySizeValueLabel sizeToFit];
    [superview addSubview:partySizeValueLabel];
    
    [partySizeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + partySizeValueLabel.bounds.size.width / 2);
        make.top.equalTo(partySizeLabel.mas_bottom).offset(partySizeValueLabelMarginTop);
    }];
}

- (void)layoutTipsValueLabel
{
    tipsValueLabel = UILabel.new;
    [layout setLabel:tipsValueLabel withText:@"123" fontSize:17 textColor:[UIColor blackColor] isBold:NO];
    [tipsValueLabel sizeToFit];
    [superview addSubview:tipsValueLabel];
    
    [tipsValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - tipsValueLabel.bounds.size.width / 2);
        make.top.equalTo(tipsLabel.mas_bottom).offset(tipsValueLabelMarginTop);
    }];
}

- (void)layoutTotalValueLabel
{
    totalValueLabel = UILabel.new;
    [layout setLabel:totalValueLabel withText:@"123" fontSize:17 textColor:[UIColor blackColor] isBold:NO];
    [totalValueLabel sizeToFit];
    [superview addSubview:totalValueLabel];
    
    [totalValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + totalValueLabel.bounds.size.width / 2);
        make.top.equalTo(totalLabel.mas_bottom).offset(totalValueLabelMarginTop);
    }];
}

- (void)layoutPaymentForEachView
{
    paymentForEachView = UIView.new;
    [paymentForEachView setBackgroundColor:[UIColor colorWithRed:45/255.0 green:177/255.0 blue:137/255.0 alpha:1]];
    [superview addSubview:paymentForEachView];
    
    [paymentForEachView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithInt:paymentForEachViewHeight]);
        make.top.equalTo(totalValueLabel.mas_bottom).offset(paymentForEachViewMarginTop);
    }];
}

- (void)layoutPaymentForEachLabel
{
    paymentForEachLabel = UILabel.new;
    [layout setLabel:paymentForEachLabel withText:@"123.97" fontSize:40 textColor:[UIColor whiteColor] isBold:YES];
    [paymentForEachLabel sizeToFit];
    [superview addSubview:paymentForEachLabel];
    
    [paymentForEachLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(paymentForEachView);
    }];
}

- (void)layoutEachLabel
{
    eachLabel = UILabel.new;
    [layout setLabel:eachLabel withText:@"EACH" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [eachLabel sizeToFit];
    [superview addSubview:eachLabel];
    
    [eachLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(paymentForEachLabel.mas_top);
        make.centerX.equalTo(paymentForEachLabel.mas_right).offset(eachLabelMarginLeft);
    }];
}

- (void)layoutRoundButton
{
    roundButton = UIButton.new;
    [roundButton setBackgroundColor:[UIColor colorWithRed:106/255.0 green:147/255.0 blue:186/255.0 alpha:1]];
    [roundButton setTitle:[NSString stringWithFormat:@"%c\n%c\n%c\n%c\n%c", 'R', 'O', 'U', 'N', 'D'] forState:UIControlStateNormal];
    [layout setLabel:roundButton.titleLabel withText:@"R\nO\nU\nN\nD\n" fontSize:11 textColor:[UIColor whiteColor] isBold:YES];
    
    roundButton.titleLabel.numberOfLines = 0;
    CGSize labelSize = [roundButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:roundButton.titleLabel.font}];
    roundButton.titleLabel.frame = CGRectMake(
                             roundButton.titleLabel.frame.origin.x, roundButton.titleLabel.frame.origin.y,
                             roundButton.titleLabel.frame.size.width, labelSize.height);
    
    [roundButton sizeToFit];
    [superview addSubview:roundButton];
    
    [roundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithInt:roundButtonWidth]);
        make.height.equalTo([NSNumber numberWithInt:roundButtonHeight]);
        make.top.equalTo(totalValueLabel.mas_bottom).offset(roundButtonMarginTOp);
        make.right.equalTo(paymentForEachView.mas_right);
    }];
}

- (void)layoutTipsTableView
{
    tipsTableView = [[TipsTableView alloc] initWithBillAmount:_billAmount];
    [superview addSubview:tipsTableView];
    
    [tipsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithDouble:tipsTableViewHeightRatio * DEVICE_HEIGHT]);
        make.top.equalTo(paymentForEachView.mas_bottom).offset(tipsTableViewMarginTop);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - For debugging only
- (void)colorLabels
{
    [billAmountLabel setBackgroundColor:[UIColor redColor]];
    [partySizeLabel setBackgroundColor:[UIColor redColor]];
    [billDetailViewHorizontalSplit setBackgroundColor:[UIColor redColor]];
    
    [billDetailView setBackgroundColor:[UIColor blueColor]];
}

@end
