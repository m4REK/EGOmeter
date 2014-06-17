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
    
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                     nil];
    self.heightInput.inputAccessoryView = toolbar;
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
    
}

-(double)getHeight{
    return height;
}


-(BOOL)shouldAutorotate{
    return NO;
}

@end
