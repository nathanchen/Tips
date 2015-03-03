//
//  LayoutResultPageViewValueLabels.h
//  Tips
//
//  Created by Nate on 2/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Layout.h"
#import "LayoutSpecs.h"

@interface LayoutResultPageViewValueLabels : NSObject

@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) UIView *billDetailView;
@property (nonatomic, strong) UIView *paymentForEachView;

@property (nonatomic, strong) UILabel *billAmountValueLabel;
@property (nonatomic, strong) UILabel *partySizeValueLabel;
@property (nonatomic, strong) UILabel *tipsValueLabel;
@property (nonatomic, strong) UILabel *totalValueLabel;
@property (nonatomic, strong) UILabel *paymentForEachValueLabel;

+ (LayoutResultPageViewValueLabels *)sharedInstance;

- (void)setupBillAmountValueLabel: (UILabel *)billAmountValueLabel
              partySizeValueLabel: (UILabel *)partySizeValueLabel
                   tipsValueLabel: (UILabel *)tipsValueLabel
                  totalValueLabel: (UILabel *)totalValueLabel
               eachPaysValueLabel: (UILabel *)paymentForEachValueLabel;

- (void)layoutBillAmountValueLabel: (NSString *)billAmountValue;

- (void)layoutPartySizeValueLabel: (NSString *)partySizeValue;

- (void)layoutTipsValueLabel: (NSString *)tipsValue;

- (void)layoutTotalValueLabel: (NSString *)totalValue;

- (void)layoutPaymentForEachLabel: (NSString *)paymentForEach;

- (void)updateValueLabelsWithBillAmount: (float)billAmount
                              partySize: (int)partySize
                         tipsPercentage: (float)tipsPercentage
                                  total: (float)total
                               eachPays: (float)eachPays;

@end
