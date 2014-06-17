//
//  ViewController.m
//  CameraAppTest
//
//  Created by marko on 20.05.14.
//  Copyright (c) 2014 Marko Vukadinovic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

//data
double angle,result,thisHeight;

//angle-method for degrees (not radians!)
#define angle(x) (180 * x / M_PI)


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    height = [[tutorialViewController alloc]init];
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval =1.0/20.0;
    [motionManager startDeviceMotionUpdates];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/20.0 target:self selector:@selector(read) userInfo:nil repeats:YES];
    
    if([motionManager isGyroAvailable]){
        if (![motionManager isGyroActive]){
            [motionManager setGyroUpdateInterval:.1];
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error){
                
            }];
        }
        else{
            
        }
        
    }
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    //Kamera
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session
         canAddInput:deviceInput]){
        [session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer =[[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    //Frame creating
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.frameForCapture.frame;
    
    [previewLayer setFrame:frame];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    
    //Still-Image -Output
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:stillImageOutput];
    
    [session startRunning];
    
}

-(void)read{
    CMDeviceMotion *motion = motionManager.deviceMotion;
    attitude = motion.attitude;
    
    NSString *pitch = [NSString stringWithFormat:@"Winkel: %0.1f°",angle(attitude.pitch)];
    _rotationLabel.text = pitch;
    
    
    double alpha = angle(attitude.pitch);
    angle = tan(alpha * M_PI/180);
    thisHeight = [height getHeight];
    result = thisHeight*angle;
    
    
    if (result >=100) {
        NSString *distance = [NSString stringWithFormat:@"Result: %0.1f m",result/100];
        _result.text = distance;
    }else{
        NSString *distance = [NSString stringWithFormat:@"Result: %0.1f cm",result];
        _result.text = distance;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
