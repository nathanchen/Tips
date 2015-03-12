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
    UIView *navigationView;
    UIButton *navigationBackButton;
    
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
    
    UIView *tableHeaderView;
    
    int resultsArrayPlaceholderIndex;
}

@end

@implementation ResultPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    superview = self.view;
    [superview setBackgroundColor:LIGHT_BLUEISH_COLOR];
    
    _layoutResultPageViewValueLabels = [LayoutResultPageViewValueLabels sharedInstance];
    _layoutResultPageViewValueLabels.superview = superview;
    
    resultsArrayPlaceholderIndex = -1;
//    _billAmount = 12;
//    _partySize = 1;
    
    [self layoutNavigationView];
    [self layoutBillDetailView];
    [self layoutBillDetailViewVerticalSplitOne];
    [self layoutBillDetailViewVerticalSplitTwo];
    [self layoutBillDetailViewHorizontalSplit];
    
    _layoutResultPageViewValueLabels.billDetailView = billDetailView;
    
    [self layoutTipsTableView];
    [self layoutTableHeaderView];
    tipsTableView.delegate = self;
    tipsTableView.backgroundColor = DARK_BLUEISH_COLOR;

    
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

- (void)viewDidAppear:(BOOL)animated
{
    [self updateTipsTableViewAndScrollToRoll:11];
}

- (void)updateValueLabelsOverrideExisting: (BOOL)overrideExisting
{
    float tipsPercentage = tipsTableView.tipsPercentage;
    float total = _billAmount * (1 + tipsPercentage);
    float eachPays = total / _partySize;
    
    [self updateValueLabelsWithTipsPercentage:tipsPercentage total:total eachPays:eachPays OverrideExistingMansoryConstraints:overrideExisting];
}

- (void)updateValueLabelsWithTipsPercentage: (float)tipsPercentage
                                      total: (float)total
                                   eachPays:(float)eachPays
                           OverrideExistingMansoryConstraints:(BOOL)overrideExisting
{
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

- (void)updateTipsTableViewAndScrollToRoll: (int)rowNum
{
    [tipsTableView reloadData];
    
//    [tipsTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rowNum inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    [tipsTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:rowNum inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)layoutNavigationView
{
    navigationView = UIView.new;
    [navigationView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [superview addSubview:navigationView];
    
    [navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@DEVICE_WIDTH);
        make.height.equalTo([NSNumber numberWithInt:navigationBarHeight]);
        make.top.equalTo([NSNumber numberWithInt:0]);
    }];
    
    navigationBackButton = UIButton.new;
    [navigationBackButton setTitle:@"❮ Back" forState:UIControlStateNormal];
    [navigationBackButton setTitleColor:DARK_BLUEISH_COLOR forState:UIControlStateNormal];
    [navigationBackButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchDown];
    [Layout setLabel:navigationBackButton.titleLabel withText:@"❮ Back" fontSize:17 textColor:[UIColor blueColor] isBold:YES];
    [navigationView addSubview:navigationBackButton];
    
    [navigationBackButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithInt:navigationBackButtonWidth]);
        make.top.equalTo(navigationView.mas_top).offset(navigationBackButtonMarginTop);
    }];
}

- (void)backButtonPressed
{
    QueryPageViewController *queryPageVC = [[QueryPageViewController alloc] init];
    [self presentViewController:queryPageVC animated:YES completion:nil];
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
    [paymentForEachView setBackgroundColor:BLUEISH_COLOR];
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
    
    [roundButton addTarget:self action:@selector(roundButtonClicked) forControlEvents:UIControlEventTouchDown];
    
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

- (void)roundButtonClicked
{
    if (resultsArrayPlaceholderIndex != -1)
    {
        [tipsTableView.results removeObjectAtIndex:resultsArrayPlaceholderIndex];
        resultsArrayPlaceholderIndex = -1;
    }
    
    float tipsPercentage = tipsTableView.tipsPercentage;
    float total = _billAmount * (1 + tipsPercentage);
    float eachPays = total / _partySize;
    
    int roundedUpEachPays = (int)lroundf(eachPays);
    total = (float)_partySize * roundedUpEachPays;
    tipsPercentage = (total - _billAmount) / _billAmount;
    
    Result *result = [[Result alloc] initResultWithMoney:_billAmount percentage:tipsPercentage];
    
    // ceil(tipsPercentage * 100) - 1 may exceed 40 and leaves INDEX40 as blank, which cause array boundary problem
    int tempIndex = (ceil(tipsPercentage * 100) - 1 > 39 ? 40 : ceil(tipsPercentage * 100) - 1);
    
    if (((int)[tipsTableView.results indexOfObject:result]) < 0)
    {
        resultsArrayPlaceholderIndex = tempIndex;
        [tipsTableView.results insertObject:result atIndex:resultsArrayPlaceholderIndex];
    }
    
    [self updateValueLabelsWithTipsPercentage:tipsPercentage total:total eachPays:roundedUpEachPays OverrideExistingMansoryConstraints:NO];
    
    [self updateTipsTableViewAndScrollToRoll:tempIndex];
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
    [tableHeaderView setBackgroundColor:DARK_BLUEISH_COLOR];
    
    float labelHeight = tipsTableViewCellHeaderHeightRatio * DEVICE_HEIGHT / 2;
    UILabel *tipsPercentage = [Layout setUpLabelWithFrame:CGRectMake(tipsTableViewCell1OriginX * DEVICE_WIDTH, labelHeight / 2, tipsTableViewCell1Width * DEVICE_WIDTH, labelHeight) text:@"Rate" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    UILabel *tipsAmount = [Layout setUpLabelWithFrame:CGRectMake(tipsTableViewCell2OriginX * DEVICE_WIDTH, labelHeight / 2, tipsTableViewCell2Width * DEVICE_WIDTH, labelHeight) text:@"Tips" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    UILabel *totalAmount = [Layout setUpLabelWithFrame:CGRectMake(tipsTableViewCell3OriginX * DEVICE_WIDTH, labelHeight / 2, tipsTableViewCell3Width * DEVICE_WIDTH, labelHeight) text:@"Total" textColor:[UIColor whiteColor] textFont:15 textAlignment:NSTextAlignmentCenter isBold:YES];
    
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
    return DEVICE_HEIGHT * tipsTableViewCellHeightRatio;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tipsTableView.tipsPercentage = ((Result *)tipsTableView.results[indexPath.row]).percentage;
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
