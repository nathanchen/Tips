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
}

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    superview = self.view;
    
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:235 green:235 blue:235 alpha:1]];
    [_billDetailViewHorizontalSplit setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderHorizontalSplit"]]];
    [_billDetailViewVerticalSplitOne setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderVerticalSplit"]]];
    [_billDetailViewVerticalSplitTwo setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"resultPageHeaderVerticalSplit"]]];
    
    [self layoutSuperView];
    [self layoutBillDetailView];
    [self layoutBillDetailViewVerticalSplitOne];
    [self layoutBillDetailViewVerticalSplitTwo];
    [self layoutBillDetailViewHorizontalSplit];
    
    [self layoutBillAmountLabel];
    [self layoutTipsLabel];
    [self layoutPartySizeLabel];
    [self layoutTotalLabel];
    
    [self colorLabels];
}

- (void)layoutSuperView
{
    [superview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo(@DEVICE_HEIGHT);
    }];
}

- (void)layoutBillDetailView
{
    [_billDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview).offset(65);
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo(@148);
    }];
}

- (void)layoutBillDetailViewVerticalSplitOne
{
    [_billDetailViewVerticalSplitOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@10);
        make.top.equalTo(_billDetailView.mas_top).offset(8);
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewVerticalSplitTwo
{
    [_billDetailViewVerticalSplitTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@10);
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewHorizontalSplit
{
    [_billDetailViewHorizontalSplit sizeToFit];
    float margin_left = (DEVICE_WIDTH - _billDetailViewHorizontalSplit.bounds.size.width) / 2 > 0 ? (DEVICE_WIDTH - _billDetailViewHorizontalSplit.bounds.size.width) / 2 : 0;
    [_billDetailViewHorizontalSplit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo(@4);
        make.left.equalTo(_billAmountLabel.mas_left).offset(margin_left);
    }];
}

- (void)layoutBillAmountLabel
{
    [_billAmountLabel sizeToFit];
    [_billAmountLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _billAmountLabel.bounds.size.width / 2);
    }];
}

- (void)layoutTipsLabel
{
    [_tipsLabel sizeToFit];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _tipsLabel.bounds.size.width / 2);
    }];
}

- (void)layoutPartySizeLabel
{
    [_partySizeLabel sizeToFit];
    [_partySizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailViewVerticalSplitOne.mas_left).offset(10);
    }];
}

- (void)layoutTotalLabel
{
    [_totalLabel sizeToFit];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 - _totalLabel.bounds.size.width / 2);
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
    [_billAmountLabel setBackgroundColor:[UIColor redColor]];
    [_partySizeLabel setBackgroundColor:[UIColor redColor]];
    [_billDetailViewHorizontalSplit setBackgroundColor:[UIColor redColor]];
    
    [_billDetailView setBackgroundColor:[UIColor blueColor]];
}

@end
