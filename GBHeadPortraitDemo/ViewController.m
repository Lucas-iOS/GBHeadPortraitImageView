//
//  ViewController.m
//  GBHeadPortraitDemo
//
//  Created by Lucas on 16/6/18.
//  Copyright © 2016年 Lucas. All rights reserved.
//

#import "ViewController.h"
#import "GBPhotoPickManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)photoClick:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[GBPhotoPickManager shareInstance] presentPicker:kPickerTypePhoto currentVC:self imageBlock:^(NSDictionary *infoDict, BOOL isCancel) {
            [sender setBackgroundImage:[infoDict valueForKey:UIImagePickerControllerOriginalImage] forState:UIControlStateNormal];
        }];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [[GBPhotoPickManager shareInstance] presentPicker:kPickerTypeCamera currentVC:self imageBlock:^(NSDictionary *infoDict, BOOL isCancel) {
            [sender setBackgroundImage:[infoDict valueForKey:UIImagePickerControllerOriginalImage] forState:UIControlStateNormal];
        }];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
