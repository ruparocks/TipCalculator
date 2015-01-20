//
//  ViewController.m
//  Tip Calculator
//
//  Created by Rupa Sharma on 1/19/15.
//  Copyright (c) 2015 Rupa Sharma. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSelector;
@property (weak, nonatomic) IBOutlet UITextField *tipOptionOne;
@property (weak, nonatomic) IBOutlet UITextField *tipOptionTwo;
@property (weak, nonatomic) IBOutlet UITextField *tipOptionThree;

- (IBAction)onTap:(id)sender;
- (IBAction)saveSelections:(id)sender;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self updateValues];
    [self.view endEditing:YES];
}

- (IBAction)saveSelections:(id)sender {
    [self updateOptions];
    [self.view endEditing:YES];
}

- (void)updateValues {
    float billAmount = [[self.billAmountField.text stringByReplacingOccurrencesOfString:@"$" withString:@"" ] floatValue];
    NSArray * tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipSelector.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.billAmountField.text = [NSString stringWithFormat:@"$%.2f", billAmount];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

- (void)updateOptions {
    float optionOne = [[[self.tipSelector titleForSegmentAtIndex:0] stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    float optionTwo = [[[self.tipSelector titleForSegmentAtIndex:1]stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    float optionThree = [[[self.tipSelector titleForSegmentAtIndex:2]stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    float newOptionOne = [[self.tipOptionOne.text stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    float newOptionTwo = [[self.tipOptionTwo.text stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    float newOptionThree = [[self.tipOptionThree.text stringByReplacingOccurrencesOfString:@"%" withString:@"" ] floatValue];
    if (newOptionOne != optionOne) {
        [self.tipSelector setTitle:[NSString stringWithFormat:@"%f%@", optionOne, @"%"] forSegmentAtIndex:0];
        // remove the % symbol and set the value for the 1st object in tipAmount array
    }
    if (newOptionTwo != optionTwo) {
        [self.tipSelector setTitle:[NSString stringWithFormat:@"%f%@", optionTwo, @"%"] forSegmentAtIndex:1];
        // remove the % symbol and set the value for the 1st object in tipAmount array
    }
    if (newOptionThree != optionThree) {
        [self.tipSelector setTitle:[NSString stringWithFormat:@"%f%@", optionThree, @"%"] forSegmentAtIndex:2];
        // remove the % symbol and set the value for the 1st object in tipAmount array
    }
    
}

@end
