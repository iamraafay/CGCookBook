//
//  MMSceneBackground.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 15/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMSceneBackground.h"

@implementation MMSceneBackground

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
    
    
    CGColorSpaceRef deviceRGBColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef startingColor = [[UIColor colorWithRed:75./255. green:125./255. blue:251/255. alpha:1.] CGColor];
    CGColorRef midColor = [[UIColor colorWithRed:75./255. green:125./255. blue:251/255. alpha:.75] CGColor];
    CGColorRef endColor = [[UIColor colorWithRed:75./255. green:125./255. blue:251/255. alpha:.5] CGColor];
    
    CGColorRef colors[] = {
        startingColor,
        midColor,
        endColor,
    };
    
    CFArrayRef colorsArr = CFArrayCreate(NULL, (const void **)colors, sizeof(colors)/sizeof(CGColorRef), &kCFTypeArrayCallBacks);
    
    CGFloat locations[3] = {
        0.0, 0.5, 1.0,
    };
    
    CGGradientRef gradient = CGGradientCreateWithColors(deviceRGBColorSpace, colorsArr, locations);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0, 0.0), CGPointMake(0.0, 100.), kCGGradientDrawsAfterEndLocation);
    
}


@end
