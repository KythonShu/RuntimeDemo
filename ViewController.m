//
//  ViewController.m
//  RuntimeDemo
//
//  Created by Kython Shu on 2017/3/26.
//  Copyright © 2017年 Kython Shu. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "UIFont+KSFont.h"
#import "UIView+Property.h"
#import "Test.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Test *test = [[Test alloc] init];

    objc_msgSend(test, @selector(function2));//实例方法
    
    objc_msgSend([Test class], @selector(function1));//类方法
    
    
    [test function3];
    
//    [test performSelector:@selector(function4) withObject:nil];
    
    UIView *view = [[UIView alloc] init];
    view.describe = @"这是个view";
    
    NSLog(@"----%@",view.describe);
}
@end
