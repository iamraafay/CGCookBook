//
//  MMCGPathView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 28/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGPathView.h"

@implementation MMCGPathView

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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    
    CGContextMoveToPoint(context, 10., 50.);
    CGContextAddLineToPoint(context, 250., 50.);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextMoveToPoint(context, 10., 100.);
    CGContextAddLineToPoint(context, 250., 100.);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 60., 200.);
    
    CGPoint points[] = {
        CGPointMake(60., 200.),
        CGPointMake(95., 150.),
        CGPointMake(130., 200.),
        CGPointMake(60., 200.),
        CGPointMake(74., 180.),
    };
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextAddLines(context, points, sizeof(points)/sizeof(points[0]));
    CGContextStrokePath(context);
    
    CGPoint rightAngPoint[] = {
        CGPointMake(150., 200.),
        CGPointMake(200., 200.),
        CGPointMake(150., 150.),
        CGPointMake(150., 202.),
    };
    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextAddLines(context, rightAngPoint, sizeof(rightAngPoint)/sizeof(rightAngPoint[0]));
    CGContextStrokePath(context);
    
}


@end
