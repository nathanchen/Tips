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
    UIView *billDetailViewVerticalSplitOne;
    UIView *billDetailViewVerticalSplitTwo;
    UIView *billDetailViewHorizontalSplit;
    UILabel *billAmountLabel;
    UILabel *partySizeLabel;
    UILabel *tipsLabel;
    UILabel *totalLabel;
    
    UILabel *billAmountValueLabel;
    UILabel *partySizeValueLabel;
    UILabel *tipsValueLabel;
    UILabel *totalValueLabel;
    
    UIView *paymentForEachView;
    UILabel *paymentForEachValueLabel;
    UILabel *eachLabel;
    UIButton *roundButton;
    
    TipsTableView *tipsTableView;
    NSMutableArray *results;
    
    UIView *tableHeaderView;
}

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    superview = self.view;
    [superview setBackgroundColor:[UIColor colorWithRed:118/255.0 green:190/255.0 blue:242/255.0 alpha:1]];
    
    _layoutResultPageViewValueLabels = [LayoutResultPageViewValueLabels sharedInstance];
    _layoutResultPageViewValueLabels.superview = superview;
    
    results = [[NSMutableArray alloc] init];
    _billAmount = 190;
    _partySize = 2;
    
    [self layoutBillDetailView];
    [self layoutBillDetailViewVerticalSplitOne];
    [self layoutBillDetailViewVerticalSplitTwo];
    [self layoutBillDetailViewHorizontalSplit];
    
    _layoutResultPageViewValueLabels.billDetailView = billDetailView;
    
    [self layoutTipsTableView];
    [self updateTipsTableView];
    [self layoutTableHeaderView];
    
    tipsTableView.delegate = self;
    
    [self layoutBillAmountLabel];
    [self layoutTipsLabel];
    [self layoutPartySizeLabel];
    [self layoutTotalLabel];
    [self layoutPaymentForEachView];
    
    _layoutResultPageViewValueLabels.paymentForEachView = paymentForEachView;
    
    [self layoutRoundButton];
    
    [self updateValueLabelsOverrideExisting:YES];
    [self layoutEachLabel];

//    [self colorLabels];
}

- (void)updateValueLabelsOverrideExisting: (BOOL)overrideExisting
{
    float tipsPercentage = tipsTableView.tipsPercentage;
    float total = _billAmount * (1 + tipsPercentage);
    float eachPays = total / _partySize;
    
    [_layoutResultPageViewValueLabels layoutBillAmountValueLabel:[NSString stringWithFormat:@"%.02f", _billAmount]
        overrideExisting:overrideExisting];
    [_layoutResultPageViewValueLabels layoutPartySizeValueLabel:[NSString stringWithFormat:@"%d", _partySize]
                                               overrideExisting:overrideExisting];
    [_layoutResultPageViewValueLabels layoutTipsValueLabel:[NSString stringWithFormat:@"%.02f", _billAmount * tipsPercentage]
                                          overrideExisting:overrideExisting];
    [_layoutResultPageViewValueLabels layoutTotalValueLabel:[NSString stringWithFormat:@"%.02f", total]
                                           overrideExisting:overrideExisting];
    [_layoutResultPageViewValueLabels layoutPaymentForEachLabel:[NSString stringWithFormat:@"%.02f", eachPays]
                                               overrideExisting:overrideExisting];
    
    billAmountValueLabel = _layoutResultPageViewValueLabels.billAmountValueLabel;
    partySizeValueLabel = _layoutResultPageViewValueLabels.partySizeValueLabel;
    tipsValueLabel = _layoutResultPageViewValueLabels.tipsValueLabel;
    totalValueLabel = _layoutResultPageViewValueLabels.totalValueLabel;
    paymentForEachValueLabel = _layoutResultPageViewValueLabels.paymentForEachValueLabel;
}

- (void)updateTipsTableView
{
    [tipsTableView reloadData];
    [tipsTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
}

- (void)layoutBillDetailView
{
    billDetailView = UIView.new;
    [superview addSubview:billDetailView];
    
    [billDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithFloat:(billDetailViewHeightRatio * DEVICE_HEIGHT)]);
        make.top.equalTo([NSNumber numberWithInt:billDetailViewMarginTop]);
    }];
}

- (void)layoutBillDetailViewVerticalSplitOne
{
    billDetailViewVerticalSplitOne = UIView.new;
    [billDetailViewVerticalSplitOne setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [superview addSubview:billDetailViewVerticalSplitOne];
    
    [billDetailViewVerticalSplitOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([NSNumber numberWithFloat:(billDetailViewVerticalSplitOneHeightRatio * DEVICE_HEIGHT)]);
        make.width.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitOneWidth]);
        make.centerY.equalTo(billDetailView.mas_top).offset(billDetailViewVerticalSplitOneCenterYRatio * DEVICE_HEIGHT);
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewVerticalSplitTwo
{
    billDetailViewVerticalSplitTwo = UIView.new;
    [billDetailViewVerticalSplitTwo setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [superview addSubview:billDetailViewVerticalSplitTwo];
    
    [billDetailViewVerticalSplitTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([NSNumber numberWithFloat:(billDetailViewVerticalSplitTwoHeightRatio * DEVICE_HEIGHT)]);
        make.width.equalTo([NSNumber numberWithInt:billDetailViewVerticalSplitTwoWidth]);
        make.centerY.equalTo(billDetailView.mas_top).offset(billDetailViewVerticalSplitTwoCenterYRatio * DEVICE_HEIGHT);
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 2);
    }];
}

- (void)layoutBillDetailViewHorizontalSplit
{
    billDetailViewHorizontalSplit = UIView.new;
    [billDetailViewHorizontalSplit setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
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
    [Layout setLabel:billAmountLabel withText:@"BILL AMOUNT" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [billAmountLabel sizeToFit];
    [superview addSubview:billAmountLabel];
    
    [billAmountLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - billAmountLabel.bounds.size.width / 2);
        make.top.equalTo(billDetailView.mas_top).offset(billAmountLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTipsLabel
{
    tipsLabel = UILabel.new;
    [Layout setLabel:tipsLabel withText:@"TIPS" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [tipsLabel sizeToFit];
    [superview addSubview:tipsLabel];
    
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - tipsLabel.bounds.size.width / 2);
        make.top.equalTo(billDetailView.mas_top).offset(tipsLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPartySizeLabel
{
    partySizeLabel = UILabel.new;
    [Layout setLabel:partySizeLabel withText:@"PARTY SIZE" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [partySizeLabel sizeToFit];
    [superview addSubview:partySizeLabel];
    
    [partySizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + partySizeLabel.bounds.size.width / 2);
        make.top.equalTo(billDetailView.mas_top).offset(partySizeLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTotalLabel
{
    totalLabel = UILabel.new;
    [Layout setLabel:totalLabel withText:@"TOTAL" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [totalLabel sizeToFit];
    [superview addSubview:totalLabel];
    
    [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(billDetailView.mas_centerX).offset(DEVICE_WIDTH / 4);
        make.top.equalTo(billDetailView.mas_top).offset(tipsLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPaymentForEachView
{
    paymentForEachView = UIView.new;
    [paymentForEachView setBackgroundColor:[UIColor colorWithRed:66/255.0 green:106/255.0 blue:181/255.0 alpha:1]];
    [superview addSubview:paymentForEachView];
    
    [paymentForEachView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithFloat:(paymentForEachViewHeightRatio * DEVICE_HEIGHT)]);
        make.top.equalTo(billDetailView.mas_top).offset(paymentForEachViewMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutEachLabel
{
    eachLabel = UILabel.new;
    [Layout setLabel:eachLabel withText:@"EACH" fontSize:13 textColor:[UIColor whiteColor] isBold:YES];
    [eachLabel sizeToFit];
    [superview addSubview:eachLabel];
    
    [eachLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(paymentForEachValueLabel.mas_top);
        make.centerX.equalTo(paymentForEachValueLabel.mas_right).offset(eachLabelMarginLeft);
    }];
}

- (void)layoutRoundButton
{
    roundButton = UIButton.new;
    [roundButton setTitle:[NSString stringWithFormat:@"%c\n%c\n%c\n%c\n%c", 'R', 'O', 'U', 'N', 'D'] forState:UIControlStateNormal];
    [Layout setLabel:roundButton.titleLabel withText:@"R\nO\nU\nN\nD\n" fontSize:11 textColor:[UIColor whiteColor] isBold:YES];
    
    roundButton.titleLabel.numberOfLines = 0;
    CGSize labelSize = [roundButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:roundButton.titleLabel.font}];
    roundButton.titleLabel.frame = CGRectMake(
                             roundButton.titleLabel.frame.origin.x, roundButton.titleLabel.frame.origin.y,
                             roundButton.titleLabel.frame.size.width, labelSize.height);
    
    [roundButton sizeToFit];
    [superview addSubview:roundButton];
    
    [roundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:(roundButtonWidthRatio * DEVICE_WIDTH)]);
        make.height.equalTo([NSNumber numberWithFloat:(paymentForEachViewHeightRatio * DEVICE_HEIGHT)]);
        make.top.equalTo(billDetailView.mas_top).offset(roundButtonMarginTopRatio * DEVICE_HEIGHT);
        make.right.equalTo(paymentForEachView.mas_right);
    }];
}

- (void)layoutTipsTableView
{
    tipsTableView = [[TipsTableView alloc] initWithBillAmount:_billAmount];
    [superview addSubview:tipsTableView];
    
    [tipsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithFloat:tipsTableViewHeightRatio * DEVICE_HEIGHT]);
        make.top.equalTo(billDetailView.mas_top).offset(tipsTableViewMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTableHeaderView
{
    tableHeaderView = UIView.new;
    [tableHeaderView setBackgroundColor:[UIColor colorWithRed:51/255.0 green:73/255.0 blue:95/255.0 alpha:1]];
    
    float labelHeight = tipsTableViewCellHeaderHeightRatio * DEVICE_HEIGHT / 2;
    UILabel *tipsPercentage = [Layout setUpLabelWithFrame:CGRectMake(30, labelHeight / 2, 50, labelHeight) text:@"Rate" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    UILabel *tipsAmount = [Layout setUpLabelWithFrame:CGRectMake(120, labelHeight / 2, 100, labelHeight) text:@"Tips" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    UILabel *totalAmount = [Layout setUpLabelWithFrame:CGRectMake(260, labelHeight / 2, 100, labelHeight) text:@"Total" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    
    [tableHeaderView addSubview:tipsPercentage];
    [tableHeaderView addSubview:tipsAmount];
    [tableHeaderView addSubview:totalAmount];
    
    [superview addSubview:tableHeaderView];
    
    [tableHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithFloat:tipsTableViewCellHeaderHeightRatio * DEVICE_HEIGHT]);
        make.top.equalTo(tipsTableView.mas_top).offset(-tipsTableViewCellHeaderHeightRatio * DEVICE_HEIGHT);
    }];
}

#pragma mark - table view delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tipsTableViewHeightRatio * DEVICE_HEIGHT * tipsTableViewCellHeightRatio;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tipsTableView.tipsPercentage = (float)(indexPath.row + 1) / 100;
    [self updateValueLabelsOverrideExisting:NO];
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
    [billAmountValueLabel setBackgroundColor:[UIColor greenColor]];
    
//    [totalLabel setBackgroundColor:[UIColor redColor]];
//    [totalValueLabel setBackgroundColor:[UIColor redColor]];
//    [billDetailViewHorizontalSplit setBackgroundColor:[UIColor redColor]];
    
    [billDetailView setBackgroundColor:[UIColor blueColor]];
}

@end
