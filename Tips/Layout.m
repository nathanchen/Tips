//
//  Layout.m
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "Layout.h"

@implementation Layout

+ (void)setLabel:(UILabel *)label
        withText:(NSString *)text
        fontSize:(float)fontSize
       textColor:(UIColor *)textColor
          isBold:(BOOL)isBold
{
    label.text = text;
    [label setTextColor:textColor];
    if (isBold)
    {
        [label setFont:[UIFont boldSystemFontOfSize:fontSize]];
    }
    else
    {
        [label setFont:[UIFont systemFontOfSize:fontSize]];
    }
}

+ (UILabel *)setUpLabelWithFrame: (CGRect)frame
                            text: (NSString *)textString
                       textColor: (UIColor *)color
                        textFont: (float)fontSize
                   textAlignment: (NSTextAlignment)textAlignment
                          isBold: (BOOL)isBold
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [Layout setLabel:label withText:textString fontSize:fontSize textColor:color isBold:isBold];
    [label setTextAlignment:textAlignment];
    return label;
}

@end
