//  MultiPartIOSDemoAPIClient.m
//
//  Generated by the the JBoss AeroGear Xcode Project Template on 9/12/13.
//  See Project's web site for more details http://www.aerogear.org
//

#import "MultiPartIOSDemoAPIClient.h"

static NSString * const kMultiPartIOSDemoAPIBaseURLString = @"http://localhost:8080/aerogear-integration-tests-server/rest";

@implementation MultiPartIOSDemoAPIClient

@synthesize uploadPipe = _uploadPipe;

+ (MultiPartIOSDemoAPIClient *)sharedInstance {
    static MultiPartIOSDemoAPIClient *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        NSURL *baseURL = [NSURL URLWithString:kMultiPartIOSDemoAPIBaseURLString];

        // create the Pipeline object 
        AGPipeline *pipeline = [AGPipeline pipelineWithBaseURL:baseURL];

        _uploadPipe = [pipeline pipe:^(id<AGPipeConfig> config) {
            [config setName:@"upload"];
        }];
    }

    return (self);
}

@end