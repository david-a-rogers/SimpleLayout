//
//  SLDFirstViewController.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/16/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDSimpleLayout2.h"
#import "SLDSimpleLayout2View.h"

@interface SLDSimpleLayout2 ()

@end

@implementation SLDSimpleLayout2


-(id) init {
	self = [super init];
	if (self != nil) {
        self.title = NSLocalizedString(@"Simple Layout Two", @"Simple Layout Two");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
 	}
	return self;
}

- (void)dealloc
{
    [_layout2View release];
    [super dealloc];
}


-(void)loadView {
    self.layout2View = [[[SLDSimpleLayout2View alloc] init] autorelease];
    self.view = self.layout2View;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
