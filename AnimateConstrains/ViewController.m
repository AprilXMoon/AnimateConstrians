//
//  ViewController.m
//  AnimateConstrains
//
//  Created by April Lee on 2015/12/2.
//  Copyright © 2015年 april. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleViewTopConstraint;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *downSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(hideTitleView)];
    downSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    UISwipeGestureRecognizer *upSwipeGestureRecongnizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showTitleView)];
    upSwipeGestureRecongnizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.contentView addGestureRecognizer:downSwipeGestureRecognizer];
    [self.contentView addGestureRecognizer:upSwipeGestureRecongnizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideTitleViewButtonPressed:(id)sender {
    
    [self hideTitleView];
}

- (IBAction)showTitleViewButtonPressed:(id)sender {
    [self replacetopConstraintOnView:self.titleView withConstant:0];
    [self animateConstraints];
}


#pragma mark - reference Apple
- (void)animateConstraints
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)hideTitleView
{
    self.titleViewTopConstraint.constant = -70;
    [self animateConstraints];
}

- (void)showTitleView
{
    self.titleViewTopConstraint.constant = 0;
    [self animateConstraints];
}


#pragma mark - reference King's Cocoa
- (void)replacetopConstraintOnView:(UIView *)view withConstant:(float)constant
{
    [self.view.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ((constraint.firstItem == view) && (constraint.firstAttribute == NSLayoutAttributeTop)) {
            constraint.constant = constant;
        }
    }];
}


@end
