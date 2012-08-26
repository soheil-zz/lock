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
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    label.text = [NSString stringWithFormat:@"Your secret code: %d", [defaults integerForKey:@"uuid"]];
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

- (IBAction)lock:(id)sender
{
    [(UIButton *)sender setImage:[UIImage imageNamed:locked ? @"unlocked.png" : @"locked.png"] forState:UIControlStateNormal];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:[NSString stringWithFormat:@"http://pubbay.com/lockapp/?admin&%@&uuid=%d", locked ? @"unlock" : @"lock", [defaults integerForKey:@"uuid"]]]];
    NSURLConnection *dummy = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dummy = dummy;

    locked = !locked;
}

@end
