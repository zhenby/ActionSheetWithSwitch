//
//  ViewController.m
//  ActionSheetWithSwitchDemo
//
//  Created by zhenby on 13-1-24.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    [_button release];
    _button = nil;
    
    [_actionSheet release];
    _actionSheet = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _button.frame = CGRectMake(20, 200, 280, 80);
    [_button setTitle:@"Show Action Sheet" forState:UIControlStateNormal];
    [_button addTarget:self
                action:@selector(onButtonTap)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action handle
- (void)onButtonTap
{
    if (nil == _actionSheet)
    {
        _actionSheet = [[ActionSheetWithSwitch alloc] initWithTitle:@"Share the Music"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"Share to Facebook", @"Share to Twitter",
                        nil];
        _actionSheet.titleOfSwith = @"Show Title";
        _actionSheet.switchDelegate = self;
        _actionSheet.isSwitchOn = YES;
    }
    
    [_actionSheet showInView:self.view];
}

#pragma mark - UIActionSheet switch delegate
- (void)onSwithValueChange
{
    NSLog(@"the switch is:%d", _actionSheet.isSwitchOn);
}

@end
