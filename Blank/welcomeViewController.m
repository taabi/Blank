//
//  welcomeViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "welcomeViewController.h"
#import "topicViewController.h"
#import "feedViewController.h"

@interface welcomeViewController ()

//Actions and Outlets
@property (weak, nonatomic) IBOutlet UIView *getStarterOButton;
@property (weak, nonatomic) IBOutlet UIView *whiteBoxView;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *paraLabel;
@property (strong, nonatomic) IBOutlet UIView *topicViewHandler;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
- (IBAction)startButton:(id)sender;
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
    

    
    
    //[self.blackViewMain setHidden:YES];
    
    //adding side menu
    UIViewController *sideMenu = self.viewManager[0];
    [self.topicViewHandler addSubview:sideMenu.view];

    
     
    
    //setting button radius
    self.getStarterOButton.layer.cornerRadius = 5;
    
    //Whitebox To animate from bottom
    self.whiteBoxView.frame = CGRectMake(0, 568, 320, 00);

    
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
    
    
//    [UIView animateWithDuration:0.5 delay:0.2  options:0 animations:^{
//        NSLog(@"test");
////        self.welcomeLabel.frame = CGRectMake(self.welcomeLabel.frame.origin.x,100, self.welcomeLabel.frame.size.width, self.welcomeLabel.frame.size.height);
////        self.whiteBoxView.backgroundColor = [UIColor orangeColor];
//
//    } completion:nil];


    
    
}

- (IBAction)startButton:(id)sender {
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.topicViewHandler.center = CGPointMake(210, self.topicViewHandler.center.y);
    } completion:nil];
    
    //black background
    [UIView animateWithDuration:0 animations:^{
        self.transparentView.frame = CGRectMake(0, 0, 320, 568);
        self.transparentView.alpha = 0.8;
        ;
    }];

    
    
    //[self showFeedView];
}

-(void) showFeedView{
    NSLog(@"runn");
    feedViewController *fvc =[[feedViewController alloc]init];
    fvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:fvc animated:YES completion:nil];
    
}
@end
