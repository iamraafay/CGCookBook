//
//  MMPathShapeView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 26/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMPathShapeView.h"

#define RADIANS(degree) ((degree * M_PI)/(180))

@implementation MMPathShapeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:10. startAngle:RADIANS(0) endAngle:RADIANS(4*90) clockwise:NO];
    
    [arcPath addCurveToPoint:CGPointMake(self.center.x + 10., self.center.y)
               controlPoint1:CGPointMake(self.center.x + 160., self.center.y + 50.)
               controlPoint2:CGPointMake(self.center.x + 160., self.center.y - 50.)];
    
    [arcPath moveToPoint:CGPointMake(self.center.x, self.center.y - 10.)];
    [arcPath addCurveToPoint:CGPointMake(self.center.x, self.center.y - 10.)
               controlPoint1:CGPointMake(self.center.x - 100 + 50, self.center.y - 150.)
               controlPoint2:CGPointMake(self.center.x + 100 - 50, self.center.y - 150.)];
    
    [arcPath moveToPoint:CGPointMake(self.center.x - 10., self.center.y)];
    [arcPath addCurveToPoint:CGPointMake(self.center.x - 10., self.center.y)
               controlPoint1:CGPointMake(self.center.x - 10. - 150., self.center.y + 50.)
               controlPoint2:CGPointMake(self.center.x - 10. - 150., self.center.y - 50.)];
    
    [arcPath moveToPoint:CGPointMake(self.center.x, self.center.y + 10.)];
    [arcPath addCurveToPoint:CGPointMake(self.center.x, self.center.y + 10.)
               controlPoint1:CGPointMake(self.center.x - 50., self.center.y + 140.)
               controlPoint2:CGPointMake(self.center.x + 50., self.center.y + 140.)];
    
    [[UIColor redColor] set];
    [arcPath stroke];
}


@end
