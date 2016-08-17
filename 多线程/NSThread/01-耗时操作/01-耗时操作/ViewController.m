//
//  ViewController.m
//  01-耗时操作
//
//  Created by Heaven on 16/1/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"hello world";
    NSLog(@"str 变量在栈区的地址 %p - 内容的地址 %p", &str, str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 主线程操作
    [self longOperation];
    
    // 后台操作
    //[self performSelectorInBackground:@selector(longOperation) withObject:nil];
    
}

/**
 [NSThread currentThread] 是获取当前线程对象
 
 最常用的就是根据 number 判断是否是主线程
 
 number == 1 就是主线程
 number != 1 就是后台线程，提示：不必纠结 number 的具体数字
*/

// 操作
- (void)longOperation {
    
    // 跟踪当前线程
    NSLog(@"current thread is %@", [NSThread currentThread]);
    
    int largeNumber = 100 * 100;
    
    for (int i = 0; i < largeNumber; i++) {
        NSString *str = [NSString stringWithFormat:@"hello - %d", i];
        NSLog(@"%@", str);
    }
    
    NSLog(@"over");
    
    NSString *str = @"hello world";
    NSLog(@"str 变量在栈区的地址 %p - 内容的地址 %p", &str, str);
}

@end
