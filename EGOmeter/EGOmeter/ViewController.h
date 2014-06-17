//
//  ViewController.h
//  CameraAppTest
//
//  Created by marko on 20.05.14.
//  Copyright (c) 2014 Marko Vukadinovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>
#import <math.h>
#import "tutorialViewController.h"

@interface ViewController : UIViewController{
    //Camera
    AVCaptureSession *session;
    AVCaptureStillImageOutput *stillImageOutput;
    
    //Gyro
    CMMotionManager *motionManager;
    NSOperationQueue *operationQueue;
    NSTimer *timer;
    CMAttitude *attitude;
    
    //tutorialViewController height-Data purpose
    tutorialViewController *height;
    
}

//Camera properties
@property (strong, nonatomic) IBOutlet UIView *frameForCapture;
//rotationLabel prop.
@property (weak, nonatomic) IBOutlet UILabel *rotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *result;


@property (weak, nonatomic) IBOutlet UIImageView *targetImage;

@end
