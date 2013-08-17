//
//  UIView+SimpleLayout.h
//  PlayAlongPlayer
//
//  Created by David A. Rogers on 8/13/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat kSLEdgeStandardSpace;
extern const CGFloat kSLInterStandardSpace;


@interface UIView (SimpleLayout)

- (void) setLeft: (CGFloat) left;
- (CGFloat) left;
- (void) setRight: (CGFloat) right;
- (CGFloat) right;
- (void) setTop: (CGFloat) top;
- (CGFloat) top;
- (void) setBottom: (CGFloat) bottom;
- (CGFloat) bottom;
- (void) setCenterX: (CGFloat) centerX;
- (CGFloat) centerX;
- (void) setCenterY: (CGFloat) centerY;
- (CGFloat) centerY;
- (void) setWidth: (CGFloat) width;
- (CGFloat) width;
- (void) setHeight: (CGFloat) height;
- (CGFloat) height;

@end
