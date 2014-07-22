//
//  topicViewController.m
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "topicViewController.h"
#import "welcomeViewController.h"
#import "feedViewController.h"

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
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UIImageView *sportsImage;
@property (weak, nonatomic) IBOutlet UIImageView *entertainmentImage;
@property (weak, nonatomic) IBOutlet UIImageView *comedyImage;
@property (weak, nonatomic) IBOutlet UIImageView *gamingImage;


- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender;
- (IBAction)hideCount;

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
    
    self.newsImage.animationImages = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"5A.png"],
            [UIImage imageNamed:@"5B.png"],
            [UIImage imageNamed:@"5C.png"],
            [UIImage imageNamed:@"5D.png"],
            [UIImage imageNamed:@"5E.png"],
            [UIImage imageNamed:@"5F.png"],
            [UIImage imageNamed:@"5G.png"],
            [UIImage imageNamed:@"5H.png"],
            [UIImage imageNamed:@"5I.png"],
            [UIImage imageNamed:@"5J.png"],
            [UIImage imageNamed:@"5K.png"],
            [UIImage imageNamed:@"5L.png"],
            [UIImage imageNamed:@"5M.png"],
            nil];
    [self.newsImage setAnimationRepeatCount: -1];
    self.newsImage.animationDuration = 1;
    [self.newsImage startAnimating];
    
    
    self.sportsImage.animationImages = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"1A.png"],
            [UIImage imageNamed:@"1B.png"],
            [UIImage imageNamed:@"1C.png"],
            [UIImage imageNamed:@"1D.png"],
            [UIImage imageNamed:@"1E.png"],
            [UIImage imageNamed:@"1F.png"],
            [UIImage imageNamed:@"1G.png"],
            [UIImage imageNamed:@"1H.png"],
            nil];
    [self.sportsImage setAnimationRepeatCount: -1];
    self.sportsImage.animationDuration = .4;
    [self.sportsImage startAnimating];
    
    
    self.entertainmentImage.animationImages = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"2A.png"],
            [UIImage imageNamed:@"2B.png"],
            [UIImage imageNamed:@"2C.png"],
            [UIImage imageNamed:@"2D.png"],
            [UIImage imageNamed:@"2E.png"],
            [UIImage imageNamed:@"2F.png"],
            [UIImage imageNamed:@"2G.png"],
            nil];
    [self.entertainmentImage setAnimationRepeatCount: -1];
    self.entertainmentImage.animationDuration = .3;
    [self.entertainmentImage startAnimating];
    
    
    self.comedyImage.animationImages = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"4A.png"],
            [UIImage imageNamed:@"4B.png"],
            [UIImage imageNamed:@"4C.png"],
            [UIImage imageNamed:@"4D.png"],
            [UIImage imageNamed:@"4E.png"],
            [UIImage imageNamed:@"4F.png"],
            [UIImage imageNamed:@"4G.png"],
            [UIImage imageNamed:@"4H.png"],
            [UIImage imageNamed:@"4I.png"],
            nil];
    [self.comedyImage setAnimationRepeatCount: -1];
    self.comedyImage.animationDuration = .8;
    [self.comedyImage startAnimating];
    
    
    self.gamingImage.animationImages = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"3A.png"],
            [UIImage imageNamed:@"3B.png"],
            [UIImage imageNamed:@"3C.png"],
            [UIImage imageNamed:@"3D.png"],
            [UIImage imageNamed:@"3E.png"],
            [UIImage imageNamed:@"3F.png"],
            [UIImage imageNamed:@"3G.png"],
            [UIImage imageNamed:@"3H.png"],
            [UIImage imageNamed:@"3I.png"],
            [UIImage imageNamed:@"3J.png"],
            nil];
    [self.gamingImage setAnimationRepeatCount: -1];
    self.gamingImage.animationDuration = .3;
    [self.gamingImage startAnimating];
    
    
    
    
    
    for (NSInteger i = 0; i < 10; i++){
        topicStates[i] = 0;
    }
    
    counter = 0;
    
    
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
            counter = counter - 1;
            
        } else {
            [self.newsView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[0]=1;
            counter = counter + 1;

        }
    }
    
    if (selectedTopic.tag == 1) {
        if (topicStates[1] == 1)
        {
            self.sportsView.backgroundColor = [UIColor whiteColor];
            topicStates[1]=0;
            counter = counter - 1;

        } else {
            [self.sportsView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[1]=1;
            counter = counter + 1;

            }
    }

    if ( selectedTopic.tag == 2)
    {
        if(topicStates[2] == 1)
        {
            self.entertainmentView.backgroundColor = [UIColor whiteColor];
            topicStates[2]=0;
            counter = counter - 1;

        } else {
            [self.entertainmentView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[2]=1;
            counter = counter + 1;

                }
    }

    if ( selectedTopic.tag == 3) {
        if (topicStates[3] == 1)
        {
            self.comedyView.backgroundColor = [UIColor whiteColor];
            topicStates[3]=0;
            counter = counter - 1;

        } else {
        [self.comedyView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[3]=1;
            counter = counter + 1;

                }
    }

    if ( selectedTopic.tag == 4) {
        if (topicStates[4] == 1)
        {
            self.gamingView.backgroundColor = [UIColor whiteColor];
            topicStates[4]=0;
            counter = counter - 1;

        } else {
           [self.gamingView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[4]=1;
            counter = counter + 1;

        }
    }
    self.countLabel.text = [NSString stringWithFormat:@"%i Selected",counter];
    
    NSLog(@"And here is my integer: %i", counter);
    self.hideCount;
}

- (IBAction)onDoneButton:(UIButton *)sender {
    NSLog(@"You're almost done!");
    
//  welcomeViewController *tempvc =[[welcomeViewController alloc]init];
//   
//   [tempvc showFeedView];

    
    feedViewController *fvc =[[feedViewController alloc]init];
    fvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:fvc animated:YES completion:nil];

}

- (IBAction) hideCount {
    if (counter == 0) {
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.selectedBarView.frame = CGRectMake(0, 570, 320, 505);
        } completion:^(BOOL finished) {
        }];
    }
}
    
@end
