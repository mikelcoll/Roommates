//
//  ViewController.m
//  Roommates
//
//  Created by Miquel Coll on 03/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    NSString *user = username.text;
    NSString *pass = password.text;
    NSLog(@"user: %@, pass: %@", user, pass);
}

- (void)MainViewControllerDidFinish:(MainViewController *) controller {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"LoginModal"]) {
        MainViewController * detailViewController = (MainViewController *) segue.destinationViewController;
        detailViewController.delegate = self;
    }
}
@end
