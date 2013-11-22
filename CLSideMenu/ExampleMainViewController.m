//
//  ExampleMainViewController.m
//  CLSideMenu
//
//  Created by Chinh Le on 11/22/13.
//  Copyright (c) 2013 Chinh Le. All rights reserved.
//

#import "ExampleMainViewController.h"
#import "CLSideMenuViewController.h"

@interface ExampleMainViewController ()

@end

@implementation ExampleMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self addOpenButton];
}

-(void)addOpenButton
{
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

@end
