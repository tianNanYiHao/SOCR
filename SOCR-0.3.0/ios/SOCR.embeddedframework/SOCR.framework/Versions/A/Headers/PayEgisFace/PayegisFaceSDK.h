//
//  PayegisAuthSDK.h
//  PayEgisAuthentication
//
//  Created by 庄逸涛 on 2017/9/9.
//  Copyright © 2017年 jian.yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// 活体检测动作
typedef NS_ENUM(NSInteger, PEFaceLivenessActionType) {
    PEFaceLivenessActionTypeLiveEye = 0,// 眨眼
    PEFaceLivenessActionTypeLiveMouth = 1, // 张嘴
    PEFaceLivenessActionTypeLiveYawRight = 2, // 向右摇头
    PEFaceLivenessActionTypeLiveYawLeft = 3, // 向左摇头
    PEFaceLivenessActionTypeLivePitchUp = 4, // 抬头
    PEFaceLivenessActionTypeLivePitchDown = 5 // 低头
};


extern NSString *const PayegisAuthSDKFaceName ;
extern NSString *const PayegisAuthSDKAppID ;
extern NSString *const PayegisAuthSDKAppKEY ;

// 活体检测页面主题颜色
extern NSString *const  FaceRemindLabelColor;
extern NSString *const  FaceCircleColor;
extern NSString *const  FaceCountDownColor;
extern NSString *const  FaceCountDownLabelColor;


// 初始化SDK完成回调
typedef void (^PayegisAuthInitCompletionBlock)(NSError *error);

// 活体检测完回调Block
typedef void (^LivenessCompletionBlock)( UIImage *returnImage);


@interface PayegisFaceSDK : NSObject

// 客户申请的APPID
@property (nonatomic , strong) NSString *appID;

// 客户申请的APPKey
@property (nonatomic , strong) NSString *appKey;


+ (instancetype) shareInstance;

/**
 初始化sdk
 **/
- (void) initSDK : (NSMutableDictionary *) context completionBlock:(PayegisAuthInitCompletionBlock)completionBlock;


/**
 活体检测调用
 
 @param count 随机活体个数 0 < count  < 7
 @param completionBlock 活体检测完返回的数据
 */
-(void)startLivenessAction:(NSInteger) count completion:(LivenessCompletionBlock)completionBlock;

/**
 活体检测调用(成功获取图片后才退出)
 
 @param count 随机活体个数 0 < count  < 7
 @param untilFinish 直到成功才退出
 @param completionBlock 活体检测完返回的数据
 */
-(void)startLivenessAction:(NSInteger) count untilFinish:(BOOL)untilFinish  completion:(LivenessCompletionBlock)completionBlock;

/**
 活体检测调用
 配合Pro版使用，Mini版不建议使用
 
 @param count 随机个数
 @param token 事务号
 @param closeBlock 关闭按钮回调
 @param completionBlock 完成回调
 */
-(void)startLivenessAction:(NSInteger) count token:(NSString *)token closeBlock:(void(^)(BOOL)) closeBlock completion:(LivenessCompletionBlock)completionBlock;

/**
 活体检测调用
 
 @param actionsArray 动作数组 (不允许重复动作)
 @param randomBool 是否随机动作
 @param completionBlock 活体检测完回调返回数据
 */
- (void) startLivenessAction:(NSArray *) actionsArray randomBool:(BOOL)randomBool  completionBlock:(LivenessCompletionBlock) completionBlock;


#pragma mark - 自定义导航栏颜色


/**
 活体检测页面颜色设置
 
 @param dictionary 存放相关控件的颜色
 
 FaceRemindLabelColor 活体检测文字提示颜色
 FaceCircleColor 活体检测圆圈颜色
 FaceCountDownColor 活体检测倒计时颜色
 FaceCountDownLabelColor 会提检测倒计时文字颜色
 */
- (void) setFaceLivessTheme:(NSDictionary *) dictionary;

@end
