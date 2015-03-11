//
//  Result.h
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (nonatomic) float percentage;
@property (nonatomic) float tipsAmount;
@property (nonatomic) float totalAmount;

- (instancetype)initResultWithMoney:(float)money
                         percentage:(float)percentage;

- (BOOL)isEqual:(id)anObject;

@end
