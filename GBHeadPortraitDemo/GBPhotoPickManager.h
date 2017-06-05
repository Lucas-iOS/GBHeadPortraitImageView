//
//  GBPhotoPickManager.h
//  GBHeadPortraitDemo
//
//  Created by Lucas on 2017/6/5.
//  Copyright © 2017年 Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kPickerTypePhoto,
    kPickerTypeCamera,
} kPickerType;

typedef void(^ImageBlock)(NSDictionary *infoDict, BOOL isCancel);

@interface GBPhotoPickManager : NSObject

+ (instancetype)shareInstance;

- (void)presentPicker:(kPickerType)pickerType currentVC:(UIViewController *)currentVC imageBlock:(ImageBlock)imageBlock;

@end
