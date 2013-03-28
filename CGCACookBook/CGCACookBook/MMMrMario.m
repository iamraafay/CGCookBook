//
//  MMMrMario.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 19/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMMrMario.h"

#define level 1
#define ZOOM(val)(val / level)
#define RADIAN(degree)(degree * M_PI/180)

@implementation MMMrMario

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

void FaceShading(void *info, const CGFloat *in, CGFloat *out)
{
    size_t numberOfComponents = (size_t)info;
    size_t k;
    const CGFloat receivingVals = *in;
    
//    const CGFloat colors[] = {1, 1, 1, 1};
//    const CGFloat colors1[] = {0.97, 0.61, 0.33, 1};
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
    
    /*
     MARK: 'actualConttext' is Window Context. 'context' is the Mr. Mario's faceLayer context.
     */
    
    CGContextRef actualContext = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGSize faceLayerSize = CGSizeMake(ZOOM(190.), ZOOM(180.));
    CGLayerRef faceLayer = CGLayerCreateWithContext(actualContext, faceLayerSize, NULL);
    CGContextRef context = CGLayerGetContext(faceLayer);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    
    CGContextStrokeRect(context, (CGRect) {CGPointZero, faceLayerSize});
    
    
    //Cap
    CGContextSaveGState(context);
    
    NSArray *colors = @[(id)[[UIColor colorWithRed:0.75 green:0. blue:0. alpha:1.0] CGColor],
                        (id)[[UIColor colorWithRed:0.872 green:0.02 blue:0.02 alpha:1.0] CGColor],
                        (id)[[UIColor colorWithRed:1.0 green:0.72 blue:0.72 alpha:1.0] CGColor]];
    
    const CGFloat caplocations[] = {
        0.0,
        0.50,
        1.0,
    };

    CGPoint startCapPoint = CGPointMake(ZOOM(163.), ZOOM(135.));
    CGPoint endCapPoint = CGPointMake(ZOOM(145.), ZOOM(110.));
    
    CGGradientRef capGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(colors), caplocations);
    
    CGPoint startCapFlapPoint = CGPointMake(ZOOM(180.), ZOOM(135.));
    CGPoint endCapFlapPoint = CGPointMake(ZOOM(163.), ZOOM(115));
    
    CGGradientRef capFlapGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(colors), caplocations);
    
    CGContextBeginPath(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(context, ZOOM(128.), ZOOM(135.));
    CGContextAddCurveToPoint(context,
                             ZOOM(147.), ZOOM(110.), ZOOM(167.), ZOOM(130.),
                             ZOOM(167.), ZOOM(130.));
    CGContextAddCurveToPoint(context,
                             ZOOM(173.5), ZOOM(129.5), ZOOM(180.), ZOOM(135.),
                             ZOOM(180.), ZOOM(135.));
    CGContextClosePath(context);
    
    CGContextClip(context);
    
    CGContextDrawLinearGradient(context, capFlapGradient, startCapFlapPoint, endCapFlapPoint, 0);
    CGContextDrawLinearGradient(context, capGradient, startCapPoint, endCapPoint, 0);
    
    CGContextRestoreGState(context);
    
    
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
                    RADIAN(120.), RADIAN(250.), 1);
    
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
    
    
    //Face Features
    
    
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGRect eyeRect = CGRectMake(ZOOM(157.), ZOOM(136.), ZOOM(7.), ZOOM(15.));
    
    CGContextMoveToPoint(context, ZOOM(90.), ZOOM(90.));
    CGContextAddEllipseInRect(context, eyeRect);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    
    CGRect eyeWhiteRect = CGRectMake(ZOOM(157.), ZOOM(138.), ZOOM(2.), ZOOM(3.));
    
    CGContextMoveToPoint(context, ZOOM(30.), ZOOM(70.));
    CGContextAddEllipseInRect(context, eyeWhiteRect);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    CGContextSaveGState(context);
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.1);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:.92 green:.59 blue:.30 alpha:1.0] CGColor]);
    
    CGContextMoveToPoint(context, ZOOM(170.), ZOOM(165.));
    CGContextAddCurveToPoint(context,
                             ZOOM(166.), ZOOM(164.), ZOOM(167.), ZOOM(160.),
                             ZOOM(167.), ZOOM(160.));
    CGContextAddCurveToPoint(context,
                             ZOOM(163.), ZOOM(162.), ZOOM(158.), ZOOM(162.),
                             ZOOM(156.), ZOOM(161.));
    CGContextAddCurveToPoint(context,
                             ZOOM(154.), ZOOM(166.), ZOOM(168.), ZOOM(165.),
                             ZOOM(170.), ZOOM(165.));
    
    CGContextClip(context);
    
    NSArray *belowNoseGradientColors = @[(id)[[UIColor colorWithRed:119/255. green:123/255. blue:52/255. alpha:1.0] CGColor],
                                         (id)[[UIColor colorWithRed:173/255. green:123/255. blue:57/255. alpha:1.0] CGColor]];
    CGFloat belowNoseGradientLocations[] = {
        .20,
        .25,
        1.0
    };
    
    CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), (__bridge CFArrayRef)(belowNoseGradientColors), belowNoseGradientLocations);
    
    CGPoint  endBelowNosePoint = CGPointMake(ZOOM(167.), ZOOM(160.));
    CGPoint startBelowNosePoint = CGPointMake(ZOOM(168.), ZOOM(165.));
    
    CGContextDrawLinearGradient(context, gradient,
                                startBelowNosePoint, endBelowNosePoint,
                                0);
    CGContextRestoreGState(context);
    
    
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, .2);
    CGContextMoveToPoint(context, ZOOM(156.), ZOOM(161.));
    
    CGContextAddCurveToPoint(context,
                             ZOOM(154.), ZOOM(166.), ZOOM(168.), ZOOM(165.),
                             ZOOM(170.), ZOOM(165.));
    
    
    CGContextStrokePath(context);
    
    
    CGContextDrawLayerAtPoint(actualContext, (CGPoint) {
                                                        0, -25.
                                                        /*0., 100.*/
                                                        }, faceLayer);
    
    
    CGContextSaveGState(actualContext);
    
    CGSize bodyCostumeLayerSize = CGSizeMake(ZOOM(80.), ZOOM(70.));
    CGLayerRef bodyCostumeLayer = CGLayerCreateWithContext(actualContext, bodyCostumeLayerSize, NULL);
    CGContextRef bodyCostumeLayerContext = CGLayerGetContext(bodyCostumeLayer);
    
    CGContextSetStrokeColorWithColor(bodyCostumeLayerContext, [[UIColor redColor] CGColor]);
    CGContextStrokeRect(bodyCostumeLayerContext, (CGRect) {CGPointZero, bodyCostumeLayerSize} );
    
    
    //MARK: the shoulder with the tummy, the red stuff
    CGContextBeginPath(bodyCostumeLayerContext);
    
    CGContextMoveToPoint(bodyCostumeLayerContext, ZOOM(0.), ZOOM(40.));
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(0.), ZOOM(-10.), ZOOM(80.), ZOOM(-30.),
                             ZOOM(80.), ZOOM(40.));
    
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(72.), ZOOM(34.), ZOOM(72.), ZOOM(48.),
                             ZOOM(65), ZOOM(48.));
    
    CGContextMoveToPoint(bodyCostumeLayerContext, ZOOM(68.), ZOOM(46.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(62.), ZOOM(25.));
    
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(62.), ZOOM(26.5));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(26.), ZOOM(26.5));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(26.), ZOOM(25.));
    
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(18.), ZOOM(30.), ZOOM(16.), ZOOM(40.),
                             ZOOM(16.), ZOOM(40.));
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(16.), ZOOM(46.), ZOOM(0.), ZOOM(46.),
                             ZOOM(0.), ZOOM(40.));
    
    CGContextStrokePath(bodyCostumeLayerContext);
    
    
    //MARK: the hands, white stuff
    
    //Right Hand
    CGContextBeginPath(bodyCostumeLayerContext);
    
    CGContextMoveToPoint(bodyCostumeLayerContext, ZOOM(80.), ZOOM(40.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(80.), ZOOM(50.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(70.), ZOOM(60.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(70.), ZOOM(50.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(65.), ZOOM(50.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(65.), ZOOM(48.));
    
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(72.), ZOOM(48.), ZOOM(72.), ZOOM(34.),
                             ZOOM(80), ZOOM(40.));
    
    //Left hand
    CGContextMoveToPoint(bodyCostumeLayerContext, ZOOM(16.), ZOOM(40.));
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(16.), ZOOM(46.), ZOOM(0.), ZOOM(46.),
                             ZOOM(0.), ZOOM(40.));
    
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(0.), ZOOM(53.));
    CGContextAddCurveToPoint(bodyCostumeLayerContext,
                             ZOOM(5.), ZOOM(58.), ZOOM(10.), ZOOM(60.),
                             ZOOM(15.), ZOOM(53.));
    CGContextAddLineToPoint(bodyCostumeLayerContext, ZOOM(12.), ZOOM(53.));
    CGContextClosePath(bodyCostumeLayerContext);
    
    
    CGContextStrokePath(bodyCostumeLayerContext);
    
    
    CGContextDrawLayerAtPoint(actualContext, (CGPoint) {ZOOM(110.), ZOOM(150.)}, bodyCostumeLayer);
    
    CGContextRestoreGState(actualContext);
    
}

@end
