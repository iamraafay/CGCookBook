//
//  MMSubCatViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 26/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMDrawingBoardViewController.h"

#import "MMPathView.h"
#import "MMPathShapeView.h"
#import "MMCGPathView.h"
#import "MMCGPathShapeView.h"
#import "MMCGPatternView.h"
#import "MMCGShadowView.h"
#import "MMCGGradients.h"
#import "MMCGShading.h"
#import "MMSuperMario.h"

@interface MMDrawingBoardViewController ()

@property (nonatomic, strong) NSIndexPath *comingFromIndexPath;

@end

@implementation MMDrawingBoardViewController

- (id)initWithSelectedIndex:(NSIndexPath *)indexPath
{
    self = [super initWithNibName:@"MMDrawingBoardViewController" bundle:nil];
    if (self) {
        self.comingFromIndexPath = indexPath;
    }
    return self;
}

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
    
    MMPathView *pathView = nil;
    MMPathShapeView *pathShapeView = nil;
    
    MMCGPathView *cgPathView = nil;
    MMCGPathShapeView *cgPathShape = nil;
    
    MMCGPatternView *cgPatternView = nil;
    MMCGShadowView *cgShadowView = nil;
    
    MMCGGradients *cgGradientView = nil;
    MMCGShading *cgShadingView = nil;
    
    MMSuperMario *cgSuperMario = nil;
    
    switch (self.comingFromIndexPath.section) {
        case 0:
            
            switch (self.comingFromIndexPath.row) {
                case 0:
                    pathView = [[MMPathView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:pathView];
                    break;
                case 1:
                    pathShapeView = [[MMPathShapeView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:pathShapeView];
                    break;
                default:
                    break;
            }
            
            break;
            
        case 1:
            
            switch (self.comingFromIndexPath.row) {
                case 0:
                    cgPathView = [[MMCGPathView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgPathView];
                    break;
                case 1:
                    cgPathShape = [[MMCGPathShapeView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgPathShape];
                    break;
                case 2:
                    cgPatternView = [[MMCGPatternView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgPatternView];
                    break;
                case 3:
                    cgShadowView = [[MMCGShadowView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgShadowView];
                    break;
                case 4:
                    cgGradientView = [[MMCGGradients alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgGradientView];
                    break;
                case 5:
                    cgShadingView = [[MMCGShading alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgShadingView];
                    break;
                default:
                    break;
            }
            
            break;
        case 2:
            
            switch (self.comingFromIndexPath.row) {
                case 0:
                    cgSuperMario = [[MMSuperMario alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgSuperMario];
                    break;
                default:
                    break;
            }
            
            break;
        default:
            break;
    }
    
    
    [pathView setNeedsDisplay];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    
    if ([self.delegate respondsToSelector:@selector(mmDrawingBoardViewController::)]) {
        [self.delegate performSelector:@selector(mmDrawingBoardViewController:) withObject:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(mmDrawingBoardViewController:didPopedOut:)]) {
        [self.delegate mmDrawingBoardViewController:self didPopedOut:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
