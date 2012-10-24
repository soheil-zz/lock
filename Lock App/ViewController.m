//
//  ViewController.m
//  Lock Up
//
//  Created by Soheil Yasrebi on 8/7/12.
//  Copyright (c) 2012 Soheil Yasrebi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label, followButton, labelHelp;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    label.text = [NSString stringWithFormat:@"Your secret code: %@", [defaults objectForKey:@"btmac"]];

    followButton.twitterAccount = @"lockapp";
    labelHelp.hidden = ![defaults boolForKey:@"view-loaded-more-than-once"];
    if (labelHelp.hidden) {
        [defaults setBool:YES forKey:@"view-loaded-more-than-once"];
        [defaults synchronize];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

@end
