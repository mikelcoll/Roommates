//
//  MainViewController.h
//  Roommates
//
//  Created by Miquel Coll on 06/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewControllerDelegate;

@interface MainViewController : UIViewController {
    IBOutlet UIButton *logout;
}

@property (nonatomic, assign) id <MainViewControllerDelegate> delegate;

- (IBAction)doneAction:(id)sender;

@end

@protocol MainViewControllerDelegate
- (void)MainViewControllerDidFinish:(MainViewController *)controller;
@end
