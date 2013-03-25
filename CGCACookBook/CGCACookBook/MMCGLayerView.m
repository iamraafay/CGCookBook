//
//  MMCGLayerView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 22/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMCGLayerView.h"

@implementation MMCGLayerView

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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGSize sizeOfLayer = CGSizeMake(200., 100.);
    
    CGLayerRef layer = CGLayerCreateWithContext(context, sizeOfLayer, NULL);
    
    CGContextRef layerContext = CGLayerGetContext(layer);
    
    CGContextSetStrokeColorWithColor(layerContext, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(layerContext, [[UIColor darkGrayColor] CGColor]);
    
    CGContextMoveToPoint(layerContext, 10., 10.);
    CGContextAddLineToPoint(layerContext, 60., 10.);
    CGContextAddLineToPoint(layerContext, 10., 60.);
    CGContextClosePath(layerContext);
    
    
    CGContextStrokePath(layerContext);
    
    CGContextStrokeRect(layerContext, (CGRect) { CGPointZero, sizeOfLayer });
    
    CGContextSaveGState(context);
    
    CGContextDrawLayerAtPoint(context, CGPointZero, layer);
    
//    CGContextClearRect(context, (CGRect) {CGPointZero, sizeOfLayer});
    
    CGContextDrawLayerAtPoint(context, (CGPoint){0., 100.}, layer);
    
    CGContextRestoreGState(context);
    
}

@end
