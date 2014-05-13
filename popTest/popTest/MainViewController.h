//
//  MainViewController.h
//  popTest
//
//  Created by Alex on 14-5-13.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import "FlipsideViewController.h"



@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myimageview;
- (IBAction)dfd:(id)sender;

@end
