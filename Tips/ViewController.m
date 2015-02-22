//
//  ViewController.m
//  Tips
//
//  Created by Nate on 17/02/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "ViewController.h"

const float initial_percentage = 0.01;
const int money_text_field_starting_position = 200;
const int money_text_field_ending_position = 50;
const int table_view_position = 100;

@interface ViewController ()
{
    NSMutableArray *results;
    float money;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _detailTableView.hidden = YES;
    
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneWithNumberPad)],
                           nil
                           ];
    [numberToolbar sizeToFit];
    _moneyTextField.inputAccessoryView = numberToolbar;
}

- (void)cancelNumberPad
{
    [_moneyTextField resignFirstResponder];
}

- (void)doneWithNumberPad
{
    NSString *inputs = _moneyTextField.text;
    if ([self inputIsOnlyNumbers:inputs])
    {
        money = [inputs floatValue];
        if (money > 0)
        {
            [_moneyTextField resignFirstResponder];
            Result *result;
            results = [[NSMutableArray alloc] init];
            for(int i = 1; i <= 100; i ++)
            {
                result = [[Result alloc] initResultWithMoney:money percentage:((float)i / 100)];
                [results addObject:result];
            }
            [_detailTableView reloadData];
            
            [self moneyTextFieldFloatToTop];
            _detailTableView.hidden = NO;
            return;
        }
    }
    _detailTableView.hidden = YES;
}

- (void)moneyTextFieldFloatToTop
{
    _moneyTextFieldTopConstraint.constant = money_text_field_ending_position;
    [UIView animateWithDuration:0.3
                     animations:^{
                         [_moneyTextField.superview layoutIfNeeded];
                     }
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)inputIsOnlyNumbers: (NSString *)inputString
{
    NSRegularExpression *numbersOnly = [NSRegularExpression regularExpressionWithPattern:@"[0-9]{1,5}" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSInteger numberOfMatches = [numbersOnly numberOfMatchesInString:inputString options:0 range:NSMakeRange(0, [inputString length])];
    
    if (numberOfMatches != 1 && [inputString length] != 0)
    {
        return NO;
    }
    return YES;
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
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    Result *result = results[indexPath.row];
    
    cell.tipsPercentage.text = [NSString stringWithFormat:@"%ld%%", (long)indexPath.row + 1];
    cell.tipsAmount.text = [NSString stringWithFormat:@"%0.02f", result.tipsAmount];
    cell.totalAmount.text = [NSString stringWithFormat:@"%0.02f", result.totalAmount];
    
    return cell;
}

#pragma mark - table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - text field delegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _moneyTextFieldTopConstraint.constant = money_text_field_starting_position;
    _detailTableView.hidden = YES;
}


@end
