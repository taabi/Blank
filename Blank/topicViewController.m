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
#import "videoViewController.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface topicViewController ()
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
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
@property (weak, nonatomic) IBOutlet UIView *searchResultsView;
@property (weak, nonatomic) IBOutlet UIScrollView *topicScrollView;
@property (weak, nonatomic) IBOutlet UIView *searchRedditView;
@property (weak, nonatomic) IBOutlet UIView *redditView;
@property (weak, nonatomic) IBOutlet UIImageView *redditImage;
@property (weak, nonatomic) IBOutlet UIImageView *searchRedditImage;
@property (weak, nonatomic) IBOutlet UIView *sitesView;


- (IBAction)onRedditSearch:(id)sender;
- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender;
- (IBAction)hideCount;
- (IBAction)textEdited;



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
    
    self.topicScrollView.contentSize = CGSizeMake(270,600);
    self.topicScrollView.contentOffset = CGPointMake(0,114);
    
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
    
    
    
    self.redditImage.animationImages = [NSArray arrayWithObjects:
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
    [self.redditImage setAnimationRepeatCount: -1];
    self.redditImage.animationDuration = .3;
    [self.redditImage startAnimating];
    
    self.searchRedditImage.animationImages = [NSArray arrayWithObjects:
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
    [self.searchRedditImage setAnimationRepeatCount: -1];
    self.searchRedditImage.animationDuration = .3;
    [self.searchRedditImage startAnimating];
    
    
    
    
    
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
    
    

    
    
    
    // EDIT SEARCH FIELD HERE
    self.searchField.layer.borderWidth = 0;
    self.searchField.layer.borderColor = [[UIColor clearColor] CGColor];
//    self.searchField.backgroundColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.3] CGColor];

    
    
    
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
    [self.searchField resignFirstResponder];
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



- (IBAction)onRedditSearch:(id)sender {
    [UIView animateWithDuration:.1 animations:^{
        self.searchResultsView.hidden = NO;
        //            self.searchResultsView.alpha = 1;
        self.searchResultsView.frame = CGRectMake(0, -30, 320, 90);
    }];
    self.sitesView.hidden = false;
    self.sitesView.alpha = 1;
    self.topicScrollView.scrollEnabled = true;
    [self.view endEditing:YES];
    
    [self.redditView setBackgroundColor:RGBA(238, 238, 238, 1)];
    topicStates[5]=1;
    counter = counter + 1;
    self.countLabel.text = [NSString stringWithFormat:@"%i Selected",counter];
    [self greenView];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.topicScrollView.contentOffset = CGPointMake(0, 0);
        
        // EDIT SEARCH RESULTS DROPSHADOW
        self.searchResultsView.layer.shadowColor = [[UIColor clearColor] CGColor];
        self.searchResultsView.layer.shadowOffset = CGSizeMake(0.0f,5.0f);
        self.searchResultsView.layer.shadowOpacity = 0.0f;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)onTopicTap:(UITapGestureRecognizer *)sender {
    UIView *selectedTopic = sender.view;
    NSLog(@"%d", selectedTopic.tag);
    
    [self greenView];
    
    
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
    
    if ( selectedTopic.tag == 5) {
        if (topicStates[5] == 1)
        {
            self.redditView.backgroundColor = [UIColor whiteColor];
            topicStates[5]=0;
            counter = counter - 1;
            
        } else {
            [self.redditView setBackgroundColor:RGBA(238, 238, 238, 1)];
            topicStates[5]=1;
            counter = counter + 1;
            
        }
    }
    
    //self.countLabel.text = [NSString stringWithFormat:@"%i",
    self.countLabel.text = [NSString stringWithFormat:@"%i Selected",counter];

    
    NSLog(@"And here is my integer: %i", counter);
    //self.hideCount;
}

- (IBAction)onDoneButton:(UIButton *)sender {
    NSLog(@"You're almost done!");

    videoViewController *vvc = [[videoViewController alloc]init];
    feedViewController *fvc =[[feedViewController alloc]init];
    fvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    fvc.feedViewManager=@[self,vvc];
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

- (IBAction)textEdited {
    if ([self.searchField.text isEqual:@"reddit"]) {
        NSLog(@"you found reddit");
        
        [UIView animateWithDuration:.3 animations:^{
            self.searchResultsView.hidden = NO;
//            self.searchResultsView.alpha = 1;
            self.searchResultsView.frame = CGRectMake(0, 60, 320, 86);
            
            // EDIT SEARCH RESULTS DROPSHADOW
            self.searchResultsView.layer.shadowColor = [[UIColor blackColor] CGColor];
            self.searchResultsView.layer.shadowOffset = CGSizeMake(0.0f,2.0f);
            self.searchResultsView.layer.shadowOpacity = 0.5f;
        }];
    } else {
        [UIView animateWithDuration:.3 animations:^{
            self.searchResultsView.hidden = NO;
            //            self.searchResultsView.alpha = 1;
            self.searchResultsView.frame = CGRectMake(0, -30, 320, 90);
            
            // EDIT SEARCH RESULTS DROPSHADOW
            self.searchResultsView.layer.shadowColor = [[UIColor clearColor] CGColor];
            self.searchResultsView.layer.shadowOffset = CGSizeMake(0.0f,5.0f);
            self.searchResultsView.layer.shadowOpacity = 0.0f;
        }];
    }
}

- (void) greenView{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.selectedBarView.frame = CGRectMake(0, 500, 320, 505);
    } completion:^(BOOL finished) {
        
    }];
}


- (void) animateList {
    [UIView animateWithDuration:.2 delay:0 options:0 animations:^{
        self.newsView.center = CGPointMake(135, 71);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:.2 delay:0.1 options:0 animations:^{
        self.sportsView.center = CGPointMake(135, 151);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:.3 delay:0.2 options:0 animations:^{
        self.entertainmentView.center = CGPointMake(135, 231);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:.45 delay:0.3 options:0 animations:^{
        self.comedyView.center = CGPointMake(135, 311);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:.5 delay:0.3 options:0 animations:^{
        self.gamingView.center = CGPointMake(135, 391);
    } completion:^(BOOL finished) {
    }];
    
    
}

    
@end
