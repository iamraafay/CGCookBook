//
//  MMSuperMario.m
//  CGCACookBook
//
//  Created by Mohammad ; on 11/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMSuperMario.h"

#define level 1

#define ZOOM(val)(level * (val))

@implementation MMSuperMario

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

void UncoloredPattern(void *info, CGContextRef context) {
//    CGContextFillRect(cont, CGRectMake(0., 0., 40., 40.));
    
    
    /*Mario Platform*/
    
    /*Basic stencil setup*/
    
    CGContextBeginPath(context);
    //    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:185./255. green:55./255. blue:13./255 alpha:1.0] CGColor]);
    CGMutablePathRef brickPath = CGPathCreateMutable();
    CGPathMoveToPoint(brickPath, NULL, ZOOM(10.), ZOOM(10.));
    
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50.), ZOOM(10.));
    CGPathMoveToPoint(brickPath, NULL, ZOOM(40.), ZOOM(10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(40.), ZOOM(25.));
    CGPathAddCurveToPoint(brickPath, NULL,
                          ZOOM(40.), ZOOM(50.),   //ctrl 1
                          ZOOM(10.), ZOOM(35.),   //ctrl 2
                          ZOOM(10.), ZOOM(25.));  //end point
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10.), ZOOM(10.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(50.), ZOOM(10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50.), ZOOM(50.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10.), ZOOM(50.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10.), ZOOM(15.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(35.), ZOOM(37.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(35.), ZOOM(50.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(40.), ZOOM(20.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50.), ZOOM(20.));
    
    CGContextAddPath(context, brickPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    
    /*Shadows: Black and White*/
    
    CGContextBeginPath(context);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetLineWidth(context, ZOOM(1.));
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    
    CGMutablePathRef whitePath = CGPathCreateMutable();
    CGContextAddPath(context, whitePath);
    CGPathMoveToPoint(whitePath, NULL, ZOOM(11.), ZOOM(10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(39.), ZOOM(10.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(41.), ZOOM(10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(49.), ZOOM(10.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(10.), ZOOM(11.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(10.), ZOOM(49.));
    
    CGPathMoveToPoint(whitePath, NULL, ZOOM(40.), ZOOM(10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(40.), ZOOM(25.));
    CGPathAddCurveToPoint(whitePath, NULL,
                          ZOOM(40.), ZOOM(50.),   //ctrl 1
                          ZOOM(10.), ZOOM(35.),   //ctrl 2
                          ZOOM(10.), ZOOM(25.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(35.), ZOOM(37.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(35.), ZOOM(50.));
    
    CGPathMoveToPoint(whitePath, NULL, ZOOM(40.), ZOOM(20.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(49.), ZOOM(20.));
    
    
    CGContextAddPath(context, whitePath);
    CGContextStrokePath(context);
    
    CGContextBeginPath(context);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetLineWidth(context, ZOOM(1.));
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGMutablePathRef blackPath = CGPathCreateMutable();
    CGPathMoveToPoint(blackPath, NULL, ZOOM(50.), ZOOM(10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(50.), ZOOM(50.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(35.5), ZOOM(50.));
    CGPathMoveToPoint(blackPath, NULL, ZOOM(34.5), ZOOM(50.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(11.), ZOOM(50.));
    CGPathMoveToPoint(blackPath, NULL, ZOOM(50.), ZOOM(19.5));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(40.9), ZOOM(19.5));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(40.9), ZOOM(17.5));
    
    CGPathMoveToPoint(blackPath, NULL, ZOOM(39.5), ZOOM(9.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(39.5), ZOOM(25.));
    CGPathAddCurveToPoint(blackPath, NULL,
                          ZOOM(40.), ZOOM(49.),   //ctrl 1
                          ZOOM(10.), ZOOM(34.),   //ctrl 2
                          ZOOM(10.), ZOOM(24.));
    
    CGPathMoveToPoint(blackPath, NULL, ZOOM(34.), ZOOM(37.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(34.), ZOOM(49.));
    
    CGContextAddPath(context, blackPath);
    CGContextStrokePath(context);
    
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPatternCallbacks callbacks = {0, UncoloredPattern, NULL};
    
    CGPatternRef uncoloredPattern = CGPatternCreate(NULL,
                    CGRectMake(0.0, 0., 50., 50.),
                    CGAffineTransformIdentity,
                    40., 40.,
                    kCGPatternTilingNoDistortion,
                    true,
                    &callbacks);
    CGFloat alpha = 1.0;
    
    CGColorRef color = CGColorCreateWithPattern(CGColorSpaceCreatePattern(NULL), uncoloredPattern, &alpha);
    
//    CGColorSpaceRef uncoloredPatternColorSpace = CGColorSpaceCreatePattern(CGColorSpaceCreateDeviceRGB());
    
//    CGContextSetFillColorSpace(context, uncoloredPatternColorSpace);
    
    
    
//    CGContextSetFillPattern(context, uncoloredPattern, color);
    
//    CGContextFillRect(context, self.frame);
    
    
    CGContextSetFillColorWithColor(context, color);
    
    CGContextFillRect(context, self.frame);
    
    
}

@end
