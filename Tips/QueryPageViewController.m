//
//  QueryPageViewController.m
//  Tips
//
//  Created by Nate on 23/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "QueryPageViewController.h"

const int billAmountTextField_top_constraint_starting_point = 180;
const int billAmountTextField_top_constraint_ending_point = 122;

@interface QueryPageViewController ()
{
    NSString *billAmount;
    __weak IBOutlet NSLayoutConstraint *selectSplitViewTopConstraint;
    __weak IBOutlet NSLayoutConstraint *billAmountTextFieldTopConstraint;
}

@end

@implementation QueryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _selectSplitView.hidden = YES;
    billAmount = @"";
    _selectSplitViewContainer.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - text field delegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == TAG_BILL_AMOUNT_TEXT_FIELD)
    {
        [_billAmountTextField resignFirstResponder];
    }
    else
    {
        
    }
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == TAG_BILL_AMOUNT_TEXT_FIELD)
    {
        billAmount = textField.text;
        
        billAmountTextFieldTopConstraint.constant = billAmountTextField_top_constraint_ending_point;
        [UIView animateWithDuration:0.3
                         animations:^{
                             _billAmountTextField.text = @"";
                             [_billAmountTextField.superview layoutIfNeeded];
                         }
                         completion:^(BOOL finished){
                             _billAmountTextField.text = [NSString stringWithFormat:@"Bill Amount: \t %@", billAmount];
                             _selectSplitView.hidden = NO;
                             
                             [UIView transitionWithView:_selectSplitViewContainer
                                               duration:1
                                                options:UIViewAnimationOptionTransitionFlipFromTop
                                             animations:^{
                                                 _selectSplitViewContainer.layer.transform = CATransform3DMakeRotation(0, 1, 0, 0);
                                             } completion:nil];

                         }];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == TAG_BILL_AMOUNT_TEXT_FIELD)
    {
        _billAmountTextField.text = [self retrieveBillAmountFromNSString:billAmount];
        billAmountTextFieldTopConstraint.constant = billAmountTextField_top_constraint_starting_point;
        _selectSplitView.hidden = YES;
    }
}

CA_EXTERN CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CA_EXTERN CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

#pragma mark - supporting methods
- (NSString *)retrieveBillAmountFromNSString: (NSString *)billAmountDescriptionString
{
    NSRegularExpression *billAmountDescription = [NSRegularExpression regularExpressionWithPattern:@"[0-9]{1,5}" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *arrayOfAllMatches = [billAmountDescription matchesInString:billAmountDescriptionString options:0 range:NSMakeRange(0, [billAmountDescriptionString length])];
    
    if (arrayOfAllMatches != nil && [arrayOfAllMatches count] != 0)
    {
        for (NSTextCheckingResult *match in arrayOfAllMatches)
        {
            NSString *substringForMatch = [billAmountDescriptionString substringWithRange:match.range];
            NSLog(@"%@", substringForMatch);
            return substringForMatch;
        }
    }
    return @"0";
}



@end
