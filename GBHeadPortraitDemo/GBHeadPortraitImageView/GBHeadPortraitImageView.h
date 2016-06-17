//
//  GBHeadPortraitImageView.h
//  MicroNetwork
//
//  Created by Lucas on 16/6/17.
//  Copyright © 2016年 Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HeadPortraitBlock)(UIImage *newImage);

@interface GBHeadPortraitImageView : UIImageView

@property (strong, nonatomic) HeadPortraitBlock block;

- (instancetype)initWithFrame:(CGRect)frame currentVC:(UIViewController *)currentVC resultBlock:(HeadPortraitBlock)block;
//对外单独点击事件（特殊位置点击使用）
- (void)alterHeadPortrait:(UITapGestureRecognizer *)gesture;

@end
