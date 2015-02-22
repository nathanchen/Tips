//
//  Strings.m
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "Strings.h"

@implementation Strings

+ (NSString *)stringPercentageWithFloat:(float)percentage
{
    float number = percentage * 100;
    return [NSString stringWithFormat:@"%f", number];
}

@end
