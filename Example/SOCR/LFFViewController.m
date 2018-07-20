//
//  LFFViewController.m
//  SOCR
//
//  Created by tianNanYiHao on 07/20/2018.
//  Copyright (c) 2018 tianNanYiHao. All rights reserved.
//

#import "LFFViewController.h"
#import <SOCR/SOCR.h>
@interface LFFViewController ()

@end

@implementation LFFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SOCR *s = [[SOCR alloc] init];
    [s loadSOCRwith:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
