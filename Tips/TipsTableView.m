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
    NSMutableArray *results;
    float _billAmount;
}

- (instancetype)initWithBillAmount: (float)billAmount
{
    self = [super init];
    _billAmount = billAmount;
    results = [[NSMutableArray alloc] init];
    [self calculateTips];
    
    self.delegate = self;
    self.dataSource = self;
    
    [self registerClass:[TipsTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    return self;
}

- (void)calculateTips
{
    [results removeAllObjects];
    Result *result;
    for (int i = 1; i <= 40; i ++)
    {
        result = [[Result alloc] initResultWithMoney:_billAmount percentage:((float)i / 100)];
        [results addObject:result];
    }
}

#pragma mark - table view datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipsTableViewCell *cell = (TipsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Result *result = results[indexPath.row];
    
    cell.tipsPercentage.text = [NSString stringWithFormat:@"%ld%%", (long)indexPath.row + 1];
    cell.tipsAmount.text = [NSString stringWithFormat:@"%0.02f", result.tipsAmount];
    cell.totalAmount.text = [NSString stringWithFormat:@"%0.02f", result.totalAmount];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tipsTableViewHeightRatio * [[UIScreen mainScreen] bounds].size.height * 0.22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return tipsTableViewHeightRatio * [[UIScreen mainScreen] bounds].size.height * 0.12;
}

#pragma mark - table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
