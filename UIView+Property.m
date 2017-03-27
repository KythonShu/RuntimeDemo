//
//  UIView+Property.m
//  RuntimeDemo
//
//  Created by Kython Shu on 2017/3/27.
//  Copyright © 2017年 Kython Shu. All rights reserved.
//

#import "UIView+Property.h"
#import <objc/message.h>

@implementation UIView (Property)
-(void)setDescribe:(NSString *)describe{
    

    objc_setAssociatedObject(self, @"des", describe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);


}
- (NSString *)describe{
    return objc_getAssociatedObject(self, @"des");
}
@end
