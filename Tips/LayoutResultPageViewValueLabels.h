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

- (void)layoutBillAmountValueLabel: (NSString *)billAmountValue
                  overrideExisting: (BOOL)overrideExisting;

- (void)layoutPartySizeValueLabel: (NSString *)partySizeValue
                 overrideExisting: (BOOL)overrideExisting;

- (void)layoutTipsValueLabel: (NSString *)tipsValue
            overrideExisting: (BOOL)overrideExisting;

- (void)layoutTotalValueLabel: (NSString *)totalValue
             overrideExisting: (BOOL)overrideExisting;

- (void)layoutPaymentForEachLabel: (NSString *)paymentForEach
                 overrideExisting: (BOOL)overrideExisting;

@end
