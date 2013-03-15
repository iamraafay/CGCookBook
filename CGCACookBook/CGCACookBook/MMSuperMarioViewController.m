//
//  MMSuperMarioViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 14/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMSuperMarioViewController.h"
#import "MMSuperMario.h"

@interface MMSuperMarioViewController ()

@end

@implementation MMSuperMarioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //TODO: Background, with Cloud?
    //TODO: Mario Character..
    
    
    
    MMSuperMario *cgSuperMario = nil;
    
    cgSuperMario = [[MMSuperMario alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,
                                                                   self.view.frame.origin.y + 200.,
                                                                   self.view.frame.size.height + 20.,
                                                                   self.view.frame.size.width - 250.)];
    cgSuperMario.autoresizesSubviews = YES;
    [self.view addSubview:cgSuperMario];
    [self.view bringSubviewToFront:cgSuperMario];
    [cgSuperMario setNeedsDisplay];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
