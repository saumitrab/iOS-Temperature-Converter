//
//  TemperatureConverterViewController.m
//  Temprature Converter
//
//  Created by Saumitra Bhanage on 7/27/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

- (void) closeKeyboardAndConvertTemperature;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tvCelsius.delegate = self;
    self.tvFahrenheit.delegate = self;
    
    self.title = @"Temprature";
    
    [self.btnConvert addTarget:self action:@selector(closeKeyboardAndConvertTemperature) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public functions

- (void) closeKeyboardAndConvertTemperature {
    [self.view endEditing:YES];
    
    if ( self.activeTextField.tag == self.tvCelsius.tag ) {
        
        if ( self.tvCelsius.text.length > 0 ) {
            float celsius = [self.tvCelsius.text floatValue];
            float fahrenheit = (celsius * 9 / 5) + 32;
            self.tvFahrenheit.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
        }
    } else if ( self.activeTextField.tag == self.tvFahrenheit.tag ) {
        
        if ( self.tvFahrenheit.text.length > 0 ) {
            float fahrenheit = [self.tvFahrenheit.text floatValue];
            float celsius = (fahrenheit - 32) * 5/9;
            self.tvCelsius.text = [NSString stringWithFormat:@"%0.2f", celsius ];
        }
    }
}

# pragma mark - UITextField Delegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeTextField = textField;
}

@end
