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
@property (strong, nonatomic) IBOutlet UIView *SettingsView;

- (IBAction)onTap:(id)sender;

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

- (void)updateValues {
    float billAmount = [[self.billAmountField.text stringByReplacingOccurrencesOfString:@"$" withString:@"" ] floatValue];
    NSArray * tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipSelector.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.billAmountField.text = [NSString stringWithFormat:@"$%.2f", billAmount];
    self.tipLabel.text =    [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}
@end
