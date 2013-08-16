//
//  SLDSecondViewController.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/16/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDSecondViewController.h"

@interface SLDSecondViewController ()

@end

@implementation SLDSecondViewController

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
    newView.backgroundColor = [UIColor greenColor];
    self.view = newView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
