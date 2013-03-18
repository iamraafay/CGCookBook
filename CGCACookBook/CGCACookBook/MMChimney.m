//
//  MMChimney.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 18/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#define level 1

#define ZOOM(val)(val * level)

#import "MMChimney.h"

@implementation MMChimney

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


void ChimneyShader(void *info, const CGFloat *in, CGFloat *out)
{
    size_t numberOfComponents = (size_t)info;
    size_t k;
    
    CGFloat receivedVals = *in;
    static const CGFloat colorVariation[] = {0, 1, 0, 1};
    NSLog(@"numberofcomp:%zd", numberOfComponents);
    for (k = 0; k <= numberOfComponents -1; k++) {
        *out++ = colorVariation[k] * receivedVals;
    }
    *out++ = 1;
    
}

void ChimneyLightShader(void *info, const CGFloat *in, CGFloat *out)
{
    
    size_t numberOfComponents = (size_t)info;
    size_t k;
    
    CGFloat receivedVlas = *in;
    NSLog(@"Received Values:%f", receivedVlas);
    static const CGFloat colorVariation[] = {1, 1, 1};
    static const CGFloat earlyColorVariation[] = {0, 0.75, 0, 0.5};
    
    for (k = 0; k <= numberOfComponents; k++) {
        
        if (colorVariation[k] * receivedVlas >= 0.0 &&
            colorVariation[k] * receivedVlas <= 0.20) {
            *out++ = earlyColorVariation[k] * receivedVlas;
        } else {
            *out++ = colorVariation[k] * receivedVlas;
        }
        
    }
    *out++ = 1;
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFunctionCallbacks callbacks = {
        0,
        ChimneyShader,
        NULL,
    };
    
    size_t rangeDim = CGColorSpaceGetNumberOfComponents(colorSpace);
    CGFloat range[8] = {0, 1, 0, 1, 0, 1, 0, 1};
    size_t domainDim = 1;
    CGFloat domain[2] = {0, 1};
    
    CGFunctionRef function = CGFunctionCreate((void*)rangeDim,
                                              domainDim, domain,
                                              rangeDim, range,
                                              &callbacks);
    
    CGPoint startPoint = CGPointMake(ZOOM(455.), ZOOM(200.));
    CGPoint endPoint = CGPointMake(ZOOM(520.), 200.);
    
    CGShadingRef chimneyShading = CGShadingCreateAxial(colorSpace,
                         startPoint, endPoint,
                         function,
                         false, false);
    
    CGPoint startHeadShadingPoint = CGPointMake(ZOOM(452.), ZOOM(150.));
    CGPoint endHeadShadingPoint = CGPointMake(ZOOM(523.), ZOOM(150.));
    
    CGShadingRef chimneyHeadShading = CGShadingCreateAxial(colorSpace,
                                                           startHeadShadingPoint, endHeadShadingPoint,
                                                           function,
                                                           false, false);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor darkTextColor] CGColor]);
    CGContextMoveToPoint(context, ZOOM(454.), ZOOM(190.));
    CGContextAddLineToPoint(context, ZOOM(521.), ZOOM(190.));
    CGContextAddLineToPoint(context, ZOOM(521.), ZOOM(240.));
    CGContextAddLineToPoint(context, ZOOM(454.), ZOOM(240.));
    CGContextClosePath(context);
    
    CGContextClip(context);

    CGContextDrawShading(context, chimneyShading);
    CGContextRestoreGState(context);
    
    
    CGContextSaveGState(context);
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor darkTextColor] CGColor]);
    CGContextMoveToPoint(context, ZOOM(449.), ZOOM(160.));
    CGContextAddLineToPoint(context, ZOOM(526.), ZOOM(160.));
    CGContextAddLineToPoint(context, ZOOM(526.), ZOOM(190.));
    CGContextAddLineToPoint(context, ZOOM(449.), ZOOM(190.));
    CGContextClosePath(context);
    
    CGContextClip(context);
    
    CGContextDrawShading(context, chimneyHeadShading);
    
    CGContextRestoreGState(context);
    
}

@end
