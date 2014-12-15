//
//  SRSAJAXService.h
//  WindowWorld
//
//  Created by Samuel Seng on 12/14/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRSProtocols.h"


@interface SRSAJAXService : NSObject

@property (nonatomic, weak) id <AJAXProtocol> delegate;

- (void)performRequestWithJSON:(NSDictionary *)json;

@end
