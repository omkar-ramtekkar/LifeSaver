//
//  AgentSystemInfo.m
//  LifeSaver
//
//  Created by Omkar on 2/14/15.
//  Copyright (c) 2015 Omkar. All rights reserved.
//

#import "AgentSystemInfo.h"

@implementation AgentSystemInfo

+(NSString*) documentDirectoryPath
{
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [dirPaths objectAtIndex:0];
}

@end
