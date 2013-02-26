//
//  MMSubCatViewController.h
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 26/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMDrawingBoardViewControllerDelegate;

@interface MMDrawingBoardViewController : UIViewController

- (id)initWithSelectedIndex:(NSIndexPath *)indexPath;

@property (weak, nonatomic) id delegate;

@end

@protocol MMDrawingBoardViewControllerDelegate <NSObject>

- (void)mmDrawingBoardViewController:(MMDrawingBoardViewController *)detailsVC;
- (void)mmDrawingBoardViewController:(MMDrawingBoardViewController *)detailsVC didPopedOut:(BOOL)popped;

@end
