//
//  ViewController.m
//  LifeSaver
//
//  Created by Omkar on 2/14/15.
//  Copyright (c) 2015 Omkar. All rights reserved.
//

#import "ViewController.h"
#import "Recorder.h"

@interface ViewController ()

@property (nonatomic, strong) Recorder *recorder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recorder = [[Recorder alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordAction:(id)sender
{
    [self.recorder startRecording];
}

- (IBAction)stopAction:(id)sender
{
    [self.recorder stopRecording];
}
@end
