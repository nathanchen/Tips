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
#define RECOMMAND_TIPS_RATE 15

const int billDetailViewMarginTop = 64;
const float billDetailViewHeightRatio = 0.3;

const float billDetailViewVerticalSplitOneHeightRatio = billDetailViewHeightRatio / 2;
const int billDetailViewVerticalSplitOneWidth = 2;
const float billDetailViewVerticalSplitOneCenterYRatio = billDetailViewHeightRatio / 4;

const float billDetailViewVerticalSplitTwoHeightRatio = billDetailViewHeightRatio / 2;
const int billDetailViewVerticalSplitTwoWidth = 2;
const float billDetailViewVerticalSplitTwoCenterYRatio = billDetailViewHeightRatio / 4 * 3;

const int billDetailViewHorizontalSplitHeight = 2;

const float billAmountLabelMarginTopRatio = 0.08;
const float partySizeLabelMarginTopRatio = 0.08;
const float tipsLabelMarginTopRatio = 0.25;
const float totalLabelMarginTopRatio = 0.25;

const float billAmountValueLabelMarginTopRatio = 0.02;
const float partySizeValueLabelMarginTopRatio = 0.02;
const float tipsValueLabelMarginTopRatio = 0.19;
const float totalValueLabelMarginTopRatio = 0.19;

const int paymentForEachViewHeight = 100;
const float paymentForEachViewHeightRatio = 0.17;
const float paymentForEachViewMarginTopRatio = billDetailViewHeightRatio;

const float paymentForEachLabelMarginLeftRatio = 0.25;

const int eachLabelMarginLeft = 20;

const float roundButtonWidthRatio = 0.125;
const float roundButtonHeightRatio = paymentForEachViewHeightRatio;
const float roundButtonMarginTopRatio = paymentForEachViewMarginTopRatio;

const float tipsTableViewCellHeaderHeightRatio = 0.08;
const float tipsTableViewMarginTopRatio = 0.55 + tipsTableViewCellHeaderHeightRatio;
const float tipsTableViewHeightRatio = 1 - tipsTableViewMarginTopRatio;

const float tipsTableViewCellHeightRatio = 0.22;

//const float tipsPercentageMarginLeftRatio = 

#endif
