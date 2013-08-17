//
//  SLDFirstViewController.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/16/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDFirstViewController.h"

@interface SLDFirstViewController ()
-(void) setupAutoLayout;
@end

@implementation SLDFirstViewController


-(id) init {
	self = [super init];
	if (self != nil) {
        self.title = NSLocalizedString(@"Auto Layout", @"Auto Layout");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
 	}
	return self;
}

- (void)dealloc
{
    [_topSlider release];
    [super dealloc];
}


-(void)loadView {
    UIView* newView = [[[UIView alloc] init] autorelease];
    newView.backgroundColor = [UIColor blueColor];
    self.view = newView;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.topSlider = [[[UISlider alloc] init] autorelease];
    self.topSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.topSlider];
    
    self.topLabel = [[[UILabel alloc] init] autorelease];
    self.topLabel.text = @"topLabel";
    self.topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.topLabel];
    
    self.bottomLabel = [[[UILabel alloc] init] autorelease];
    self.bottomLabel.text = @"bottomLabel";
    self.bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bottomLabel];
    
    self.bottomSlider = [[[UISlider alloc] init] autorelease];
    self.bottomSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bottomSlider];

    [self setupAutoLayout];
    
}

-(void) setupAutoLayout {
    NSLayoutConstraint* constraint;
    
    // === top slider ===
    // Size the top slider 70% of the width of the view
    constraint = [NSLayoutConstraint constraintWithItem:self.topSlider
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:0.7
                                               constant:0.0];
    [self.view addConstraint: constraint];
    
    // Position the topslider the standard edge distance away from the top of the view
    constraint = [NSLayoutConstraint constraintWithItem:self.topSlider
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0
                                               constant:20.0];
    [self.view addConstraint: constraint];
    
    // Center the topslider horizontally
    constraint = [NSLayoutConstraint constraintWithItem:self.topSlider
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint: constraint];

    
    // === top label ===

    // Squishy space between top label and top slider - equal spacing?
    constraint = [NSLayoutConstraint constraintWithItem:self.topLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 toItem:self.topSlider
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:20.0];
    [self.view addConstraint: constraint];
    
    // Center top lable horizontally
    constraint = [NSLayoutConstraint constraintWithItem:self.topLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint: constraint];
    
    // === bottom label ===
    // Squishy space between bottom label and top label - equal spacing?
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 toItem:self.topLabel
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:20.0];
    [self.view addConstraint: constraint];
    
    // Center bottom lable horizontally
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint: constraint];
  
    
    
    // Squishy space between bottom label and top label - equal spacing?
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomLabel
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 toItem:self.bottomSlider
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0
                                               constant:-20.0];
    [self.view addConstraint: constraint];
    
    // === bottom slider ===
    // Size the bottom slider 70% of the width of the view
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomSlider
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:0.7
                                               constant:0.0];
    [self.view addConstraint: constraint];
    
    // Position the topslider the standard edge distance away from the top of the view
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomSlider
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:-20.0];
    [self.view addConstraint: constraint];
    
    // Center the topslider horizontally
    constraint = [NSLayoutConstraint constraintWithItem:self.bottomSlider
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint: constraint];


}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"view frame is %@", NSStringFromCGRect(self.view.frame));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
