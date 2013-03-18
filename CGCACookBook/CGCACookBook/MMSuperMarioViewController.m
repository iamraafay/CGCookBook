//
//  MMSuperMarioViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 14/03/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMSuperMarioViewController.h"

#import "MMSuperMario.h"
#import "MMSceneBackground.h"
#import "MMChimney.h"

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
    
    
    //TODO: Mario Character..
    
    
    MMSceneBackground *cgSceneBackground = [[MMSceneBackground alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,
                                                                                               self.view.frame.origin.y,
                                                                                               self.view.frame.size.height + 20.,
                                                                                               self.view.frame.size.width - 120.)];
    cgSceneBackground.autoresizesSubviews = YES;
    
    
    
    MMSuperMario *cgSuperMario = nil;
    
    cgSuperMario = [[MMSuperMario alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,
                                                                   self.view.frame.origin.y + 200.,
                                                                   self.view.frame.size.height + 20.,
                                                                   self.view.frame.size.width - 250.)];
    cgSuperMario.autoresizesSubviews = YES;
    
    
    
    MMChimney *spChimney = [[MMChimney alloc] initWithFrame:CGRectMake(0., 0.,
                                                                       self.view.frame.size.height + 20,
                                                                       self.view.frame.size.width)];
    spChimney.autoresizesSubviews = YES;
    
    
    [self.view addSubview:cgSuperMario];
    [self.view addSubview:cgSceneBackground];
    [self.view addSubview:spChimney];
    
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
