//
//  SOCR.m
//  pppDemo
//
//  Created by tianNanYiHao on 2018/7/11.
//  Copyright © 2018年 tianNanYiHao. All rights reserved.
//

#import "SOCR.h"
#import "OCRViewController.h"
@implementation SOCR


- (void)loadSOCRwith:(UIViewController*)currentVC{
    
    
    OCRViewController *vc = [[OCRViewController alloc] init];
    
    [currentVC presentViewController:vc animated:YES completion:nil];
    
    
}

@end
