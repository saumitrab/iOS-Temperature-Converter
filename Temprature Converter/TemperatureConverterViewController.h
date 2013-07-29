//
//  TemperatureConverterViewController.h
//  Temprature Converter
//
//  Created by Saumitra Bhanage on 7/27/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *tvFahrenheit;
@property (nonatomic, strong) IBOutlet UITextField *tvCelsius;
@property (nonatomic, strong) IBOutlet UIButton *btnConvert;

- (IBAction) closeKeyboardAndConvertTemperature;

@end
