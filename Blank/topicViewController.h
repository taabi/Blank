//
//  topicViewController.h
//  Blank
//
//  Created by taabi on 7/11/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import <UIKit/UIKit.h>

int counter;

@interface topicViewController : UIViewController <UIGestureRecognizerDelegate>
- (IBAction) onDoneButton:(UIButton *)sender;
- (void) greenView;
- (void) animateList;

//{
//    UISearchBar *searchBar;
//}
//
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//- (IBAction)searchDoneEditing:(id)sender;
//- (IBAction)backgoundTap:(id)sender;

@end
