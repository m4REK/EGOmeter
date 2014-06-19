//
//  tutorialViewController.m
//  EGOmeter
//
//  Created by marko on 17.06.14.
//  Copyright (c) 2014 Marko Vukadinovic. All rights reserved.
//

#import "tutorialViewController.h"

@interface tutorialViewController ()

@end

double height;

@implementation tutorialViewController

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
    
    //weiterButton properties
    _weiterButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                     nil];
    self.heightInput.inputAccessoryView = toolbar;
    
checkingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/20.0 target:self selector:@selector(checkTextFieldForInput) userInfo:nil repeats:YES];
}

-(void)checkTextFieldForInput{
    if (height <= 10) {
        _weiterButton.enabled = NO;
        _weiterButton.layer.borderColor = [[UIColor redColor]CGColor];
    }else{
        _weiterButton.layer.borderColor = [[UIColor greenColor]CGColor];
        _weiterButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) doneWithNumberPad{
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number = [nf numberFromString:self.heightInput.text];
   
    height = [number doubleValue] -10;

    [self.heightInput resignFirstResponder];
    
}

-(void)cancelNumberPad{
    [self.heightInput resignFirstResponder];
    self.heightInput.text = @"";
    height = 0;
    
}

-(double)getHeight{
    return height;
}


@end
