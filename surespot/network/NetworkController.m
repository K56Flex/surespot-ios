//
//  NetworkController.m
//  surespot
//
//  Created by Adam on 6/16/13.
//  Copyright (c) 2013 2fours. All rights reserved.
//

#import "NetworkController.h"

//#define _AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES_
#define kHost @"https://192.168.10.68"

@implementation NetworkController
+(NetworkController*)sharedInstance
{
    static NetworkController *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kHost]];
    });
    
    return sharedInstance;
}

-(NetworkController*)init
{
    //call super init
    self = [super init];
    
    if (self != nil) {
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

-(void) loginWithUsername:(NSString*) username andPassword:(NSString *)password andSignature: (NSString *) signature
{
    
    NSMutableString * sUrl  = [[NSMutableString alloc] initWithString:kHost];
    [sUrl appendString:@"/login"];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:username,@"username",password,@"password",signature, @"authSig", nil];
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:@"login" parameters: params];

    
    
    
    AFJSONRequestOperation* operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *operation, NSHTTPURLResponse *responseObject, id JSON) {
        //success!1
        //completionBlock(JSON);
         NSLog(@"response: %d",  [responseObject statusCode]);
    } failure: ^(NSURLRequest *operation, NSHTTPURLResponse *responseObject, NSError *Error, id JSON) {
        //success!1
        //completionBlock(JSON);
        NSLog(@"response failure: %@",  Error);
    } ];
    
    [operation start];
    
    
}
@end