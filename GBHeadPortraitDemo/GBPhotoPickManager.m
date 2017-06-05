//
//  GBPhotoPickManager.m
//  GBHeadPortraitDemo
//
//  Created by Lucas on 2017/6/5.
//  Copyright © 2017年 Lucas. All rights reserved.
//

#import "GBPhotoPickManager.h"

@interface GBPhotoPickManager () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, weak) UIViewController *currentVC;
@property (nonatomic, copy) ImageBlock imageBlock;

@end

@implementation GBPhotoPickManager

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static GBPhotoPickManager *pickManager;
    dispatch_once(&once, ^{
        pickManager = [[GBPhotoPickManager alloc] init];
    });
    
    return pickManager;
}


- (instancetype)init {
    self = [super init];
    if(self){
        if(!_imagePicker){
            _imagePicker = [[UIImagePickerController alloc] init];
        }
    }
    
    return self;
}



- (void)presentPicker:(kPickerType)pickerType currentVC:(UIViewController *)currentVC imageBlock:(ImageBlock)imageBlock {
    _currentVC = currentVC;
    _imageBlock = imageBlock;
    if(pickerType == kPickerTypeCamera){
        // 拍照
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            _imagePicker.delegate = self;
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            _imagePicker.allowsEditing = YES;
            _imagePicker.showsCameraControls = YES;
            UIView *view = [[UIView  alloc] init];
            view.backgroundColor = [UIColor grayColor];
            _imagePicker.cameraOverlayView = view;
            [_currentVC presentViewController:_imagePicker animated:YES completion:nil];
        }else{
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"相机不可用" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [alertV show];
        }
    } else if(pickerType == kPickerTypePhoto) {
        // 相册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
            _imagePicker.delegate = self;
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            _imagePicker.allowsEditing = YES;
            [_currentVC presentViewController:_imagePicker animated:YES completion:nil];
        }else{
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"" message:@"相册不可用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [alertV show];
        }
        
    }
}




#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [_currentVC dismissViewControllerAnimated:YES completion:^{
        _imageBlock(info, NO);
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [_currentVC dismissViewControllerAnimated:YES completion:^{
        _imageBlock(nil, YES);
    }];
}

@end
