//
//  UIView+SimpleLayout.m
//  PlayAlongPlayer
//
//  Created by David A. Rogers on 8/13/13.
//  Copyright (c) 2013 David Rogers. All rights reserved.
//

#import "UIView+SimpleLayout.h"

const CGFloat kSLEdgeStandardSpace = 20.0;
const CGFloat kSLInterStandardSpace = 8.0;


@implementation UIView (SimpleLayout)

- (void) setLeft: (CGFloat) left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat) left {
    return self.frame.origin.x;
}

- (void) setRight: (CGFloat) right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setTop: (CGFloat) top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat) top {
    return self.frame.origin.y;
}

- (void) setBottom: (CGFloat) bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setCenterX: (CGFloat) centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat) centerX {
    return self.center.x;
}

- (void) setCenterY: (CGFloat) centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat) centerY {
    return self.center.y;
}

- (void) setWidth: (CGFloat) width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (void) setHeight: (CGFloat) height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat) height {
    return self.frame.size.height;
}



@end
