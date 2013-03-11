//
//  MMCGShading.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 07/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGShading.h"

#define RADIAN(degree)((degree * M_PI) / 180)

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
    
    CGPoint startPoint = CGPointMake(self.center.x - 40., self.center.y);
    CGPoint endPoint = CGPointMake(self.center.x + 80., self.center.y);

    CGShadingRef myShader = CGShadingCreateAxial(deviceRGB,
                         startPoint,
                         endPoint,
                         myFunction,
                         false,
                         false);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, self.center.x - 40., self.center.y);
    CGContextAddArc(context, self.center.x, self.center.y, 40., RADIAN(0), RADIAN(180), 1);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    
    CGContextClosePath(context);
//    CGContextStrokePath(context);
    CGContextClip(context);
    
    
    
    
    CGContextDrawShading(context, myShader);
    CGContextRestoreGState(context);
    
}

void MyShadingFunction(void *info, const CGFloat *in, CGFloat *out) {
    
    CGFloat receivedValues;
    size_t k, number_of_components;
    static const CGFloat c[] = {1, 0, 0, 1};
    
    number_of_components = (size_t)info;
    
    receivedValues = *in;
    for (k = 0; k < number_of_components -1; k++)
        *out++ = c[k] * receivedValues;
    *out++ = .75;
    
}


@end
