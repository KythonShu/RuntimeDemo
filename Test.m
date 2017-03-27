//
//  Test.m
//  RuntimeDemo
//
//  Created by Kython Shu on 2017/3/26.
//  Copyright © 2017年 Kython Shu. All rights reserved.
//

#import "Test.h"
#import <objc/message.h>
@implementation Test
+(void)function1{
    NSLog(@"这是一个类方法");
}
-(void)function2{

    NSLog(@"这是一个实例方法");
}


+(BOOL)resolveInstanceMethod:(SEL)sel{
//动态添加没有实现的方法
    if (sel == @selector(function3)) {
        class_addMethod(self, sel, (IMP)functionIMP, "v@:");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
    
}
//定义一个函数，函数名可以随便写，只要与resolveInstanceMethod:方法当中class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)的<#IMP imp#>一致即可
/*
 cls:要添加方法的类
 SEL:要添加的方法编号，也就是方法名
 IMP:方法实现,函数入口,函数名
 types:方法类型
*/

void functionIMP(id self, SEL _cmd){

    NSLog(@"调用functionIMP %@ %@",self,NSStringFromSelector(_cmd));
}

/*如果我们动态添加的方法带有参数，那么我们需要这样写：
void functionIMP(id self, SEL _cmd, id param){
    NSLog(@"调用functionIMP %@ %@ %@",self,NSStringFromSelector(_cmd),param);
}
 */
@end
