//
//  MMCGPathShapeView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 04/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGPathShapeView.h"

@implementation MMCGPathShapeView

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
    
    CGContextMoveToPoint(context, 100., 200.);
    
    CGContextAddCurveToPoint(context,
                             50., 120.,
                             250., 120.,
                             200., 200.);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    CGContextStrokePath(context);
    
    
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextMoveToPoint(context, 200., 200.);
    CGContextAddLineToPoint(context, 200., 300.);
    CGContextMoveToPoint(context, 100., 200.);
    CGContextAddLineToPoint(context, 100., 300.);
    
    CGContextStrokePath(context);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 200., 300.);
    CGPathAddLineToPoint(path, NULL, 300., 300.);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextAddPath(context, path);
    
    CGContextStrokePath(context);
    
    CGMutablePathRef arcPath = CGPathCreateMutable();
    CGPathMoveToPoint(arcPath, NULL, 300., 300.);
    CGPathAddCurveToPoint(arcPath,
                          NULL,
                          200., 300.,
                          200., 400.,
                          300., 400.);
    CGContextAddPath(context, arcPath);
    CGContextStrokePath(context);
    
    
    CGMutablePathRef straightPath = CGPathCreateMutable();
    CGPathMoveToPoint(straightPath, NULL, 300., 400.);
    CGPathAddLineToPoint(straightPath, NULL, 100., 400.);
    CGContextAddPath(context, straightPath);
    CGContextStrokePath(context);
    
}

@end
