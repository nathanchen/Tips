//
//  TipsTableView.m
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "TipsTableView.h"

static NSString *CellIdentifier = @"CellIdentifier";

@implementation TipsTableView
{
    float _billAmount;
    BOOL isFirstTime;
}

- (instancetype)initWithBillAmount: (float)billAmount
{
    self = [super init];
    _billAmount = billAmount;
    _tipsPercentage = DEFAULT_TIPS_PERCENTAGE;
    isFirstTime = YES;
    _results = [[NSMutableArray alloc] init];
    [self calculateTips];
    
    self.dataSource = self;
    
    [self registerClass:[TipsTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    return self;
}

- (void)calculateTips
{
    [_results removeAllObjects];
    Result *result;
    for (int i = 1; i <= 40; i ++)
    {
        result = [[Result alloc] initResultWithMoney:_billAmount percentage:((float)i / 100)];
        [_results addObject:result];
    }
}

#pragma mark - table view datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipsTableViewCell *cell = (TipsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:51/255.0 green:73/255.0 blue:95/255.0 alpha:1];
    
    Result *result = _results[indexPath.row];
    
    cell.tipsPercentage.text = [self parseFloatForTipsPercentageValue:result.percentage];
    cell.tipsAmount.text = [NSString stringWithFormat:@"%.02f", result.tipsAmount];
    cell.totalAmount.text = [NSString stringWithFormat:@"%.02f", result.totalAmount];
    
    return cell;
}

- (NSString *)parseFloatForTipsPercentageValue: (float)rawData
{
    NSNumberFormatter *floatValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
    [floatValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
    [floatValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:2];
    return [NSString stringWithFormat:@"%@%%", [floatValueWithMaxTwoDecimalPlaces stringFromNumber:[NSNumber numberWithFloat:rawData * 100]]];
}
@end
