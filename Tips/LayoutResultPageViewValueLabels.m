//
//  LayoutResultPageViewValueLabels.m
//  Tips
//
//  Created by Nate on 2/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "LayoutResultPageViewValueLabels.h"

@implementation LayoutResultPageViewValueLabels

+ (LayoutResultPageViewValueLabels *)sharedInstanceWithBillAmountValueLabel: (UILabel *)billAmountValueLabel
                                                        partySizeValueLabel: (UILabel *)partySizeValueLabel
                                                             tipsValueLabel: (UILabel *)tipsValueLabel
                                                            totalValueLabel: (UILabel *)totalValueLabel
                                                         eachPaysValueLabel: (UILabel *)paymentForEachValueLabel
{
    static LayoutResultPageViewValueLabels *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LayoutResultPageViewValueLabels alloc] initWithBillAmountValueLabel:billAmountValueLabel partySizeValueLabel:partySizeValueLabel tipsValueLabel:tipsValueLabel totalValueLabel:totalValueLabel eachPaysValueLabel:paymentForEachValueLabel];
    });
    return sharedInstance;
}

- (instancetype)initWithBillAmountValueLabel: (UILabel *)billAmountValueLabel
                         partySizeValueLabel: (UILabel *)partySizeValueLabel
                              tipsValueLabel: (UILabel *)tipsValueLabel
                             totalValueLabel: (UILabel *)totalValueLabel
                          eachPaysValueLabel: (UILabel *)paymentForEachValueLabel
{
    self = [super init];
    
    if (self)
    {
        _billAmountValueLabel = billAmountValueLabel;
        _partySizeValueLabel = partySizeValueLabel;
        _tipsValueLabel = tipsValueLabel;
        _totalValueLabel = totalValueLabel;
        _paymentForEachValueLabel = paymentForEachValueLabel;
    }
    return self;
}

- (void)updateValueLabelsWithBillAmount: (float)billAmount
                              partySize: (int)partySize
                         tipsPercentage: (float)tipsPercentage
                                  total: (float)total
                               eachPays: (float)eachPays
{
    [self layoutBillAmountValueLabel:_billAmountValueLabel withValue:[NSString stringWithFormat:@"%.02f", billAmount]];
    
    [self layoutPartySizeValueLabel:_partySizeValueLabel withValue:[NSString stringWithFormat:@"%d", partySize]];
    
    [self layoutTipsValueLabel:_tipsValueLabel withValue:[NSString stringWithFormat:@"%.02f", billAmount * tipsPercentage]];
    
    [self layoutTotalValueLabel:_totalValueLabel withValue:[NSString stringWithFormat:@"%.02f", total]];
    
    [self layoutPaymentForEachLabel:_paymentForEachValueLabel withValue:[NSString stringWithFormat:@"%.02f", eachPays]];
}

- (void)layoutBillAmountValueLabel: (UILabel *)billAmountValueLabel
                         withValue: (NSString *)billAmountValue
{
    billAmountValueLabel = UILabel.new;
    [Layout setLabel:billAmountValueLabel withText:billAmountValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [billAmountValueLabel sizeToFit];
    [_superview addSubview:billAmountValueLabel];
    
    [billAmountValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - billAmountValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(billAmountValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPartySizeValueLabel: (UILabel *)partySizeValueLabel
                        withValue: (NSString *)partySizeValue
{
    partySizeValueLabel = UILabel.new;
    [Layout setLabel:partySizeValueLabel withText:partySizeValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [partySizeValueLabel sizeToFit];
    [_superview addSubview:partySizeValueLabel];
    
    [partySizeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + partySizeValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(partySizeValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTipsValueLabel: (UILabel *)tipsValueLabel
                            withValue: (NSString *)tipsValue
{
    tipsValueLabel = UILabel.new;
    [Layout setLabel:tipsValueLabel withText:tipsValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [tipsValueLabel sizeToFit];
    [_superview addSubview:tipsValueLabel];
    
    [tipsValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - tipsValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(tipsValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTotalValueLabel: (UILabel *)totalValueLabel
                             withValue: (NSString *)totalValue
{
    totalValueLabel = UILabel.new;
    [Layout setLabel:totalValueLabel withText:totalValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [totalValueLabel sizeToFit];
    [_superview addSubview:totalValueLabel];
    
    [totalValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_billDetailView.mas_centerX).offset(DEVICE_WIDTH / 4);
        make.top.equalTo(_billDetailView.mas_top).offset(totalValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPaymentForEachLabel: (UILabel *)paymentForEachValueLabel
                        withValue: (NSString *)paymentForEach
{
    paymentForEachValueLabel = UILabel.new;
    [Layout setLabel:paymentForEachValueLabel withText:paymentForEach fontSize:40 textColor:[UIColor whiteColor] isBold:YES];
    [paymentForEachValueLabel sizeToFit];
    [_superview addSubview:paymentForEachValueLabel];
    
    [paymentForEachValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_paymentForEachView.mas_centerY);
        make.left.equalTo(_paymentForEachView.mas_left).offset(paymentForEachLabelMarginLeftRatio * DEVICE_WIDTH);
    }];
}

@end
