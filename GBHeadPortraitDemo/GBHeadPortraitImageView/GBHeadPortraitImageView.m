//
//  GBHeadportraitImageView.m
//  MicroNetwork
//
//  Created by Lucas on 16/6/17.
//  Copyright © 2016年 Lucas. All rights reserved.
//

#import "GBHeadPortraitImageView.h"

@interface GBHeadPortraitImageView () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) UIViewController *currentVC;

@end

@implementation GBHeadPortraitImageView

- (instancetype)initWithFrame:(CGRect)frame currentVC:(UIViewController *)currentVC resultBlock:(HeadPortraitBlock)block {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        self.currentVC = currentVC;
        self.block = block;
    }
    return self;
}

- (void)initialize {
    self.userInteractionEnabled = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                               action:@selector(alterHeadPortrait:)];
    [self addGestureRecognizer:singleTap];
}

- (void)alterHeadPortrait:(UITapGestureRecognizer *)gesture {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];

        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self.currentVC presentViewController:PickerImage animated:YES completion:nil];
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self.currentVC presentViewController:PickerImage animated:YES completion:nil];
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self.currentVC presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    self.image = newPhoto;
    self.block(newPhoto);
    [self.currentVC dismissViewControllerAnimated:YES completion:nil];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
}



@end
