//
//  SRSViewController.h
//  WindowWorld
//
//  Created by Samuel Seng on 9/24/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRSDatabaseService.h"

@interface SRSViewController : UIViewController

@property (strong, nonatomic) SRSDatabaseService *databaseService;

- (void)loginSucceeded;

@end
