//
//  TemperatureConverterViewController.m
//  Temprature Converter
//
//  Created by Saumitra Bhanage on 7/27/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

- (void) onConvertClicked;

@end
int ctof;

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
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Temprature";
    
    [self.btnConvert addTarget:self action:@selector(convert) forControlEvents:UIControlEventTouchUpInside];

    [self.tvFahrenheit addTarget:self action:@selector(selectSourceWithTf:) forControlEvents:UIControlEventEditingChanged];
    [self.tvCelsius addTarget:self action:@selector(selectSourceWithTf:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - public functions

- (void) closeKeyboard {
    [self.view endEditing:YES];
    [self convert];
}

- (void) onConvertClicked {
    [self closeKeyboard];
}

# pragma mark - private functions 

- (void) convert {
        
    if ( 1 == ctof ) {
        
        if ( self.tvCelsius.text.length > 0 ) {
            float celsius = [self.tvCelsius.text floatValue];
            float fahrenheit = (celsius * 9 / 5) + 32;
            self.tvFahrenheit.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
        }
    } else if ( 0 == ctof) {
        
        if ( self.tvFahrenheit.text.length > 0 ) {
            float fahrenheit = [self.tvFahrenheit.text floatValue];
            float celsius = (fahrenheit - 32) * 5/9;
            self.tvCelsius.text = [NSString stringWithFormat:@"%0.2f", celsius ];
        }
    }
}

- (void) selectSourceWithTf:(UITextField *)Tf {
    if ( Tf.tag == self.tvCelsius.tag ) {
        ctof = 1;
    } else {
        ctof = 0;
    }
}

@end
