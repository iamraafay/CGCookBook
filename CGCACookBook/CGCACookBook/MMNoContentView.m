//
//  MMNoContentView.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 12/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMNoContentView.h"

@implementation MMNoContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x, self.center.y, 260., 44.)];
        label.center = self.center;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"Helvetica" size:12.];
        label.text = @"Please turn to landscape to see the output";
        [self addSubview:label];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //TODO Play with CGFont 
}


@end
