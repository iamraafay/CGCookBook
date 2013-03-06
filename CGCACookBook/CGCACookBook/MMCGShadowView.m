//
//  MMCGShadowView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 06/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGShadowView.h"

@implementation MMCGShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    

    CGSize size = CGSizeMake(5., 10.);
    CGRect boundedRect = CGRectMake(20., 20., 60., 60.);
    
    //CGContextSetShadowWithColor(context, size, 1.0, [[UIColor grayColor] CGColor]);
    CGContextSetShadow(context, size, 10.0);
    
    CGContextFillRect(context, boundedRect);
    CGContextSetStrokeColorWithColor(context, [[UIColor grayColor] CGColor]);
    CGContextStrokeRect(context, boundedRect);
    CGContextRestoreGState(context);
    
}

@end
