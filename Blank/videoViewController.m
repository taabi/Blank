//
//  videoViewController.m
//  Blank
//
//  Created by taabi on 7/22/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "videoViewController.h"

@interface videoViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIView *videoTextView;

@end

@implementation videoViewController

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
    //[self startAnimate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startAnimate{
    NSLog(@"test");
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.videoView.frame = CGRectMake(0, 0, 320,180);
        self.videoTextView.frame = CGRectMake(0, 180, 320,330);
 
    } completion:^(BOOL finished) {

    }];
}
-(void) returnAnimate{
    self.videoView.frame = CGRectMake(10, 10, 300,169);
    self.videoTextView.frame = CGRectMake(9, 180, 300,120);
    
}

@end
