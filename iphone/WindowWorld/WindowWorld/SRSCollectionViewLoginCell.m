//
//  SRSCollectionViewLoginCell.m
//  WindowWorld
//
//  Created by Samuel Seng on 9/24/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import "SRSCollectionViewLoginCell.h"
@interface SRSCollectionViewLoginCell()


@end

@implementation SRSCollectionViewLoginCell
- (void)awakeFromNib {
    self.emailField.hidden = YES;
    [self.okButton setTitle:@"Login" forState:UIControlStateNormal];
    self.isLoginMode = YES;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}
- (IBAction)loginSignUpClicked:(id)sender {
    if (self.isLoginMode) {
        
    } else {
        
    }
}

- (IBAction)switchLoginCreateButtonTapped:(id)sender {
    self.isLoginMode = !self.isLoginMode;
    if (self.isLoginMode) {
        self.emailField.hidden = YES;
        self.switchLoginCreateButton.titleLabel.text = @"Create Account";
        [self.okButton setTitle:@"Login" forState:UIControlStateNormal];
        [self.switchLoginCreateButton setTitle:@"Create Account" forState:UIControlStateNormal];
        //[self.okButton sizeToFit];
    } else {
        self.emailField.hidden = NO;
        self.switchLoginCreateButton.titleLabel.text = @"Use Existing";
        [self.okButton setTitle:@"Sign Up" forState:UIControlStateNormal];
        [self.switchLoginCreateButton setTitle:@"Use Existing" forState:UIControlStateNormal];
        //[self.okButton sizeToFit];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
