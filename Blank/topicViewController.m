//
//  topicViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "topicViewController.h"
#import "welcomeViewController.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface topicViewController ()
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *newsView;
@property (weak, nonatomic) IBOutlet UIView *sportsView;
@property (weak, nonatomic) IBOutlet UIView *entertainmentView;
@property (weak, nonatomic) IBOutlet UIView *comedyView;
@property (weak, nonatomic) IBOutlet UIView *gamingView;
@property (weak, nonatomic) IBOutlet UIView *selectedBarView;
@property (weak, nonatomic) IBOutlet UIView *topicView;

- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender;

- (void) topicCount;

@end

@implementation topicViewController

NSInteger topicStates[10];

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
    
    
    for (NSInteger i = 0; i < 10; i++){
        topicStates[i] = 0;
    }
    
    
    // EDIT VIEW DROPSHADOW HERE
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds];
    self.view.clipsToBounds = NO;
    self.view.layer.masksToBounds = NO;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.view.layer.shadowOffset = CGSizeMake(-5.0f,5.0f);
    self.view.layer.shadowOpacity = 0.5f;
    self.view.layer.shadowPath = shadowPath.CGPath;
    
    // EDIT SEARCH BAR HERE
    self.searchBar.layer.borderWidth = 0;
    self.searchBar.layer.borderColor = [[UIColor clearColor] CGColor];
    self.searchBar.backgroundColor = [UIColor blackColor];
//    self.searchBar.barTintColor = [UIColor clearColor];
//    [self.searchBar setOpaque:NO];
    
    
    // SET PLACEMENT OF SELECTEDBAR TAB
    self.selectedBarView.frame = CGRectMake(0, 600, 120, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    // HIDES KEYBOARD WHEN BG IS TAPPED
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.searchBar resignFirstResponder];
}

    // TAP ACTION   --- add a method 'whichTopic' to detect which topic is being tapped on or off.
- (void)tapGestureDetected:(UITapGestureRecognizer *)recognizer {
    UIGestureRecognizerState state = [recognizer state];
//    self.newsView.backgroundColor = [UIColor yellowColor];

    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"something");
        self.newsView.backgroundColor = [UIColor redColor];
    } else {
        NSLog(@"doh!");
        self.gamingView.backgroundColor = [UIColor blueColor];
    }
}

- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender {
    UIView *selectedTopic = sender.view;
    NSLog(@"%d", selectedTopic.tag);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.selectedBarView.frame = CGRectMake(0, 500, 320, 505);
    } completion:^(BOOL finished) {
        
    }];
    
    
    if (selectedTopic.tag == 0) {
        if (topicStates[0] == 1)
        {
            self.newsView.backgroundColor = [UIColor whiteColor];
            topicStates[0]=0;
        } else {
            [self.newsView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[0]=1;
        }
    }
    
    if (selectedTopic.tag == 1) {
        if (topicStates[1] == 1)
        {
        self.sportsView.backgroundColor = [UIColor whiteColor];
            topicStates[1]=0;
        } else {
         [self.sportsView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[1]=1;
            }
    }

    if ( selectedTopic.tag == 2)
    {
        if(topicStates[2] == 1)
        {
            self.entertainmentView.backgroundColor = [UIColor whiteColor];
            topicStates[2]=0;
        } else {
         [self.entertainmentView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[2]=1;
                }
    }

    if ( selectedTopic.tag == 3) {
        if (topicStates[3] == 1)
        {
            self.comedyView.backgroundColor = [UIColor whiteColor];
            topicStates[3]=0;
        } else {
        [self.comedyView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[3]=1;
                }
    }

    if ( selectedTopic.tag == 4) {
        if (topicStates[4] == 1)
        {
            self.gamingView.backgroundColor = [UIColor whiteColor];
            topicStates[4]=0;
        } else {
           [self.gamingView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[4]=1;
        }
    }
}

- (IBAction)onDoneButton:(UIButton *)sender {
    NSLog(@"You're almost done!");
    
//    welcomeViewController *tempvc =[[welcomeViewController alloc]init];
//    
//    [tempvc showFeedView];
    

}

- (void) topicCount {
    NSLog(@"counting...");
    
}

@end
