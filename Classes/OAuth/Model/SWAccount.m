//
//  SWAccount.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWAccount.h"

@implementation SWAccount
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    
    }
    return  self;
}
+(instancetype)accountWithDict:(NSDictionary *)dict;
{
    return  [[self alloc] initWithDict:dict];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]){
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeInt64ForKey:@"expires_in"];
        self.remind_in = [aDecoder decodeInt64ForKey:@"remind_in"];
        self.uid = [aDecoder decodeInt64ForKey:@"uid"];
        self.deadline = [aDecoder decodeObjectForKey:@"deadline"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.deadline forKey:@"deadline"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

@end
