//
//  SRSDatabaseService.h
//  WindowWorld
//
//  Created by Samuel Seng on 12/14/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRSProtocols.h"

@interface SRSDatabaseService : NSObject

@property (weak, nonatomic) id <DatabaseServiceProtocol> delegate;
@property (nonatomic) BOOL isLoggedIn;

- (void)login:(NSString *)userName password:(NSString *)password;
- (void)receivedJSONResponse:(NSDictionary *)json;

@end
