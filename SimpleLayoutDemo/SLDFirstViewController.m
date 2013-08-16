//
//  SLDFirstViewController.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/16/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDFirstViewController.h"

@interface SLDFirstViewController ()

@end

@implementation SLDFirstViewController


-(id) init {
	self = [super init];
	if (self != nil) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
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
