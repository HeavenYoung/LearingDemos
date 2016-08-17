//
//  ViewController.m
//  03-NSURLConnection-NSURLRequest
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

    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    
    // 2. request
    /**
     cachePolicy 缓存策略
     NSURLRequestUseProtocolCachePolicy = 0,                    默认缓存策略
     NSURLRequestReloadIgnoring（忽略）LocalCacheData = 1,        忽略本地缓存数据
     NSURLRequestReturnCacheDataElseLoad = 2,   有缓存，就返回缓存数据，否则加载
     NSURLRequestReturnCacheDataDontLoad = 3,   有缓存，就返回缓存数据，否则不加载
     
     timeoutInterval: 请求的超时时长，在指定的时间内，如果没有收到服务器的反馈，就认为失败
     系统默认 60s
     SDWebImage 超时时长 15s
     AFN 超时时长 60s
     */
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    // 3. 异步发送请求
    /**
     response 本质上是 NSHTTPURLResponse 从服务器获得的响应
     
     - URL: 有可能因为重定向，导致 URL 和请求的不一致
     - MIMEType: 请求数据的数据类型，服务器高速客户端
     与 Content-Type 等价的
     - textEncodingName：内容的编码方式 @"utf8"
     
     以下两个属性，通常用于开发下载：
     expectedContentLength  请求二进制数据的长度
     suggestedFilename      建议保存的文件名
     */

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (connectionError || data == nil) {
            NSLog(@"请检查网络");
            return ;
        }
        NSLog(@"%@-----%@------%@", response.URL, response.MIMEType, response.textEncodingName);
        [self.webView loadData:data MIMEType:response.MIMEType textEncodingName:response.textEncodingName baseURL:response.URL];
    }];
}

@end
