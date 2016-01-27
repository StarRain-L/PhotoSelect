//
//  ViewController.m
//  PhotoSelectDemo
//
//  Created by AAA on 15/12/16.
//  Copyright © 2015年 easywed. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (nonatomic, strong)UIImagePickerController * picker;
@property (nonatomic, strong)NSMutableArray *sendPhotos;
@property (nonatomic, strong)PhotoSelect *selectView ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sendPhotos = [[NSMutableArray alloc]initWithCapacity:5];
    self.selectView = [[PhotoSelect alloc]initWithFrame:CGRectMake(15, 80, screenWidth-30, 200)];
    _selectView.selectPhotos = _sendPhotos;
    [self.view addSubview:self.selectView];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        NSLog(@"取消");
    }
    self.picker = [[UIImagePickerController alloc]init];
    self.picker.delegate = self;
    self.picker.allowsEditing = NO;
    switch (buttonIndex) {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:_picker animated:YES completion:nil];
            }
            break;
        case 1:{
            _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:_picker animated:YES completion:nil];
        }
            break;
        default:
            break;
    }

}
//相机相册获取
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    __block UIImage *chosedImage = nil;
    chosedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    NSData *imageData = UIImageJPEGRepresentation(chosedImage, 1.0);
    UIImage *image = [UIImage imageWithData:imageData];
     [_sendPhotos addObject:image];
   
    [picker dismissViewControllerAnimated:YES completion:^(){
        
        [_selectView.collectionView reloadData];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
