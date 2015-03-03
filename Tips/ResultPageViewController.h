//
//  ResultPageViewController.h
//  Tips
//
//  Created by Nate on 24/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//
#import "Layout.h"
#import "Masonry.h"
#import "TipsTableView.h"
#import "LayoutSpecs.h"
#import "LayoutResultPageViewValueLabels.h"

@interface ResultPageViewController : UIViewController<UITableViewDelegate>

@property (nonatomic, strong) LayoutResultPageViewValueLabels *layoutResultPageViewValueLabels;

@property (nonatomic) float billAmount;
@property (nonatomic) int partySize;

- (void)updateValueLabelsOverrideExisting: (BOOL)overrideExisting;

@end
