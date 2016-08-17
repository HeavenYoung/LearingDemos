//
//  ViewController.m
//  03-自定义操作
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import "DownloadImageOperation.h"

@interface ViewController ()
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
@end

@implementation ViewController

- (NSOperationQueue *)downloadQueue {
    if (_downloadQueue == nil) {
        _downloadQueue = [[NSOperationQueue alloc] init];
    }
    return _downloadQueue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1. 实例化对象
    DownloadImageOperation *op = [[DownloadImageOperation alloc] init];
    
    // 2. 将操作添加到队列中
    [self.downloadQueue addOperation:op];
}

@end
