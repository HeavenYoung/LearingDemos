//
//  DownloadImageOperation.h
//  03-自定义操作
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadImageOperation : NSOperation
///  下载图像的 URL
@property (nonatomic, copy) NSString *URLString;
///  定义完成回调，注意不要使用 completionBlock
@property (nonatomic, copy) void (^finishedBlock)(UIImage *image);
@end
