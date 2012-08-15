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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)lock:(id)sender
{
    [(UIButton *)sender setImage:[UIImage imageNamed:locked ? @"unlocked.png" : @"locked.png"] forState:UIControlStateNormal];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:[NSString stringWithFormat:@"http://pubbay.com/lockup/?admin&%@&uuid=%d", locked ? @"unlock" : @"lock", [defaults integerForKey:@"uuid"]]]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];

    locked = !locked;
}

@end
