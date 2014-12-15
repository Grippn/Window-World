//
//  SRSDatabaseService.m
//  WindowWorld
//
//  Created by Samuel Seng on 12/14/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import "SRSDatabaseService.h"
#import "SRSAJAXService.h"
#import "SRSViewController.h"

@interface SRSDatabaseService() <AJAXProtocol>
@property (strong, nonatomic) SRSAJAXService *ajaxService;
@end

#define OPERATION_TYPE_LOGIN @"login"
#define OPERATION_TYPE_CREATE_USER @"create_user"

@implementation SRSDatabaseService

- (id)init {
    self = [super init];
    if (self) {
        self.ajaxService = [[SRSAJAXService alloc] init];
        self.ajaxService.delegate = self;
        self.isLoggedIn = NO;
    }
    return self;
}

- (void)login:(NSString *)userName password:(NSString *)password {
    NSDictionary *request = @{@"operation":@"login", @"username":userName,@"password":password};
    [self.ajaxService performRequestWithJSON:request];
}

- (void)receivedJSONResponse:(NSDictionary *)json {
    if ([json objectForKey:@"error" ] != nil) {
        if ([[json objectForKey:@"error" ] boolValue] == NO) {
            if ([json objectForKey:@"operation"] != nil) {
                if ([json[@"operation"] isEqualToString: OPERATION_TYPE_LOGIN]) {
                    [self receivedLoginJSONResponse:json];
                } else if ([json[@"operation"] isEqualToString:OPERATION_TYPE_CREATE_USER]) {
                }
            }
        }
    }
}

- (void)receivedLoginJSONResponse:(NSDictionary*) json {
    if ([self.delegate isKindOfClass:[SRSViewController class]]) {
        [((SRSViewController *)self.delegate) loginSucceeded];
    }
}
@end
