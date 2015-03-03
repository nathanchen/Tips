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

- (void)layoutBillAmountValueLabel: (NSString *)billAmountValue
                  overrideExisting: (BOOL)overrideExisting
{
    if (overrideExisting)
    {
        _billAmountValueLabel = UILabel.new;
    }
    
    [Layout setLabel:_billAmountValueLabel withText:billAmountValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_billAmountValueLabel sizeToFit];
    
    if (overrideExisting)
    {
        [_superview addSubview:_billAmountValueLabel];
    }
    
    [_billAmountValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _billAmountValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(billAmountValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPartySizeValueLabel: (NSString *)partySizeValue
                 overrideExisting: (BOOL)overrideExisting
{
    if (overrideExisting)
    {
        _partySizeValueLabel = UILabel.new;
    }
    
    [Layout setLabel:_partySizeValueLabel withText:partySizeValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_partySizeValueLabel sizeToFit];
    
    if (overrideExisting)
    {
        [_superview addSubview:_partySizeValueLabel];
    }
    
    [_partySizeValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_billDetailView.mas_right).offset(-DEVICE_WIDTH / 4 + _partySizeValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(partySizeValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTipsValueLabel: (NSString *)tipsValue
            overrideExisting: (BOOL)overrideExisting
{
    if (overrideExisting)
    {
        _tipsValueLabel = UILabel.new;
    }
    
    [Layout setLabel:_tipsValueLabel withText:tipsValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_tipsValueLabel sizeToFit];
    
    if (overrideExisting)
    {
        [_superview addSubview:_tipsValueLabel];
    }
    
    [_tipsValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_billDetailView.mas_left).offset(DEVICE_WIDTH / 4 - _tipsValueLabel.bounds.size.width / 2);
        make.top.equalTo(_billDetailView.mas_top).offset(tipsValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutTotalValueLabel: (NSString *)totalValue
             overrideExisting: (BOOL)overrideExisting
{
    if (overrideExisting)
    {
        _totalValueLabel = UILabel.new;
    }
    
    [Layout setLabel:_totalValueLabel withText:totalValue fontSize:25 textColor:[UIColor whiteColor] isBold:NO];
    [_totalValueLabel sizeToFit];
    
    if (overrideExisting)
    {
        [_superview addSubview:_totalValueLabel];
    }
    
    [_totalValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_billDetailView.mas_centerX).offset(DEVICE_WIDTH / 4);
        make.top.equalTo(_billDetailView.mas_top).offset(totalValueLabelMarginTopRatio * DEVICE_HEIGHT);
    }];
}

- (void)layoutPaymentForEachLabel: (NSString *)paymentForEach
                 overrideExisting: (BOOL)overrideExisting
{
    if (overrideExisting)
    {
        _paymentForEachValueLabel = UILabel.new;
    }
    
    [Layout setLabel:_paymentForEachValueLabel withText:paymentForEach fontSize:40 textColor:[UIColor whiteColor] isBold:YES];
    [_paymentForEachValueLabel sizeToFit];
    
    if (overrideExisting)
    {
        [_superview addSubview:_paymentForEachValueLabel];
        [_paymentForEachValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_paymentForEachView.mas_centerY);
            make.left.equalTo(_paymentForEachView.mas_left).offset(paymentForEachLabelMarginLeftRatio * DEVICE_WIDTH);
        }];
    }
    
}

@end
