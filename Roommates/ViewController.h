//
//  ViewController.h
//  Roommates
//
//  Created by Miquel Coll on 03/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface ViewController : UIViewController <MainViewControllerDelegate> {
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UIButton *login;
}

- (IBAction)buttonPressed:(id)sender;

@end
