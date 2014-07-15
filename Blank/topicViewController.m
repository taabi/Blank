//
//  topicViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "topicViewController.h"

@interface topicViewController ()
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *newsView;
@property (weak, nonatomic) IBOutlet UIView *sportsView;
@property (weak, nonatomic) IBOutlet UIView *entertainmentView;
@property (weak, nonatomic) IBOutlet UIView *comedyView;
@property (weak, nonatomic) IBOutlet UIView *gamingView;
@property (weak, nonatomic) IBOutlet UIView *selectedBarView;

- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender;
- (IBAction)onDoneButton:(UIButton *)sender;

@end

@implementation topicViewController

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
    
//    // CREATE & CONFIGURE NEWS TAP GESTURE
//    UITapGestureRecognizer *newsTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
//    [newsTapGestureRecognizer setDelegate:self];
//    [self.newsView addGestureRecognizer:newsTapGestureRecognizer];
//    
//    // CREATE & CONFIGURE SPORTS TAP GESTURE
//    UITapGestureRecognizer *sportsTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
//    [sportsTapGestureRecognizer setDelegate:self];
//    [self.sportsView addGestureRecognizer:sportsTapGestureRecognizer];
//    
//    // CREATE & CONFIGURE ENTERTAINMENT TAP GESTURE
//    UITapGestureRecognizer *entertainmentTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
//    [entertainmentTapGestureRecognizer setDelegate:self];
//    [self.entertainmentView addGestureRecognizer:entertainmentTapGestureRecognizer];
//    
//    // CREATE & CONFIGURE NEWS COMEDY GESTURE
//    UITapGestureRecognizer *comedyTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
//    [comedyTapGestureRecognizer setDelegate:self];
//    [self.comedyView addGestureRecognizer:comedyTapGestureRecognizer];
//    
//    // CREATE & CONFIGURE NEWS TAP GESTURE
//    UITapGestureRecognizer *gamingTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
//    [gamingTapGestureRecognizer setDelegate:self];
//    [self.gamingView addGestureRecognizer:gamingTapGestureRecognizer];
    
    
    
    
    // EDIT VIEW DROPSHADOW HERE
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds];
//    self.view.clipsToBounds = NO;
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
        self.selectedBarView.frame = CGRectMake(0, 488, 320, 505);
    } completion:^(BOOL finished) {
        
    }];
    
    
    if ( selectedTopic.tag == 0) {
        if (self.newsView.backgroundColor == [UIColor blueColor])
        {
            self.newsView.backgroundColor = [UIColor whiteColor];
        } else {
            self.newsView.backgroundColor = [UIColor blueColor];
        }
    }
    
    if ( selectedTopic.tag == 1) {
        if (self.sportsView.backgroundColor == [UIColor blueColor])
        {
        self.sportsView.backgroundColor = [UIColor whiteColor];
        } else {
        self.sportsView.backgroundColor = [UIColor blueColor];
            }
    }

    if ( selectedTopic.tag == 2)
    {
        if(self.entertainmentView.backgroundColor == [UIColor blueColor])
        {
            self.entertainmentView.backgroundColor = [UIColor whiteColor];
        } else {
        self.entertainmentView.backgroundColor = [UIColor blueColor];
                }
    }

    if ( selectedTopic.tag == 3) {
        if (self.comedyView.backgroundColor == [UIColor blueColor])
        {
            self.comedyView.backgroundColor = [UIColor whiteColor];
        } else {
        self.comedyView.backgroundColor = [UIColor blueColor];
                }
    }

    if ( selectedTopic.tag == 4) {
        if (self.gamingView.backgroundColor == [UIColor blueColor])
        {
            self.gamingView.backgroundColor = [UIColor whiteColor];
        } else {
            self.gamingView.backgroundColor = [UIColor blueColor];
        }
    }
}

- (IBAction)onDoneButton:(UIButton *)sender {
    NSLog(@"You're almost done!");
}

@end
