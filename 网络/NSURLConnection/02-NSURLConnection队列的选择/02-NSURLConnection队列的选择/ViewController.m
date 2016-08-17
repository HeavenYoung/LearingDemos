//
//  ViewController.m
//  02-NSURLConnection队列的选择
//
//  Created by Heaven on 16/1/14.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {

    // 1.url
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    
    // 2. request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 告诉服务器一些其他信息
    [request setValue:@"iPhone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    
    /**
     sendAsynchronousRequest 本身就是异步的，NSURLConnection会开启一条线程，发送网络请求
     * queue: 队列 -> 负责调度 completionHandler 的队列
     - 队列如何选择？
     - 如果接受到数据，直接更新UI，选择主队列
     - 如果要做耗时操作，举个栗子，下载一个 zip，解压缩应该开启线程执行，选择新建一个队列
     * completionHandler: 完成的回调`block`，表示接收到服务器的响应数据
     */
    // 3. 异步发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        [self.webView loadHTMLString:html baseURL:url];
        
    }];
    
}

@end
