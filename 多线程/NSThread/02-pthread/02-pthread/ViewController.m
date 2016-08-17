//
//  ViewController.m
//  02-pthread
//
//  Created by Heaven on 16/1/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self pthread];

}

// pthread 操作
- (void)pthread {

    /**
     第一个参数：为指向线程标识符的指针
     C 语言中，没有对象，是通过结构体来实现的，不需要使用 *
     如果使用 C 语言的框架，定义类型，通常是 _t 或者 Ref 结尾
     
     第二个参数：用来设置线程属性
     
     第三个参数：是线程运行函数的起始地址
     函数名就是指向函数在内存中的地址
     
     第四个参数：是运行函数的参数
     */
    
    // 线程标识符
    pthread_t pthreadID = NULL;
    
    // 函数参数
    NSString *str = @"hello world";
    
    // 创建一个线程,若线程创建成功，则返回0。若线程创建失败，则返回出错编号
    int pthread = pthread_create(&pthreadID, NULL, operation, (__bridge void *)(str));
    
    if (pthread == 0) {
        NSLog(@"success");
    } else {
        NSLog(@"error");
    }

}

// 由线程执行的函数
void * operation(void * param) {
    
    NSString *str = (__bridge NSString *)(param);
    
    NSLog(@"%@ - %@", [NSThread currentThread], str);
    
    return NULL;
}

@end
