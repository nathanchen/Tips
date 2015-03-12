//
//  LayoutSpecs.h
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#ifndef Tips_LayoutSpecs_h
#define Tips_LayoutSpecs_h

#define DEVICE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DEVICE_WIDTH  ([[UIScreen mainScreen] bounds].size.width)

#define GREENISH_COLOR [UIColor colorWithRed:53/255.0 green:176/255.0 blue:138/255.0 alpha:1]
#define DARK_GREENISH_COLOR [UIColor colorWithRed:41/255.0 green:137/255.0 blue:113/255.0 alpha:1]
#define LIGHT_YELLOWISH_COLOR [UIColor colorWithRed:245/255.0 green:235/255.0 blue:219/255.0 alpha:1]
#define DARK_BLUEISH_COLOR [UIColor colorWithRed:51/255.0 green:73/255.0 blue:95/255.0 alpha:1]
#define BLUEISH_COLOR [UIColor colorWithRed:66/255.0 green:106/255.0 blue:181/255.0 alpha:1]
#define LIGHT_BLUEISH_COLOR [UIColor colorWithRed:118/255.0 green:190/255.0 blue:242/255.0 alpha:1]

#define RECOMMAND_TIPS_RATE 15

const static float billAmountViewMarginTopRatio = 0.3;
const static float billAmountViewHeightRatio = 0.2;
const static float billAmountTextFieldHeightRatio = 0.06;
// after transform
const static float billAmountViewWidthRatioTrans = 0.5;

const static float billAmountLabelTopRatio = 0.44;

const static float questionLabelTopRatio = billAmountLabelTopRatio;

const static float selectSplitViewMarginTopRatio = 0.3;
const static float selectSplitViewWidthRatio = 1 - billAmountViewWidthRatioTrans;
const static float selectSplitViewHeightRatio = billAmountViewHeightRatio;
const static float selectSplitViewMarginLeftRatio = billAmountViewWidthRatioTrans;

const static float increaseButtonMarginRightRatio = 0.05;
const static float decreaseButtonMarginLeftRatio = 0.05;

const static float doneButtonMarginTopRatio = 0.6;

const static int navigationBarHeight = 64;
const static int navigationBackButtonWidth = 100;
const static float navigationBackButtonMarginTop = 0.4 * navigationBarHeight;

const static int billDetailViewMarginTop = navigationBarHeight;
const static float billDetailViewHeightRatio = 0.3;

const static float billDetailViewVerticalSplitOneHeightRatio = billDetailViewHeightRatio / 2;
const static int billDetailViewVerticalSplitOneWidth = 2;
const static float billDetailViewVerticalSplitOneCenterYRatio = billDetailViewHeightRatio / 4;

const static float billDetailViewVerticalSplitTwoHeightRatio = billDetailViewHeightRatio / 2;
const static int billDetailViewVerticalSplitTwoWidth = 2;
const static float billDetailViewVerticalSplitTwoCenterYRatio = billDetailViewHeightRatio / 4 * 3;

const static int billDetailViewHorizontalSplitHeight = 2;

const static float billAmountLabelMarginTopRatio = 0.08;
const static float partySizeLabelMarginTopRatio = 0.08;
const static float tipsLabelMarginTopRatio = 0.25;
const static float totalLabelMarginTopRatio = 0.25;

const static float billAmountValueLabelMarginTopRatio = 0.02;
const static float partySizeValueLabelMarginTopRatio = 0.02;
const static float tipsValueLabelMarginTopRatio = 0.19;
const static float totalValueLabelMarginTopRatio = 0.19;

const static float paymentForEachViewHeightRatio = 0.17;
const static float paymentForEachViewMarginTopRatio = billDetailViewHeightRatio;

const static float paymentForEachLabelMarginLeftRatio = 0.25;

const static int eachLabelMarginLeft = 20;

const static float roundButtonWidthRatio = 0.125;
const static float roundButtonHeightRatio = paymentForEachViewHeightRatio;
const static float roundButtonMarginTopRatio = paymentForEachViewMarginTopRatio;

const static float tipsTableViewCellHeaderHeightRatio = 0.08;
const static float tipsTableViewMarginTopRatio = 0.55 + tipsTableViewCellHeaderHeightRatio;
const static float tipsTableViewHeightRatio = 0.9 - tipsTableViewMarginTopRatio;

const static float tipsTableViewCellHeightRatio = 0.22 * tipsTableViewHeightRatio * 2;

const static float tipsTableViewCell1OriginX = 0.05;
const static float tipsTableViewCell1Width = 0.21;
const static float tipsTableViewCell2OriginX = 0.33;
const static float tipsTableViewCell2Width = 0.27;
const static float tipsTableViewCell3OriginX = 0.68;
const static float tipsTableViewCell3Width = 0.31
;

//const static float tipsPercentageMarginLeftRatio =

#endif
