//
//  MainViewController.m
//  popTest
//
//  Created by Alex on 14-5-13.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import "MainViewController.h"
#import "POP.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.myimageview setHidden:YES];
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)] ;
    
    [rotationRecognizer setDelegate:self];
       [self.view addGestureRecognizer:rotationRecognizer];

    
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)] ;
  
    [panRecognizer setMinimumNumberOfTouches:1];
    
    [panRecognizer setMaximumNumberOfTouches:1];
    
    [panRecognizer setDelegate:self];
   
    [self.view addGestureRecognizer:panRecognizer];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    
   
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (IBAction)dfd:(id)sender {
    
    
    POPSpringAnimation *anim = [POPSpringAnimation animation];
    [self.myimageview pop_addAnimation:anim forKey:@"myKey"];
}


- (void)rotate:(UIPanGestureRecognizer*)recognizer
{
    NSLog(@"hello world");
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    positionAnimation.dynamicsTension = 5;
    positionAnimation.dynamicsFriction = 5.0f;
    positionAnimation.springBounciness = 20.0f;
    [self.myimageview.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    sizeAnimation.springBounciness = 1.0f;
    sizeAnimation.dynamicsFriction = 1.0f;
    [self.myimageview.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
} 


-(void)move:(UIPanGestureRecognizer*)recognizer{
    
    
    NSLog(@"hello world");
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    positionAnimation.dynamicsTension = 5;
    positionAnimation.dynamicsFriction = 5.0f;
    positionAnimation.springBounciness = 20.0f;
    [self.myimageview.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    sizeAnimation.springBounciness = 1.0f;
    sizeAnimation.dynamicsFriction = 1.0f;
    [self.myimageview.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
}


@end
