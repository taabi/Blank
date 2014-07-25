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
- (IBAction)onMainViewTap:(id)sender;

//Variables
//functions
-(void) firstAnimation;
-(void) hideTopicView;
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


    //adding side menu
    UIViewController *sideMenu = self.viewManager[0];
    [self.topicViewHandler addSubview:sideMenu.view];
    [self addChildViewController:sideMenu];
    [sideMenu didMoveToParentViewController:self];
 
    
    //setting button radius
    self.getStarterOButton.layer.cornerRadius = 5;
    //self.whiteBoxView.layer.cornerRadius = 10;
    
    //Views To animate from bottom
    self.whiteBoxView.frame = CGRectMake(0, 568, 320, 00);
    self.welcomeLabel.center = CGPointMake(160,200);
    self.getStarterOButton.center = CGPointMake(160,550);
    self.paraLabel.center = CGPointMake(160, 580);

    
    //load Intro Animation
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
    
    [UIView
     animateWithDuration:0.5
     delay:0
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
                    self.whiteBoxView.frame = CGRectMake(0, 70, 320, 505);
                    }
     completion:nil];
    
    
    [UIView
     animateWithDuration:0.5
     delay:0.1
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
         NSLog(@"IT SHOULD RUN");
         self.welcomeLabel.center = CGPointMake(160,86);
         self.getStarterOButton.center = CGPointMake(160,398);
         self.paraLabel.center = CGPointMake(160, 324);
     }
     completion:nil];
    
    
} // end of intro animation

- (IBAction)startButton:(id)sender {
    
    // Hiding the status bar
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

    // Slide in the Topic View
    [UIView
     animateWithDuration:0.5
     delay:0
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
                self.topicViewHandler.center = CGPointMake(210, self.topicViewHandler.center.y);
                }
     completion:^(BOOL finished){}];
    
    // Show Black background
    self.transparentView.alpha = 0;
    self.transparentView.frame = CGRectMake(0, 0, 320, 568);
    [UIView animateWithDuration:.3 animations:^{
        self.transparentView.alpha = 0.8;
        ;
    }];

}

- (IBAction)onMainViewTap:(id)sender {
    
    [self.view endEditing:YES];
    [self hideTopicView];
    
}
-(void) hideTopicView{
    
    [UIView
     animateWithDuration:0.3
     delay:0
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
         self.topicViewHandler.center = CGPointMake(490, self.topicViewHandler.center.y);
     }
     completion:^(BOOL finished){}];
    
    // Hide Black background
    self.transparentView.frame = CGRectMake(320, 0, 320, 568);
    [UIView animateWithDuration:.3 animations:^{
        self.transparentView.alpha = 0.0;
        ;
    }];
    
}

-(void) showFeedView{
    NSLog(@"runn");
    feedViewController *fvc =[[feedViewController alloc]init];
    fvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:fvc animated:YES completion:nil];
    
}
@end
