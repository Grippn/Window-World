//
//  SRSAJAXService.m
//  WindowWorld
//
//  Created by Samuel Seng on 12/14/14.
//  Copyright (c) 2014 Samuel Seng. All rights reserved.
//

#import "SRSAJAXService.h"
#import "SRSDatabaseService.h"

@interface SRSAJAXService()

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation SRSAJAXService

- (id)init {
    self = [super init];
    if (self) {
        //Set session for web connection
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    }
    return self;
}

- (void)performRequestWithJSON:(NSDictionary *)json {
    NSMutableString *requestString = [NSMutableString stringWithFormat:@"http://windowworld.local/Window-World/server/index.php"];
    
    int iteration_number = 0;
    for (NSString *key in json) {
        if (iteration_number == 0) {
            [requestString appendString:[NSString stringWithFormat:@"?%@=%@", key, json[key]]];
        } else {
            [requestString appendString:[NSString stringWithFormat:@"&%@=%@", key, json[key]]];
        }
        iteration_number++;
    }
    
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:nil];
        [((SRSDatabaseService *)self.delegate) receivedJSONResponse:json];
    }];
    [dataTask resume];
}


@end
