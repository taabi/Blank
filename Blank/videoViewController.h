//
//  videoViewController.h
//  Blank
//
//  Created by taabi on 7/22/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBJVideoPlayerController.h"

@interface videoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *videoInfoView;
@property (weak, nonatomic) IBOutlet UIView *videoView;

- (void) startAnimate;
- (void) returnAnimate;

@end
