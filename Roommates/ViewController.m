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
    x = 0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    label.text = [NSString stringWithFormat:@"%d",x];
    x++;
}


@end
