//
//  MMCGShading.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 07/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGShading.h"

@implementation MMCGShading

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
    
    CGColorSpaceRef deviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t numberOfComponenets = CGColorSpaceGetNumberOfComponents(deviceRGB);
    
    CGFunctionCallbacks mycallbacks = {
        0,
        &MyShadingFunction,
        NULL
    };
    
    size_t domainDimension = 1; //Since I've only only one callback Function; It's Input Size
    static const CGFloat domain[2] = {0, 1}; // Input intervals
    size_t rangeDimension = numberOfComponenets; //Output Size
    static const CGFloat range[8] = {0, 1, 0, 1, 0, 1, 0, 1}; //Output intervals
    
    
    
    CGFunctionRef myFunction = CGFunctionCreate((void *)numberOfComponenets,
                     domainDimension,
                     domain,
                     rangeDimension,
                     range,
                     &mycallbacks);
    
    CGPoint startPoint = CGPointMake(0,0.5);
    CGPoint endPoint = CGPointMake(1,0.5);
    
    CGShadingRef myShader = CGShadingCreateAxial(deviceRGB,
                         startPoint,
                         endPoint,
                         myFunction,
                         false,
                         false);
    
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextAddArc(context, .5, .5, .3, 0, 180 * 180 / M_PI, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGContextDrawShading(context, myShader);
    CGContextRestoreGState(context);
    
}

void MyShadingFunction(void *info, const CGFloat *in, CGFloat *out) {
    
    CGFloat v;
    size_t k, components;
    static const CGFloat c[] = {1, 0, .5, 0 };
    
    components = (size_t)info;
    
    v = *in;
    for (k = 0; k < components -1; k++)
        *out++ = c[k] * v;
    *out++ = 1;
    
}


@end
