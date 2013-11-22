//
//  CLMenuViewController.h
//
//  Created by Chinh Le on 11/8/13.
//

typedef NS_ENUM(NSInteger, MenuItemAnimationType) {
    MenuItemAnimationTypeNone,
    MenuItemAnimationTypeTopDownAppear
};

@class CLMenuViewController;

@protocol CLMenuViewControllerDelegate <NSObject>

-(void)menuButtonSelected:(UIButton *)sender;

@end

@interface CLMenuViewController : UIViewController

@property (nonatomic,weak) UIViewController *mainViewController;
@property (nonatomic,weak) id<CLMenuViewControllerDelegate> delegate;

-(void)registerBackgroundImage:(UIImage *)image;
-(void)registerMenuButton:(UIButton *)button;
-(void)hideMenuButtons;
-(void)unhideMenuButtons;
-(void)showMenuButtons:(MenuItemAnimationType)animationType;

@end
