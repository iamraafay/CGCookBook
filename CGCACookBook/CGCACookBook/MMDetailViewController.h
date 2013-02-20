//
//  MMDetailViewController.h
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 20/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MMDetailViewControllerDelegate;

@interface MMDetailViewController : UIViewController

@property (nonatomic, weak) id delegate;

@end

@protocol MMDetailViewControllerDelegate <NSObject>

- (void)mmDetailViewController:(MMDetailViewController *)detailsVC;
- (void)mmDetailViewController:(MMDetailViewController *)detailsVC didPopedOut:(BOOL)popped;

@end