//
//  MMMrMario.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 19/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMMrMario.h"

#define level 1
#define ZOOM(val)(level * val)
#define RADIAN(degree)(degree * M_PI/180)

@implementation MMMrMario

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

void FaceShading(void *info, const CGFloat *in, CGFloat *out)
{
    size_t numberOfComponents = (size_t)info;
    size_t k;
    const CGFloat receivingVals = *in;
    
    const CGFloat colors[] = {1, 1, 1, 1};
    const CGFloat colors1[] = {0.97, 0.61, 0.33, 1};
    const CGFloat colors2[] = {0.92, 0.59, 0.30}; //236, 151, 78
    
    for (k = 0; k <= numberOfComponents - 1; k++) {
        *out++ = colors2[k]*receivingVals;
    }
    *out++ = 1;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    
    //The rear head hairs.
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    
    CGContextMoveToPoint(context, ZOOM(130.), ZOOM(168.));
    CGContextAddLineToPoint(context, ZOOM(120.), ZOOM(170.));
    CGContextAddCurveToPoint(context,
                             ZOOM(120.), ZOOM(170.), ZOOM(120.), ZOOM(135.),
                             ZOOM(130.), ZOOM(135.));
    CGContextAddLineToPoint(context, ZOOM(170.), ZOOM(135.));
    CGContextClosePath(context);
    
    NSArray *arrayOfDifferentColors = @[(id)[[UIColor colorWithRed:119/255. green:59/255. blue:5/255. alpha:1.0] CGColor],
                                        (id)[[UIColor colorWithRed:173/255. green:123/255. blue:57/255. alpha:1.0] CGColor]];
    
    CGFloat locations[] = {
        0,
        1.0,
        1.25,
    };
    
    CGPoint startRearHeadhairs = CGPointMake(ZOOM(145.), ZOOM(155.));
    CGPoint endRearHeadhairs = CGPointMake(ZOOM(125.), ZOOM(135.));
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)arrayOfDifferentColors, locations);
    
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startRearHeadhairs, endRearHeadhairs, 0);
    
    CGContextRestoreGState(context);
    
    //151 89 21
    
    //119, 59, 5
    //173, 123, 57
    
    
    //Face
    CGPoint faceShadeStartPoint = CGPointMake(ZOOM(0.), ZOOM(200.));
    CGPoint faceShadeEndPoint = CGPointMake(ZOOM(0.), ZOOM(135.));
    
    CGFunctionCallbacks callbacks = {0, FaceShading, NULL};
    
    
    size_t rangeDim = CGColorSpaceGetNumberOfComponents(colorSpace);
    
    const CGFloat domain[] = {0, 1};
    const CGFloat range3[] = {0, 1, 0, 1, 0, 1, 0, 1};
    
    
    CGFunctionRef function = CGFunctionCreate((void*)rangeDim,
                                              1,
                                              domain,
                                              rangeDim,
                                              range3,
                                              &callbacks);
    
    CGShadingRef faceShader = CGShadingCreateAxial(colorSpace, faceShadeStartPoint, faceShadeEndPoint, function, false, false);
    
    
    CGContextSaveGState(context);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(context, ZOOM(100.), ZOOM(130.));
    CGContextAddLineToPoint(context, ZOOM(100.), ZOOM(220.));
    
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextMoveToPoint(context, ZOOM(130.), ZOOM(170.));
    CGContextAddCurveToPoint(context,
                             ZOOM(155.), ZOOM(190.), ZOOM(175.), ZOOM(170.),
                             ZOOM(170.), ZOOM(165.));
    
    CGContextAddArc(context, ZOOM(177.), ZOOM(157.), ZOOM(10.),
                    ZOOM(RADIAN(120.)), ZOOM(RADIAN(260.)), 1);
    
    CGContextAddCurveToPoint(context,
                             ZOOM(170.), ZOOM(145.),
                             ZOOM(170.), ZOOM(135.),
                             ZOOM(170.), ZOOM(135.));
    
    CGContextAddLineToPoint(context, ZOOM(145.), ZOOM(135.));
    CGContextAddCurveToPoint(context,
                             ZOOM(142.), ZOOM(150.), ZOOM(152.), ZOOM(150.),
                             ZOOM(145.), ZOOM(155.));
    
    CGContextAddCurveToPoint(context,
                             ZOOM(135.), ZOOM(155.), ZOOM(140.), ZOOM(140.),
                             ZOOM(130.), ZOOM(140.));
    
    CGContextAddCurveToPoint(context,
                             ZOOM(116.), ZOOM(145.), ZOOM(145.), ZOOM(162.),
                             ZOOM(130.), ZOOM(168.));
    
    CGContextClosePath(context);
    
    CGContextClip(context);
    
    CGContextDrawShading(context, faceShader);
    
    CGContextRestoreGState(context);
}

@end
