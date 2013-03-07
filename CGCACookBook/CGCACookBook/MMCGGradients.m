//
//  MMCGGradients.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 06/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGGradients.h"

@implementation MMCGGradients

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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    /*
    CGFloat colors[] = {
      
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
        
    };*/
    
    NSArray *arrayOfColors = @[(id)[[UIColor colorWithRed:204./255. green:224./255. blue:244./255. alpha:1.0] CGColor],
                               (id)[[UIColor colorWithRed:29./255. green:156./255. blue:215./255. alpha:1.0] CGColor],
                               (id)[[UIColor colorWithRed:0.0 green:50./255. blue:126./255. alpha:1.0] CGColor]];
    
    NSArray *arrayOfDifferentColors = @[(id)[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] CGColor],
                                        (id)[[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0] CGColor],
                                        (id)[[UIColor colorWithRed:1.0 green:0.75 blue:0.0 alpha:1.0] CGColor],
                                        (id)[[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0] CGColor],
                                        (id)[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] CGColor] ];
    
    CGFloat locations[] = {
        0.0,
        0.25,
//        0.50,
//        0.75,
        1.0,
    };
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)arrayOfDifferentColors, locations);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                self.frame.origin,
                                CGPointMake(0.0, self.frame.size.height - 44.),
                                kCGGradientDrawsBeforeStartLocation);
    
    CGContextRestoreGState(context);
    
}

@end
