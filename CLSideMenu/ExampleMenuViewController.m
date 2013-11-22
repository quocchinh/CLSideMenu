//
//  ExampleMenuViewController.m
//  CLSideMenu
//
//  Created by Chinh Le on 11/22/13.
//  Copyright (c) 2013 Chinh Le. All rights reserved.
//

#import "ExampleMenuViewController.h"
#import "CLSideMenuViewController.h"

@interface ExampleMenuViewController() <CLMenuViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *firstItem;
@property (weak, nonatomic) IBOutlet UIButton *secondItem;
@property (weak, nonatomic) IBOutlet UIButton *thirdItem;
@property (weak, nonatomic) IBOutlet UIButton *fourthItem;
@property (weak, nonatomic) IBOutlet UIButton *fifthItem;

@end

@implementation ExampleMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:51.0f/255.0f green:102.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    
    [self registerMenuButton:self.firstItem];
    [self registerMenuButton:self.secondItem];
    [self registerMenuButton:self.thirdItem];
    [self registerMenuButton:self.fourthItem];
    [self registerMenuButton:self.fifthItem];
    
    [self setDelegate:self];
}

-(void)menuButtonSelected:(UIButton *)sender
{
    // Switch to next view controller using main navigation controller here
    
    // Then close the menu
    [self.sideMenuViewController closeMenuAnimated:YES completion:^(BOOL finished){
        
    }];
    
    
}

@end
