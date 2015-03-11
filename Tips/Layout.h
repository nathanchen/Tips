//
//  Layout.h
//  Tips
//
//  Created by Nate on 27/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Layout : NSObject

+ (void)setLabel:(UILabel *)label
        withText:(NSString *)text
        fontSize:(float)fontSize
       textColor:(UIColor *)textColor
          isBold:(BOOL)isBold;

+ (UILabel *)setUpLabelWithFrame: (CGRect)frame
                            text: (NSString *)textString
                       textColor: (UIColor *)color
                        textFont: (float)fontSize
                   textAlignment: (NSTextAlignment)textAlignment
                          isBold: (BOOL)isBold;

+ (void)setTextFiled: (UITextField *)textField
            withText: (NSString *)text
            fontSize: (float)fontSize
           textColor: (UIColor *)textColor
              isBold: (BOOL)isBold;

@end
