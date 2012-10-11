//
//  ViewController.h
//  Lock Up
//
//  Created by Soheil Yasrebi on 8/7/12.
//  Copyright (c) 2012 Soheil Yasrebi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowMeButton.h"

@interface ViewController : UIViewController
{
    BOOL locked;
    UILabel *label;
    FollowMeButton *followButton;
}

@property(nonatomic, retain)IBOutlet UILabel *label;
@property(nonatomic, retain)IBOutlet FollowMeButton *followButton;

@end
