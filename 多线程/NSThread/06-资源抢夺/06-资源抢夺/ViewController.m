//
//  ViewController.m
//  06-资源抢夺
//
//  Created by Heaven on 16/1/7.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 总票数
@property (nonatomic, assign) int ticketCount;
// 全局锁对象
@property (nonatomic, strong) NSObject *lockObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _lockObj = [[NSObject alloc] init];
    _ticketCount = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //[self saleTickets];
    
    // 开线程
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    t1.name = @"售票员 A";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    t2.name = @"售票员 B";
    [t2 start];
}

- (void)saleTickets {
    while (YES) {
        // 休眠--模拟延时
        [NSThread sleepForTimeInterval:1.0];

        if (self.ticketCount > 0) {
            self.ticketCount--;
            NSLog(@"剩余票数 %d %@", self.ticketCount, [NSThread currentThread]);
        } else {
            NSLog(@"没票了 %@", [NSThread currentThread]);
            break;
        }

        @synchronized(self) {
            if (self.ticketCount > 0) {
                self.ticketCount--;
                NSLog(@"剩余票数 %d %@", self.ticketCount, [NSThread currentThread]);
            } else {
                NSLog(@"没票了 %@", [NSThread currentThread]);
                break;
            }
        }
    }
}

- (void)saleTicketsWithLock {

    while (YES) {
        // 休眠--模拟延时
        [NSThread sleepForTimeInterval:1.0];
        
        @synchronized(self) {
            if (self.ticketCount > 0) {
                self.ticketCount--;
                NSLog(@"剩余票数 %d %@", self.ticketCount, [NSThread currentThread]);
            } else {
                NSLog(@"没票了 %@", [NSThread currentThread]);
                break;
            }
        }
    }

}

@end
