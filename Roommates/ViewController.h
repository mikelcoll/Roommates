//
//  ViewController.h
//  Roommates
//
//  Created by Miquel Coll on 03/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIButton *button;
    IBOutlet UILabel *label;
    NSInteger x;
}

- (IBAction)buttonPressed:(id)sender;

@end
