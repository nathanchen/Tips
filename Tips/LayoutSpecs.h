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

const int billDetailViewHeight = 148;
const int billDetailViewMarginTop = 64;

const int billDetailViewVerticalSplitOneHeight = 40;
const int billDetailViewVerticalSplitOneWidth = 10;
const int billDetailViewVerticalSplitOneCenterY = billDetailViewHeight / 4;

const int billDetailViewVerticalSplitTwoHeight = 40;
const int billDetailViewVerticalSplitTwoWidth = 10;
const int billDetailViewVerticalSplitTwoCenterY = billDetailViewHeight / 4 * 3;

const int billDetailViewHorizontalSplitHeight = 4;

const int billAmountLabelMarginTop = billDetailViewHeight / 4 + 5;
const int partySizeLabelMarginTop = billDetailViewHeight / 4 + 5;
const int tipsLabelMarginTop = billDetailViewHeight / 4 * 3 + 5;
const int totalLabelMarginTop = billDetailViewHeight / 4 * 3 + 5;

const int tipsValueLabelMarginTop = 10;
const int totalValueLabelMarginTop = 10;
const int billAmountValueLabelMarginTop = 10;
const int partySizeValueLabelMarginTop = 10;

const int paymentForEachViewHeight = 100;
const int paymentForEachViewMarginTop = 30;

const int eachLabelMarginLeft = 20;

const int roundButtonWidth = 40;
const int roundButtonHeight = paymentForEachViewHeight;
const int roundButtonMarginTOp = paymentForEachViewMarginTop;

const float tipsTableViewHeightRatio = 0.35;
const int tipsTableViewMarginTop = 80;

#endif
