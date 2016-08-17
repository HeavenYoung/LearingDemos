//
//  Tools.m
//  08-一次性执行
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (instancetype)shareManager{

    static Tools *tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[self alloc] init];
    });
    
    return tools;
}

+ (instancetype)shareSyncTools {

    static Tools *tools;
    
    // 互斥锁
    @synchronized(self) {
        if (tools == nil) {
            tools = [[self alloc] init];
        }
    }
    return tools;
}

@end
