//
//  SRSCollectionViewLoginCell.h
//  WindowWorld
//
//  Created by Samuel Seng on 9/24/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRSCollectionViewLoginCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UITextField *emailField;
@property (nonatomic, strong) IBOutlet UIButton *okButton;
@property (nonatomic, strong) IBOutlet UIButton *switchLoginCreateButton;

- (IBAction)switchLoginCreateButtonTapped:(id)sender;
@end
