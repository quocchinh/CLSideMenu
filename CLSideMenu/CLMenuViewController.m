//
//  CLMenuViewController.m
//
//  Created by Chinh Le on 11/8/13.
//

#import "CLMenuViewController.h"

@interface CLMenuViewController ()

@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic,weak) UIButton *currentSelectedButton;

@end

@implementation CLMenuViewController

-(NSMutableArray *)buttonArray
{
    if ( !_buttonArray ) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

-(void)registerBackgroundImage:(UIImage *)image
{
    self.backgroundImageView = [[UIImageView alloc] initWithImage:image];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGRect imageViewRect = [[UIScreen mainScreen] bounds];
    imageViewRect.size.width += 589;
    self.backgroundImageView.frame = imageViewRect;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.backgroundImageView];
    
    NSDictionary *viewDictionary = @{ @"imageView" : self.backgroundImageView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
}

-(void)registerMenuButton:(UIButton *)button
{
    [button addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonArray addObject:button];
}

-(void)menuButtonPressed:(UIButton *)sender
{
    if (self.currentSelectedButton == sender) {
        return;
    }
    
    if (self.currentSelectedButton) {
        [self.currentSelectedButton setSelected:NO];
    }
    [sender setSelected:YES];
    self.currentSelectedButton = sender;
    
    [self.delegate menuButtonSelected:sender];
}

-(void)hideMenuButtons
{
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop){
        button.alpha = 0;
    }];
}

-(void)unhideMenuButtons
{
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop){
        button.alpha = 1;
    }];
}

-(void)showMenuButtons:(MenuItemAnimationType)animationType
{
    switch (animationType) {
        case MenuItemAnimationTypeNone:
            [self unhideMenuButtons];
            break;
            
        case MenuItemAnimationTypeTopDownAppear:
            [self showMenuButtonsTopDownAppear];
            break;
            
        default:
            break;
    }
} 

-(void)showMenuButtonsTopDownAppear
{
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop){
        button.layer.transform = CATransform3DMakeScale(0.3, 0.3, 0.1);
        button.alpha = 0;
        
        [UIView animateWithDuration:0.2
                              delay:0+0.05*idx
//             usingSpringWithDamping:0.7
//              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             button.layer.transform = CATransform3DIdentity;
                             button.alpha = 1;
                         }
                         completion:nil];
    }];
}

@end
