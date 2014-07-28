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
- (IBAction)fullScreenbutton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIView *navBarView;
@property (weak, nonatomic) IBOutlet UILabel *navBarTitle;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButtonView;
- (IBAction)menuClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property (weak, nonatomic) IBOutlet UIView *topicHandler;
@property (strong,nonatomic) videoViewController *vvc;
@property (strong,nonatomic) topicViewController *tvc;
@property (weak, nonatomic) IBOutlet UIButton *fakeDone;
@property (weak, nonatomic) IBOutlet UIView *transparentView;

- (IBAction)fakeDoneClick:(id)sender;

// video views outlets
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
// End of outlets



-(void) loadTopics;
-(void) loadVideos;
-(void) loadFullscreenVideo;

@end

@implementation feedViewController


float videoNumber;

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
    
    self.feedScrollView.delegate=self;

    self.feedScrollView.contentSize = CGSizeMake(320,1600);
    self.videoView.center = CGPointMake(500, 316);
    
    
    [self loadTopics];
    [self loadVideos];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fullScreenbutton:(UIButton *)sender {
    [self.player1 pause];
    [self.player2 pause];
    [self.player3 pause];
    [self.player4 pause];
    [self.player5 pause];
    //UIView *selectedVideo = sender.tag;
    
    self.videoView.center = CGPointMake(160, 316);
    [self.videoView addSubview:self.vvc.view];
    
    [self.vvc startAnimate];
    self.backButtonView.center= CGPointMake(30,50);
    self.backButtonView.alpha=0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.navBarTitle.alpha=0.2;
        self.menuButton.alpha=0.2;
        self.menuButton.hidden=TRUE;
        self.backButtonView.center= CGPointMake(30,37);
        self.backButtonView.hidden=FALSE;
        self.backButtonView.alpha=1;
        
        
        [self.navBarView setBackgroundColor:RGBA(33,33,33,1)];
    }];
    
    //getting which video to play
     NSLog(@"tag: %d",sender.tag);
    videoNumber = sender.tag;
    
    [self loadFullscreenVideo];

}
- (IBAction)backButton:(id)sender {
    [self.fullPlayer pause];
    self.videoView.center = CGPointMake(500, 316);
    
    self.menuButton.center= CGPointMake(295,50);
    self.menuButton.alpha=0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.navBarTitle.alpha=1;
        self.menuButton.alpha=1;
        self.menuButton.hidden=FALSE;
        self.backButtonView.hidden=TRUE;
        self.menuButton.center= CGPointMake(295,37);
        
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
        self.feedScrollView.alpha=0;
    }];
    
    [self.loader startAnimating];
    
    [self performSelector:@selector(showTempfeed) withObject:nil afterDelay:1];
    
    

}

-(void) showTempfeed{
    self.feedScrollView.contentOffset=CGPointMake(0,0);
    
    [UIView animateWithDuration:.3 animations:^{
        self.feedScrollView.alpha=1;
    }];
    [self.loader stopAnimating];
    
    
}

- (IBAction)test:(UIButton *)sender {
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
    
    [self.player1 pause];
    [self.player2 pause];
    [self.player3 pause];
    
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


-(void) loadVideos{
    
    //loading videos - need to change this into array
    
    self.player1 = [[PBJVideoPlayerController alloc] init];
    self.player1.view.frame = CGRectMake(0, 0, 301, 171);
    
    self.player2 = [[PBJVideoPlayerController alloc] init];
    self.player2.view.frame = CGRectMake(0, 0, 300,170);

    self.player3 = [[PBJVideoPlayerController alloc] init];
    self.player3.view.frame = CGRectMake(0, 0, 300, 170);
    
    self.player4 = [[PBJVideoPlayerController alloc] init];
    self.player4.view.frame = CGRectMake(0, 0, 300, 170);
    
    self.player5 = [[PBJVideoPlayerController alloc] init];
    self.player5.view.frame = CGRectMake(0, 0, 300, 170);
    
    [self.firstView addSubview:self.player1.view];
    [self.secondView addSubview:self.player2.view];
    [self.thirdView addSubview:self.player3.view];
    
    
    
    //first Video
    
    NSURL *url = [NSURL URLWithString:@"http://youtu.be/xxYjJ341_Fg"];
    NSDictionary *videos = [HCYoutubeParser h264videosWithYoutubeURL:url];
    
    //NSString *hdUrl = videos[@"hd720"];
    NSString *mediumUrl = videos[@"medium"];
    
    self.player1.videoPath = mediumUrl;
    [self.player1 playFromBeginning];
    
    //second Video
    
    NSURL *url1 = [NSURL URLWithString:@"http://youtu.be/C8nEN_Ae8Cc"];
    NSDictionary *videos1 = [HCYoutubeParser h264videosWithYoutubeURL:url1];
    
    //NSString *hdUrl = videos[@"hd720"];
    NSString *mediumUrl1 = videos1[@"medium"];
    
    self.player2.videoPath = mediumUrl1;
    
    
    // third video
    NSURL *url2 = [NSURL URLWithString:@"http://youtu.be/ihx0XWhkvmQ"];
    NSDictionary *videos2 = [HCYoutubeParser h264videosWithYoutubeURL:url2];
    
    //NSString *hdUrl = videos[@"hd720"];
    NSString *mediumUrl2 = videos2[@"medium"];
    
    self.player3.videoPath = mediumUrl2;
    
    
    NSLog(@"video frames loaded");
    
}

-(void) loadFullscreenVideo{
    
    self.fullPlayer = [[PBJVideoPlayerController alloc] init];
    self.fullPlayer.view.frame = CGRectMake(10, 10, 300, 170);
    
    if(videoNumber==1){
        self.fullPlayer.videoPath = self.player1.videoPath;}
    if(videoNumber==2){
        self.fullPlayer.videoPath = self.player2.videoPath;}
    if(videoNumber==3){
        self.fullPlayer.videoPath = self.player3.videoPath;}
    
    [self.vvc.videoView addSubview:self.fullPlayer.view];
    [self.fullPlayer playFromCurrentTime];
    
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.fullPlayer.view.frame = CGRectMake(0, 0, 320, 180);

        
    } completion:^(BOOL finished) {
        
    }];

    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Pause the video
    NSLog(@"scrolling");
    
    if(self.feedScrollView.contentOffset.y < 115){
        [self.player1 playFromCurrentTime];
        [self.player2 pause];
    }
    else if (self.feedScrollView.contentOffset.y > 115 && self.feedScrollView.contentOffset.y<320){
        [self.player2 playFromCurrentTime];
        [self.player1 pause];
        [self.player3 pause];
    }
    else if(self.feedScrollView.contentOffset.y > 320 && self.feedScrollView.contentOffset.y <620){
        
        [self.player3 playFromCurrentTime];
        [self.player2 pause];
        
    }
    else{
        [self.player1 pause];
        [self.player2 pause];
        [self.player3 pause];
        
    }

    NSLog(@"offset: %f",self.feedScrollView.contentOffset.y);
    
}
@end
