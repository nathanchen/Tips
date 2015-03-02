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

+ (LayoutResultPageViewValueLabels *)sharedInstanceWithBillAmountValueLabel: (UILabel *)billAmountValueLabel
                                                        partySizeValueLabel: (UILabel *)partySizeValueLabel
                                                             tipsValueLabel: (UILabel *)tipsValueLabel
                                                            totalValueLabel: (UILabel *)totalValueLabel
                                                         eachPaysValueLabel: (UILabel *)paymentForEachValueLabel;

- (void)layoutBillAmountValueLabel: (UILabel *)billAmountValueLabel
                         withValue: (NSString *)billAmountValue;

- (void)layoutPartySizeValueLabel: (UILabel *)partySizeValueLabel
                        withValue: (NSString *)partySizeValue;

- (void)layoutTipsValueLabel: (UILabel *)tipsValueLabel
                   withValue: (NSString *)tipsValue;

- (void)layoutTotalValueLabel: (UILabel *)totalValueLabel
                    withValue: (NSString *)totalValue;

- (void)layoutPaymentForEachLabel: (UILabel *)paymentForEachValueLabel
                        withValue: (NSString *)paymentForEach;

@end
