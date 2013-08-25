//
//  SLDSimpleLayout2View.m
//  SimpleLayoutDemo
//
//  Created by David A. Rogers on 8/25/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "SLDSimpleLayout2View.h"
#import "UIView+SimpleLayout.h"

@implementation SLDSimpleLayout2View

- (id)init
{
    self = [super init];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)dealloc
{
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_textView release];
    [super dealloc];
}
-(void) configureView {
    self.backgroundColor = [UIColor lightGrayColor];
    self.button1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [self.button1 sizeToFit];
    [self addSubview: self.button1];
    
    self.button2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [self.button2 sizeToFit];
    [self addSubview: self.button2];

    self.button3 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.button3 setTitle:@"Button 3" forState:UIControlStateNormal];
    [self.button3 sizeToFit];
    [self addSubview: self.button3];

    self.textView = [[UITextView alloc] init];
    self.textView.editable = NO;
    [self fillTextView];
    [self addSubview: self.textView];
}

-(CGFloat) maxButtonWidth {
    CGFloat maxWidth = 0;
    maxWidth = MAX(maxWidth, self.button1.width);
    maxWidth = MAX(maxWidth, self.button2.width);
    maxWidth = MAX(maxWidth, self.button3.width);
    return maxWidth;
}

/*
  Layout the buttons at the top - equal sized with the proper gap between.
  Layout the rest of the space to the text view.
 */
-(void) doPortraitLayout {
    // We're going to mess with the button sizes - so make sure they
    // start at they're intrinsic sizes.
    [self.button1 sizeToFit];
    [self.button2 sizeToFit];
    [self.button3 sizeToFit];
    
    // Calculate the widest button and make them all that width
    CGFloat buttonWidth = [self maxButtonWidth];
    
    self.button1.width = buttonWidth;
    self.button2.width = buttonWidth;
    self.button3.width = buttonWidth;
    
    // Calculate how much space to leave between the buttons
    CGFloat internalButtonSpace = self.width - (3 * buttonWidth) - (2 * kSLEdgeStandardSpace);

    // Button 1 goes in the top left corner
    self.button1.top = self.top + kSLEdgeStandardSpace;
    self.button1.left = self.left + kSLEdgeStandardSpace;
    
    // Align the top of button2 to the top of button 1
    self.button2.top = self.button1.top;
    self.button2.left = self.button1.right + (internalButtonSpace / 2);
    
    // Align the top of button3 to the top of button 1
    self.button3.top = self.button1.top;
    self.button3.left = self.button2.right + (internalButtonSpace / 2);
    
    // Leave the rest of the space for the textview
    self.textView.top = self.button1.bottom + kSLInterStandardSpace;
    self.textView.left = self.left + kSLEdgeStandardSpace;
    self.textView.width = self.width - (2 * kSLEdgeStandardSpace);
    self.textView.height = self.bottom - self.textView.top - kSLEdgeStandardSpace;
}

/*
  Layout the buttons on the left side.  Put equal space between the buttons.
  Leave the rest of the space on the right to the text view.
 */
- (void) doLandscapeLayout {
    // We're going to mess with the button sizes - so make sure they
    // start at they're intrinsic sizes.
    [self.button1 sizeToFit];
    [self.button2 sizeToFit];
    [self.button3 sizeToFit];

    // Calculate the widest button and make them all that width
    CGFloat buttonWidth = [self maxButtonWidth];
    
    self.button1.width = buttonWidth;
    self.button2.width = buttonWidth;
    self.button3.width = buttonWidth;

    // Calculate how much space to leave between the buttons
    CGFloat internalButtonSpace = self.height - (3 * self.button1.height) - (2 * kSLEdgeStandardSpace);
    
    // Button 1 goes in the top left corner
    self.button1.top = self.top + kSLEdgeStandardSpace;
    self.button1.left = self.left + kSLEdgeStandardSpace;

    // Button 2 goes under button 1
    self.button2.top = self.button1.bottom + internalButtonSpace / 2;
    self.button2.left = self.button1.left;
    
    // Button 3 goes under button 2
    self.button3.top = self.button2.bottom + internalButtonSpace / 2;
    self.button3.left = self.button1.left;
    
    // The rest of the space goes to the textview
    self.textView.top = self.top + kSLEdgeStandardSpace;
    self.textView.left = self.button1.right + kSLInterStandardSpace;
    self.textView.height = self.height - (2 * kSLEdgeStandardSpace);
    self.textView.width = self.right - self.textView.left - kSLEdgeStandardSpace;
}

-(void)layoutSubviews {
    UIInterfaceOrientation  orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown) {
        [self doPortraitLayout];
    }
    else {
        [self doLandscapeLayout];
    }
}

-(void) fillTextView {
    self.textView.text =
    @"Lorem ipsum dolor sit amet, consectetur adipiscing "
    "elit. Pellentesque vel ipsum gravida risus tincidunt tristique. Mauris "
    "volutpat dui eu tempus mattis. Suspendisse eget nisl justo. Vestibulum "
    "ullamcorper scelerisque risus interdum rutrum. Curabitur semper, massa "
    "at elementum porta, neque nunc vehicula ligula, quis varius metus "
    "mauris et lectus. Mauris eu risus ac nisi aliquam tempor vitae non "
    "libero. Nulla eu risus at nunc placerat bibendum in et turpis. Sed nec "
    "pharetra nulla, nec ultricies eros. Nunc dictum semper odio sed "
    "ullamcorper. Aliquam pellentesque risus sed lorem sagittis, ut aliquam "
    "augue tempor. Sed dictum urna vel ullamcorper ultrices. Class aptent "
    "taciti sociosqu ad litora torquent per conubia nostra, per inceptos "
    "himenaeos. Integer vestibulum pharetra arcu. Morbi bibendum justo "
    "lorem, sed aliquam nulla tincidunt eget. Donec nec luctus arcu, id "
    "fermentum sem. Morbi malesuada tempor elit eu lacinia."
    @"\n\nLorem ipsum dolor sit amet, consectetur adipiscing "
    "elit. Pellentesque vel ipsum gravida risus tincidunt tristique. Mauris "
    "volutpat dui eu tempus mattis. Suspendisse eget nisl justo. Vestibulum "
    "ullamcorper scelerisque risus interdum rutrum. Curabitur semper, massa "
    "at elementum porta, neque nunc vehicula ligula, quis varius metus "
    "mauris et lectus. Mauris eu risus ac nisi aliquam tempor vitae non "
    "libero. Nulla eu risus at nunc placerat bibendum in et turpis. Sed nec "
    "pharetra nulla, nec ultricies eros. Nunc dictum semper odio sed "
    "ullamcorper. Aliquam pellentesque risus sed lorem sagittis, ut aliquam "
    "augue tempor. Sed dictum urna vel ullamcorper ultrices. Class aptent "
    "taciti sociosqu ad litora torquent per conubia nostra, per inceptos "
    "himenaeos. Integer vestibulum pharetra arcu. Morbi bibendum justo "
    "lorem, sed aliquam nulla tincidunt eget. Donec nec luctus arcu, id "
    "fermentum sem. Morbi malesuada tempor elit eu lacinia."
    ;
}

@end
