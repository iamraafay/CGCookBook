//
//  MMSubCatViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 26/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMDrawingBoardViewController.h"
#import "MMSuperMarioViewController.h"

#import "MMPathView.h"
#import "MMPathShapeView.h"
#import "MMCGPathView.h"
#import "MMCGPathShapeView.h"
#import "MMCGPatternView.h"
#import "MMCGShadowView.h"
#import "MMCGGradients.h"
#import "MMCGShading.h"
#import "MMNoContentView.h"
#import "MMCGLayerView.h"

@interface MMDrawingBoardViewController ()

@property (nonatomic, strong) NSIndexPath *comingFromIndexPath;
@property (nonatomic, strong) MMNoContentView *noContent;

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
    
    if (UIDeviceOrientationIsPortrait([self interfaceOrientation])) {
        if (_noContent == nil) {
            _noContent = [[MMNoContentView alloc] initWithFrame:self.view.frame];
        }
        
        [self.view addSubview:_noContent];
        [_noContent setHidden:YES];
    }
    
    
    MMPathView *pathView = nil;
    MMPathShapeView *pathShapeView = nil;
    
    MMCGPathView *cgPathView = nil;
    MMCGPathShapeView *cgPathShape = nil;
    
    MMCGPatternView *cgPatternView = nil;
    MMCGShadowView *cgShadowView = nil;
    
    MMCGGradients *cgGradientView = nil;
    MMCGShading *cgShadingView = nil;
    
    MMCGLayerView *cgLayerView = nil;
    
    MMSuperMarioViewController *superMario = nil;
    
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
                case 6:
                    cgLayerView = [[MMCGLayerView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:cgLayerView];
                    break;
                default:
                    break;
            }
            
            break;
        case 2:
            
            switch (self.comingFromIndexPath.row) {
                case 0:
                    
                    superMario = [[MMSuperMarioViewController alloc] initWithNibName:nil bundle:nil];
                    superMario.view.frame = CGRectMake(self.view.frame.origin.x,
                                                       self.view.frame.origin.y - 20.,
                                                       self.view.frame.size.width,
                                                       self.view.frame.size.height);
                    [self.view addSubview:superMario.view];
                    [self addChildViewController:superMario];
                    [_noContent setHidden:NO];
                    
                    break;
                default:
                    break;
            }
            
            break;
        default:
            break;
    }
    
    [pathView setNeedsDisplay];
    [self.view bringSubviewToFront:_noContent];
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

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
        
    if (toInterfaceOrientation == UIDeviceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIDeviceOrientationLandscapeRight) {
        
        switch (self.comingFromIndexPath.section) {
            case 0:
                
                break;
                
            case 1:
                
                break;
            case 2:
                
                switch (self.comingFromIndexPath.row) {
                    case 0:
                        [_noContent setHidden:YES];
                        
                        break;
                    default:
                        break;
                }
                
                break;
            default:
                break;
        }
        
    } else if (toInterfaceOrientation == UIDeviceOrientationPortrait) {
        
        switch (self.comingFromIndexPath.section) {
            case 0:
                
                break;
                
            case 1:
                
                break;
            case 2:
                
                switch (self.comingFromIndexPath.row) {
                    case 0:
                        [_noContent setHidden:NO];
                        break;
                    default:
                        break;
                }
                
                break;
            default:
                break;
        }
        
        
    }

    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    if (UIDeviceOrientationIsLandscape([self interfaceOrientation])) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
