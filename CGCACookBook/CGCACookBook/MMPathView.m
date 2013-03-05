//
//  MMPathView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 21/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMPathView.h"

@implementation MMPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 10.0;
    path.usesEvenOddFillRule = YES;
    
    [path moveToPoint:CGPointMake(100., 100.)];
    [path addLineToPoint:CGPointMake(50., 50.)];
    [path addLineToPoint:CGPointMake(50.0, 100.)];
    [path closePath];
    
    [[UIColor orangeColor] set];
    [path stroke];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    path2.lineWidth = 10.0;
    path2.usesEvenOddFillRule = YES;
    
    [path2 moveToPoint:CGPointMake(150., 150.)];
    [path2 addLineToPoint:CGPointMake(100, 100.)];
    [path2 addLineToPoint:CGPointMake(100., 150.)];
    [path2 closePath];
    
    [[UIColor redColor] set];
    [path2 stroke];
    
}


@end
