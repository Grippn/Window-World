//
//  SRSProtocols.h
//  WindowWorld
//
//  Created by Samuel Seng on 12/14/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DatabaseServiceProtocol <NSObject>

- (void)loginSucceeded;

@end

@protocol AJAXProtocol <NSObject>

- (void)receivedJSONResponse:(NSDictionary *)json;

@end


@interface SRSProtocols : NSObject

@end
