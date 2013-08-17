//
//  SLDThirdViewController.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/16/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDThirdViewController.h"
#import "UIView+SimpleLayout.h"

@interface SLDThirdViewController ()

@end

@implementation SLDThirdViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
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
    [self.view addSubview:self.topSlider];
    
    self.topLabel = [[[UILabel alloc] init] autorelease];
    self.topLabel.text = @"topLabel";
    [self.topLabel sizeToFit];
    [self.view addSubview:self.topLabel];
    
    self.bottomLabel = [[[UILabel alloc] init] autorelease];
    self.bottomLabel.text = @"bottomLabel";
    [self.bottomLabel sizeToFit];
    [self.view addSubview:self.bottomLabel];
    
    self.bottomSlider = [[[UISlider alloc] init] autorelease];
    [self.view addSubview:self.bottomSlider];
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"view frame is %@", NSStringFromCGRect(self.view.frame));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillLayoutSubviews {
    // === topSlider ===
    self.topSlider.width = self.view.width * .70;
    self.topSlider.centerX = self.view.centerX;
    self.topSlider.top = self.view.top + kSLEdgeStandardSpace;
    
    // === bottomSlider ===
    self.bottomSlider.width = self.view.width * .70;
    self.bottomSlider.centerX = self.view.centerX;
    self.bottomSlider.bottom = self.view.bottom - kSLEdgeStandardSpace;
    
    CGFloat availableSpace = self.bottomSlider.top - self.topSlider.bottom;
    availableSpace -= self.topLabel.height;
    availableSpace -= self.bottomLabel.height;
    
    CGFloat oneSpace = availableSpace / 3;
    
    // === topLabel ===
    self.topLabel.top = self.topSlider.bottom + oneSpace;
    self.topLabel.centerX = self.view.centerX;
    
    // === bottomLabel ===
    self.bottomLabel.top = self.topLabel.bottom + oneSpace;
    self.bottomLabel.centerX = self.view.centerX;
}

@end
