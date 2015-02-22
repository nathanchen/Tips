//
//  Result.m
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "Result.h"

@implementation Result

- (instancetype)initResultWithMoney:(float)money percentage:(float)percentage
{
    self = [super init];
    if (self)
    {
        _percentage = percentage;
        _tipsAmount = money * percentage;
        _totalAmount = _tipsAmount + money;
    }
    return self;
}

@end
