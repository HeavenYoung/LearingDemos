//
//  CTDisplayView.m
//  coreText
//
//  Created by Heaven on 15/12/15.
//  Copyright © 2015年 Heaven. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>

@implementation CTDisplayView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 1. 获取上下文路径
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2. 设置
    // 旋转
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    // 平移
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    // 缩放
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 3. 创建绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    // 4. 设置属性文本
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"hello world"
                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                                     " 测试设置不同的绘制区域带来的界面变化。"
                                     ];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    // 5. 绘制
    CTFrameDraw(frame, context);
    
    // 6. 释放
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    
//    // 1. 获取上下文路径
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // 2. 设置
//    // 旋转
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    // 平移
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    // 缩放
//    CGContextScaleCTM(context, 1.0, -1.0);
//    
//    // 3. 创建可变路径
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    
//    // 4. 设置属性文本
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"hello world"
//                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
//                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
//                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
//                                     " 测试设置不同的绘制区域带来的界面变化。"
//                                     ];
//    
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
//                                                CFRangeMake(0, [attString length]), path, NULL);
//    
//    // 5. 绘制
//    CTFrameDraw(frame, context);
//    
//    // 6. 释放
//    CFRelease(frame);
//    CFRelease(path);
//    CFRelease(framesetter);
//}

@end
