//
//  ViewController.m
//  06-Barrier
//
//  Created by Heaven on 16/1/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 数组
@property (nonatomic, strong) NSMutableArray *dataList;

// 全局队列
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataList = [[NSMutableArray alloc] init];
    _queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"开始加载");
    
    for (int i = 0; i < 10; i++) {
        //[self loadImage:i+1];
        [self loadPicture:i+1];
    }
}

// 由于 NSMutableArray 是非线程安全的，如果出现两个线程在同一时间向数组中添加对象，会出现程序崩溃的情况
// 最主要的应用场景，用在大量的数据 I/O 上！
- (void)loadImage:(int)index {

    dispatch_async(_queue, ^{
        // 模拟延时
        [NSThread sleepForTimeInterval:1.0];
        
        // 模拟从网络下载图片
        NSString *fileName = [NSString stringWithFormat:@"%02d.jpg", index % 10 + 1];
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [_dataList addObject:image];
        NSLog(@"加载成功-----第 %d 张图片", index);

    });
}

- (void)loadPicture:(int)index {

    dispatch_async(_queue, ^{
        // 模拟延时
        [NSThread sleepForTimeInterval:1.0];
        
        // 模拟从网络下载图片
        NSString *fileName = [NSString stringWithFormat:@"%02d.jpg", index % 10 + 1];
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        dispatch_barrier_async(_queue, ^{
            [_dataList addObject:image];
            NSLog(@"加载成功-----第 %d 张图片", index);
        });
        
        NSLog(@"下载完成 %@ %@", fileName, [NSThread currentThread]);
    });
}

@end
