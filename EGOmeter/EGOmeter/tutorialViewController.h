//
//  tutorialViewController.h
//  EGOmeter
//
//  Created by marko on 17.06.14.
//  Copyright (c) 2014 Marko Vukadinovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tutorialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *heightInput;
@property (weak, nonatomic) IBOutlet UIButton *weiterButton;

-(double)getHeight;


@end
