//
//  feedViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "feedViewController.h"
#import "videoViewController.h"
#import "topicViewController.h"
#import "PBJVideoPlayerController.h"
#import "PBJVideoView.h"
#import "HCYoutubeParser.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface feedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
- (IBAction)fullScreenbutton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIView *navBarView;
@property (weak, nonatomic) IBOutlet UILabel *navBarTitle;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButtonView;
- (IBAction)menuClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *topicHandler;
@property (strong,nonatomic) videoViewController *vvc;
@property (strong,nonatomic) topicViewController *tvc;
@property (weak, nonatomic) IBOutlet UIButton *fakeDone;
@property (weak, nonatomic) IBOutlet UIView *transparentView;

- (IBAction)fakeDoneClick:(id)sender;

// video views outlets
@property (nonatomic,strong) PBJVideoPlayerController *player;

@property (weak, nonatomic) IBOutlet UIView *firstView;
// End of outlets


-(void) loadTopics;
@end

@implementation feedViewController

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
    
    videoViewController *tempvvc = self.feedViewManager[1];
    self.vvc = tempvvc;
    
    topicViewController *temptvc = self.feedViewManager[0];
    self.tvc = temptvc;
    
    // Do any additional setup after loading the view from its nib.

    self.feedScrollView.contentSize = CGSizeMake(320,1200);
    self.videoView.center = CGPointMake(500, 316);
    
    
    [self loadTopics];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fullScreenbutton:(id)sender {
    
    self.videoView.center = CGPointMake(160, 316);
    [self.videoView addSubview:self.vvc.view];
    
    [self.vvc startAnimate];
    [UIView animateWithDuration:0.3 animations:^{
        self.navBarTitle.alpha=0.2;
        self.menuButton.alpha=0.2;
        self.menuButton.hidden=TRUE;
        self.backButtonView.hidden=FALSE;
        
        [self.navBarView setBackgroundColor:RGBA(33,33,33,1)];
    }];
    
    
    
    
}
- (IBAction)backButton:(id)sender {
    self.videoView.center = CGPointMake(500, 316);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.navBarTitle.alpha=1;
        self.menuButton.alpha=1;
        self.menuButton.hidden=FALSE;
        self.backButtonView.hidden=TRUE;
        
        [self.navBarView setBackgroundColor:RGBA(239,78,54,1)];
    }];
    
    [self.vvc returnAnimate];
    
}

- (IBAction)fakeDoneClick:(id)sender {
    
    [UIView
     animateWithDuration:0.3
     delay:0
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
         self.topicHandler.center = CGPointMake(490, self.topicHandler.center.y);
     }
     completion:^(BOOL finished){}];
    
    // Hide Black background
    self.transparentView.frame = CGRectMake(320, 0, 320, 568);
    [UIView animateWithDuration:.3 animations:^{
        self.transparentView.alpha = 0.0;
        ;
    }];

}

-(void) loadTopics{
    
    //adding side menu
    //    [self addChildViewController:self.tvc];
    //   [self.tvc didMoveToParentViewController:self];
    //
    self.topicHandler.center = CGPointMake(500, 284);
    [self.topicHandler addSubview:self.tvc.view];
    //self.fakeDone.layer.zPosition=1;
    [self.topicHandler sendSubviewToBack:self.tvc.view];

    
}
- (IBAction)menuClick:(id)sender {
    
    // Show Black background
    self.transparentView.alpha = 0;
    self.transparentView.frame = CGRectMake(0, 0, 320, 568);
    [UIView animateWithDuration:.3 animations:^{
        self.transparentView.alpha = 0.8;
        ;
    }];

    
    // Slide in the Topic View
    [UIView
     animateWithDuration:0.5
     delay:0
     usingSpringWithDamping:0.8
     initialSpringVelocity:1
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
         self.topicHandler.center = CGPointMake(210, self.topicHandler.center.y);
     }
     completion:^(BOOL finished){}];
    


}
@end
