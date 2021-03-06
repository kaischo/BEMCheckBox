//
//  BEMPathManager.m
//  CheckBox
//
//  Created by Bobo on 9/19/15.
//  Copyright (c) 2015 Boris Emorine. All rights reserved.
//

#import "BEMPathManager.h"

@implementation BEMPathManager

#pragma mark Paths

- (UIBezierPath *)pathForBox {
    UIBezierPath* path;
    switch (self.boxType) {
        case BEMBoxTypeSquare:
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size, self.size) cornerRadius:3.0];
            [path applyTransform:CGAffineTransformRotate(CGAffineTransformIdentity, M_PI * 2.5)];
            [path applyTransform:CGAffineTransformMakeTranslation(self.size, 0)];
            break;
            
        case BEMBoxTypeHexagon:
            path = [[UIBezierPath alloc] init];
            
            //CGFloat a = self.size/(1+2*cosf(30*M_PI/180));
            //CGFloat x = (self.size-a)/2;
            
            CGFloat x = self.size*0.25;
            
            [path moveToPoint:CGPointMake(x, self.size*0.1)];
            [path addLineToPoint:CGPointMake(self.size-x, self.size*0.1)];
            [path addLineToPoint:CGPointMake(self.size, self.size*0.5)];
            [path addLineToPoint:CGPointMake(self.size-x, self.size*0.9)];
            [path addLineToPoint:CGPointMake(x, self.size*0.9)];
            [path addLineToPoint:CGPointMake(0, self.size*0.5)];
            [path closePath];
            break;
            
        case BEMBoxTypeTiltedHexagon:
            path = [[UIBezierPath alloc] init];
            
            //CGFloat a = self.size/(1+2*cosf(30*M_PI/180));
            //CGFloat x = (self.size-a)/2;
            
            CGFloat y = self.size*0.25;
            
            [path moveToPoint:CGPointMake(self.size*0.5, 0)];
            [path addLineToPoint:CGPointMake(self.size*0.9, y)];
            [path addLineToPoint:CGPointMake(self.size*0.9, self.size-y)];
            [path addLineToPoint:CGPointMake(self.size*0.5, self.size)];
            [path addLineToPoint:CGPointMake(self.size*0.1, self.size-y)];
            [path addLineToPoint:CGPointMake(self.size*0.1, y)];
            [path closePath];
            break;
            
        default: {
            CGFloat radius = self.size / 2;
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.size / 2, self.size / 2)
                                                  radius: radius
                                              startAngle: - M_PI / 4
                                                endAngle:  2 * M_PI - M_PI / 4
                                               clockwise:YES];
        }
            break;
    }
    return path;
}

- (UIBezierPath *)pathForCheckMark {
    UIBezierPath* checkMarkPath = [UIBezierPath bezierPath];
    
    [checkMarkPath moveToPoint: CGPointMake(self.size/3.1578, self.size/2)];
    [checkMarkPath addLineToPoint: CGPointMake(self.size/2.0618, self.size/1.57894)];
    [checkMarkPath addLineToPoint: CGPointMake(self.size/1.3953, self.size/2.7272)];
    
    if (self.boxType == BEMBoxTypeSquare) {
        // If we use a square box, the check mark should be a little bit bigger
        [checkMarkPath applyTransform:CGAffineTransformMakeScale(1.5, 1.5)];
        [checkMarkPath applyTransform:CGAffineTransformMakeTranslation(-self.size/4, -self.size/4)];
    }
    
    return checkMarkPath;
}

- (UIBezierPath *)pathForLongCheckMark {
    UIBezierPath* checkMarkPath = [UIBezierPath bezierPath];
    
    [checkMarkPath moveToPoint: CGPointMake(self.size/3.1578, self.size/2)];
    [checkMarkPath addLineToPoint: CGPointMake(self.size/2.0618, self.size/1.57894)];
    
    if (self.boxType == BEMBoxTypeSquare) {
        // If we use a square box, the check mark should be a little bit bigger
        [checkMarkPath addLineToPoint: CGPointMake(self.size/1.2053, self.size/4.5272)];
        [checkMarkPath applyTransform:CGAffineTransformMakeScale(1.5, 1.5)];
        [checkMarkPath applyTransform:CGAffineTransformMakeTranslation(-self.size/4, -self.size/4)];
    } else {
        [checkMarkPath addLineToPoint: CGPointMake(self.size/1.1553, self.size/5.9272)];
    }
    
    return checkMarkPath;
}

- (UIBezierPath *)pathForFlatCheckMark {
    UIBezierPath* flatCheckMarkPath = [UIBezierPath bezierPath];
    [flatCheckMarkPath moveToPoint: CGPointMake(self.size/4, self.size/2)];
    [flatCheckMarkPath addLineToPoint: CGPointMake(self.size/2, self.size/2)];
    [flatCheckMarkPath addLineToPoint: CGPointMake(self.size/1.2, self.size/2)];
    
    return flatCheckMarkPath;
}

@end
