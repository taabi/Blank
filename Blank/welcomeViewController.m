//
//  welcomeViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "welcomeViewController.h"

@interface welcomeViewController ()

//Actions and Outlets
@property (weak, nonatomic) IBOutlet UIView *getStarterOButton;
@property (weak, nonatomic) IBOutlet UIView *whiteBoxView;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *paraLabel;
@property (strong, nonatomic) IBOutlet UIView *topicViewHandler;
//Variables
//functions
-(void) firstAnimation;

@end
@implementation welcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //white status bar
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIViewController *sideMenu = self.viewManager[0];
    [self.topicViewHandler addSubview:sideMenu.view];
    
    //
    self.getStarterOButton.layer.cornerRadius = 5;
    //Whitebox To animate from bottom
<<<<<<< HEAD
    self.whiteBoxView.frame = CGRectMake(0, 568, 320, 00);
    self.welcomeLabel.center = CGPointMake(0,0);
=======
    self.whiteBoxView.frame = CGRectMake(0, 568, 320, 0);
>>>>>>> master
    
    //load Animation
    [self firstAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) firstAnimation
{
    NSLog(@"Loading Animation");
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.whiteBoxView.frame = CGRectMake(0, 63, 320, 505);
    } completion:^(BOOL finished) {

        

    }];
    
    
    [UIView animateWithDuration:0.5 delay:0.2  options:0 animations:^{
        NSLog(@"test");
//        self.welcomeLabel.frame = CGRectMake(self.welcomeLabel.frame.origin.x,100, self.welcomeLabel.frame.size.width, self.welcomeLabel.frame.size.height);
//        self.whiteBoxView.backgroundColor = [UIColor orangeColor];

    } completion:nil];


    
    
}

@end
