//
//  SRSViewController.m
//  WindowWorld
//
//  Created by Samuel Seng on 9/24/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import "SRSViewController.h"
#import "SRSCollectionViewLoginCell.h"

@interface SRSViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DatabaseServiceProtocol>
@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@end

@implementation SRSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionView.alwaysBounceVertical = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SRSCollectionViewLoginCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LoginCell" forIndexPath:indexPath];
    [cell sizeToFit];
    return cell;
}

/*- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}*/

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (IBAction)loginSignUpPressed:(id)sender {
    SRSCollectionViewLoginCell *loginCell = (SRSCollectionViewLoginCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    if (loginCell.isLoginMode) {
        self.databaseService.delegate = self;
        [self.databaseService login:loginCell.usernameField.text password:loginCell.passwordField.text];
    }
}

- (void)loginSucceeded {
    self.databaseService.isLoggedIn = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
