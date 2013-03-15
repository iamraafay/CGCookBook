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
//        self.backgroundColor = [UIColor redColor];
        
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
    CGPathMoveToPoint(brickPath, NULL, ZOOM(10. - 10.), ZOOM(10. - 10.));
    
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50. - 10.), ZOOM(10. - 10.));
    CGPathMoveToPoint(brickPath, NULL, ZOOM(40. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(40. - 10.), ZOOM(25. - 10.));
    CGPathAddCurveToPoint(brickPath, NULL,
                          ZOOM(40. - 10.), ZOOM(50. - 10.),   //ctrl 1
                          ZOOM(10. - 10.), ZOOM(35. - 10.),   //ctrl 2
                          ZOOM(10. - 10.), ZOOM(25. - 10.));  //end point
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10. - 10.), ZOOM(10. - 10.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(50. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50. - 10.), ZOOM(50. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10. - 10.), ZOOM(50. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(10. - 10.), ZOOM(15. - 10.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(35. - 10.), ZOOM(37. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(35. - 10.), ZOOM(50. - 10.));
    
    CGPathMoveToPoint(brickPath, NULL, ZOOM(40. - 10.), ZOOM(20. - 10.));
    CGPathAddLineToPoint(brickPath, NULL, ZOOM(50. - 10.), ZOOM(20. - 10.));
    
    CGContextAddPath(context, brickPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    
    /*Shadows: Black and White*/
    
    CGContextBeginPath(context);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetLineWidth(context, ZOOM(1.));
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    
    CGMutablePathRef whitePath = CGPathCreateMutable();
    CGContextAddPath(context, whitePath);
    CGPathMoveToPoint(whitePath, NULL, ZOOM(11. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(39. - 10.), ZOOM(10. - 10.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(41. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(49. - 10.), ZOOM(10. - 10.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(10. - 10.), ZOOM(11. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(10. - 10.), ZOOM(49. - 10.));
    
    CGPathMoveToPoint(whitePath, NULL, ZOOM(40. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(40. - 10.), ZOOM(25. - 10.));
    CGPathAddCurveToPoint(whitePath, NULL,
                          ZOOM(40. - 10.), ZOOM(50. - 10.),   //ctrl 1
                          ZOOM(10. - 10.), ZOOM(35. - 10.),   //ctrl 2
                          ZOOM(10. - 10.), ZOOM(25. - 10.));
    CGPathMoveToPoint(whitePath, NULL, ZOOM(35. - 10.), ZOOM(37. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(35. - 10.), ZOOM(50. - 10.));
    
    CGPathMoveToPoint(whitePath, NULL, ZOOM(40. - 10.), ZOOM(20. - 10.));
    CGPathAddLineToPoint(whitePath, NULL, ZOOM(49. - 10.), ZOOM(20. - 10.));
    
    
    CGContextAddPath(context, whitePath);
    CGContextStrokePath(context);
    
    CGContextBeginPath(context);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetLineWidth(context, ZOOM(1.));
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGMutablePathRef blackPath = CGPathCreateMutable();
    CGPathMoveToPoint(blackPath, NULL, ZOOM(50. - 10.), ZOOM(10. - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(50. - 10.), ZOOM(50. - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(35.5 - 10.), ZOOM(50. - 10.));
    CGPathMoveToPoint(blackPath, NULL, ZOOM(34.5 - 10.), ZOOM(50. - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(11. - 10.), ZOOM(50. - 10.));
    CGPathMoveToPoint(blackPath, NULL, ZOOM(50. - 10.), ZOOM(19.5 - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(40.9 - 10.), ZOOM(19.5 - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(40.9 - 10.), ZOOM(17.5 - 10.));
    
    CGPathMoveToPoint(blackPath, NULL, ZOOM(39.5 - 10.), ZOOM(9. - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(39.5 - 10.), ZOOM(25. - 10.));
    CGPathAddCurveToPoint(blackPath, NULL,
                          ZOOM(40. - 10.), ZOOM(49. - 10.),   //ctrl 1
                          ZOOM(10. - 10.), ZOOM(34. - 10.),   //ctrl 2
                          ZOOM(10. - 10.), ZOOM(24. - 10.));
    
    CGPathMoveToPoint(blackPath, NULL, ZOOM(34. - 10.), ZOOM(37. - 10.));
    CGPathAddLineToPoint(blackPath, NULL, ZOOM(34. - 10.), ZOOM(49. - 10.));
    
    CGContextAddPath(context, blackPath);
    CGContextStrokePath(context);
    
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [super drawRect:self.frame];
    
    rect = self.frame;
    
    NSLog(@"Rect:%@", NSStringFromCGRect(rect));
    
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
    
    CGContextSetFillColorWithColor(context, color);
    
    CGRect tilesFrame = CGRectMake(0,
                                   0,
                                   self.frame.size.width,
                                   self.frame.size.height - 0.);
    
    CGContextFillRect(context, tilesFrame);
    
}

@end
