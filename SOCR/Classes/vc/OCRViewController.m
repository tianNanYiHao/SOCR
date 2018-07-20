//
//  OCRViewController.m
//  pppDemo
//
//  Created by tianNanYiHao on 2018/7/11.
//  Copyright © 2018年 tianNanYiHao. All rights reserved.
//

#import "OCRViewController.h"

#import "Masonry.h"
//a.导入通付盾活体识别头文件
#import <PayEgisFace/PayegisFaceSDK.h>
@interface OCRViewController ()
@property (nonatomic, strong) PayegisFaceSDK *sdk;
@property (nonatomic, strong) UIImageView *imgV;
@end

@implementation OCRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self createUI];
    [self initPayegisFaceSDK];
    
}

- (void)createUI{
    
    UIView *baseView = [[UIView alloc] init];
    baseView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:baseView];
    
    [baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"活体识别一下" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(baseView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"返回上级页面" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:btn2];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(baseView.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
    self.imgV = [[UIImageView alloc] init];
    [self.view addSubview:self.imgV];
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(baseView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    
}

- (void)click{
    
    [self startMiniFace];
    
}

- (void)click2{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)initPayegisFaceSDK{
    
    //b.初始化通付盾face活体检测SDK
    self.sdk = [PayegisFaceSDK shareInstance];
    NSDictionary *dic = @{PayegisAuthSDKFaceName:@"sandbao-face-ios",
                          PayegisAuthSDKAppID:@"8cf3d083462145af",
                          PayegisAuthSDKAppKEY:@"927a080609df48649d5506b6ba501916"
                          };
    NSMutableDictionary *context = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    [self.sdk initSDK:context completionBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark 通付盾活体识别SDK启用
- (void)startMiniFace{
    //调用通付盾活体识别 (MINI Face)
    __weak typeof(self) weakself = self;
    [self.sdk startLivenessAction:1 untilFinish:YES completion:^(UIImage *returnImage) {
        __strong typeof(weakself) strongself = weakself;
        strongself.imgV.image = returnImage;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
