//
//  DownloadImageOperation.m
//  03-自定义操作
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "DownloadImageOperation.h"

@implementation DownloadImageOperation

/**
    在自定义操作中，把操作放到队列中之后，如果重写了main start 会调用这两个方法
 */

// 重写main
- (void)main {
    @autoreleasepool {
        [super main];
        NSLog(@"执行操作----%s", __FUNCTION__);
    }
}

// 重写 start
- (void)start {
    // 如果不调用start的父类方法 ，main 不会走
    [super start];
    NSLog(@"%s", __FUNCTION__);
}

@end
