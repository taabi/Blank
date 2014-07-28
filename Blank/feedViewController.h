
//  feedViewController.h
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBJVideoPlayerController.h"

@interface feedViewController : UIViewController <UIScrollViewDelegate>
@property (strong,nonatomic) NSArray *feedViewManager;

@property (nonatomic,strong) PBJVideoPlayerController *player1;
@property (nonatomic,strong) PBJVideoPlayerController *player2;
@property (nonatomic,strong) PBJVideoPlayerController *player3;
@property (nonatomic,strong) PBJVideoPlayerController *player4;
@property (nonatomic,strong) PBJVideoPlayerController *player5;
@property (nonatomic,strong) PBJVideoPlayerController *fullPlayer;

@end
