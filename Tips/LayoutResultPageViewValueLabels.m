//
//  LayoutResultPageViewValueLabels.m
//  Tips
//
//  Created by Nate on 2/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "LayoutResultPageViewValueLabels.h"

@implementation LayoutResultPageViewValueLabels

+ (LayoutResultPageViewValueLabels *)sharedInstance
{
    static LayoutResultPageViewValueLabels *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LayoutResultPageViewValueLabels alloc]init];
    });
    return sharedInstance;
}

- (void)setupBillAmountValueLabel: (UILabel *)billAmountValueLabel
                         partySizeValueLabel: (UILabel *)partySizeValueLabel
                              tipsValueLabel: (UILabel *)tipsValueLabel
                             totalValueLabel: (UILabel *)totalValueLabel
                          eachPaysValueLabel: (UILabel *)paymentForEachValueLabel
{
    _billAmountValueLabel = billAmountValueLabel;
    _partySizeValueLabel = partySizeValueLabel;
    _tipsValueLabel = tipsValueLabel;
    _totalValueLabel = totalValueLabel;
    _paymentForEachValueLabel = paymentForEachValueLabel;
}

- (void)updateValueLabelsWithBillAmount: (float)billAmount
                              partySize: (int)partySize
                         tipsPercentage: (float)tipsPercentage
                                  total: (float)total
                               eachPays: (float)eachPays
{
    [self layoutBillAmountValueLabel:[NSString stringWithFormat:@"%.02f", billAmount]];
    
    [self layoutPartySizeValueLabel:[NSString stringWithFormat:@"%d", partySize]];
    
    [self layoutTipsValueLabel:[NSString stringWithFormat:@"%.02f", billAmount * tipsPercentage]];
    
    [self layoutTotalValueLabel:[NSString stringWithFormat:@"%.02f", total]];
    
    [self layoutPaymentForEachLabel:[NSString stringWithFormat:@"%.02f", eachPays]];
}

- (void)layoutBillAmountValueLabel: (NSString *)billAmountValue
{
    _billAmountValueLabel = UILabel.new;
    [Layout setLabel:_billAmountValueLabel withText:billAmountValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_billAmountValueLabel sizeToFit];
    [_superview addSubview:_billAmountValueLabel];
    
    [_billAmountValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _billAmountValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(billAmountValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPartySizeValueLabel: (NSString *)partySizeValue
{
    _partySizeValueLabel = UILabel.new;
    [Layout setLabel:_partySizeValueLabel withText:partySizeValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_partySizeValueLabel sizeToFit];
    [_superview addSubview:_partySizeValueLabel];
    
    [_partySizeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + _partySizeValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(partySizeValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTipsValueLabel: (NSString *)tipsValue
{
    _tipsValueLabel = UILabel.new;
    [Layout setLabel:_tipsValueLabel withText:tipsValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_tipsValueLabel sizeToFit];
    [_superview addSubview:_tipsValueLabel];
    
    [_tipsValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _tipsValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(tipsValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTotalValueLabel: (NSString *)totalValue
{
    _totalValueLabel = UILabel.new;
    [Layout setLabel:_totalValueLabel withText:totalValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_totalValueLabel sizeToFit];
    [_superview addSubview:_totalValueLabel];
    
    [_totalValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_billDetailView.mas_centerX).offset(DEVICE_WIDTH / 4);
        make.top.equalTo(_billDetailView.mas_top).offset(totalValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPaymentForEachLabel: (NSString *)paymentForEach
{
    _paymentForEachValueLabel = UILabel.new;
    [Layout setLabel:_paymentForEachValueLabel withText:paymentForEach fontSize:40 textColor:[UIColor whiteColor] isBold:YES];
    [_paymentForEachValueLabel sizeToFit];
    [_superview addSubview:_paymentForEachValueLabel];
    
    [_paymentForEachValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_paymentForEachView.mas_centerY);
        make.left.equalTo(_paymentForEachView.mas_left).offset(paymentForEachLabelMarginLeftRatio * DEVICE_WIDTH);
    }];
}

@end
