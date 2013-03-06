//
//  MMCGPatternView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 05/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGPatternView.h"

@implementation MMCGPatternView

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
    
    CGPatternCallbacks coloredCallbacks = {0, MyColoredCallbacks, NULL};
    CGPatternCallbacks unColoredCallbacks = {0, MyStencilCallback, NULL};
    
    CGPatternRef coloredPattern = CGPatternCreate(NULL,
                                                  CGRectMake(0., 0., 20., 20.),
                                                  CGAffineTransformIdentity,
                                                  20., 20.,
                                                  kCGPatternTilingNoDistortion,
                                                  true,
                                                  &coloredCallbacks);
    CGColorSpaceRef coloredPatternColorSpace = CGColorSpaceCreatePattern(NULL);
    CGFloat alpha = 1.0;
    
    CGColorRef coloredPatternReady = CGColorCreateWithPattern(coloredPatternColorSpace, coloredPattern, &alpha);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, coloredPatternReady);
    CGContextFillRect(context, self.frame);
    
    
    
    
}

#pragma mark - Custom Pattern Drawing Callbacks

void MyColoredCallbacks(void *info, CGContextRef context) {
    
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0., 0., 10., 10.));
    CGContextFillRect(context, CGRectMake(10., 10., 10., 10.));
    
    
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0., 10., 10., 10.));
    CGContextFillRect(context, CGRectMake(10., 0., 10., 10.));
    
}

void MyStencilCallback(void *info, CGContextRef context) {
    
    
}


@end
