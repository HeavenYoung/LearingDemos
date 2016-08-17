//
//  ViewController.m
//  POST上传
//
//  Created by Heaven on 15/8/3.
//  Copyright (c) 2015年 Heaven. All rights reserved.
//

#import "ViewController.h"

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"" ofType:nil];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    //[self uploadFile:<#(NSString *)#> fileName:<#(NSString *)#> fileData:fileData]
}

#define boundary    @"itheima-upload"
- (void)uploadFile:(NSString *)fieldName fileName:(NSString *)fileName fileData:(NSData *)fileData {

    // 1. URL
    NSURL *url = [NSURL URLWithString:@""];
    
    // 2. request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:15];
    // 2.1 设置 content－type
    NSString *type = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:type forHTTPHeaderField:@"Content-Type"];
    
    // 2.2 设置数据体
    request.HTTPBody = [self formData:fileName fileName:fieldName fileData:fileData];
    
    // 3. connection
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);
        
    }];
}

- (NSData *)formData:(NSString *)fieldName fileName:(NSString *)fileName fileData:(NSData *)fileData {
    
    NSMutableData *dataM = [NSMutableData data];
    
    // 拼接数据
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendFormat:@"--%@\r\n", boundary];
    [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, fileName];
    [strM appendString:@"Content-Type: application/octet-stream\r\n\r\n"];
    
    [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
    [dataM appendData:fileData];
    
    NSString *tail = [NSString stringWithFormat:@"\r\n--%@--", boundary];
    [dataM appendData:[tail dataUsingEncoding:NSUTF8StringEncoding]];
    
    return dataM.copy;
}

@end
