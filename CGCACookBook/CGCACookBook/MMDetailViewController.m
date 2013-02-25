//
//  MMDetailViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 20/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMDetailViewController.h"
#import "MMPathView.h"

@interface MMDetailViewController ()

@end

@implementation MMDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    
    MMPathView *pathView = [[MMPathView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:pathView];
    
    [pathView setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if ([self.delegate respondsToSelector:@selector(mmDetailViewController:)]) {
        [self.delegate performSelector:@selector(mmDetailViewController:) withObject:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(mmDetailViewController:didPopedOut:)]) {
        [self.delegate mmDetailViewController:self didPopedOut:YES];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
