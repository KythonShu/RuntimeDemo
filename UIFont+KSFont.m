//
//  UIFont+KSFont.m
//  RuntimeDemo
//
//  Created by Kython Shu on 2017/3/27.
//  Copyright © 2017年 Kython Shu. All rights reserved.
//

#import "UIFont+KSFont.h"

@implementation UIFont (KSFont)
+(void)load{

    Method systemMethod = class_getClassMethod(self, @selector(systemFontOfSize:));
    
    Method swizzedMethod = class_getClassMethod(self, @selector(ks_fontSize:));
    
    method_exchangeImplementations(systemMethod, swizzedMethod);
    
}

+ (UIFont *)ks_fontSize:(CGFloat)fontSize{
    UIFont *font = [UIFont ks_fontSize:fontSize];
    
    if (font) {
        NSLog(@"方法交换成功");
    }else{
        NSLog(@"方法交换失败");
    }
    
    return font;
}

@end
