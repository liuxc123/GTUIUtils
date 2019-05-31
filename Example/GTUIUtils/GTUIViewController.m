//
//  GTUIViewController.m
//  GTUIUtils
//
//  Created by liuxc123 on 05/31/2019.
//  Copyright (c) 2019 liuxc123. All rights reserved.
//

#import "GTUIViewController.h"
#import "GTUIUtils.h"

@interface GTUIViewController ()

@end

@implementation GTUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    [GTUITool cameraAvailable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
