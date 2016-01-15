//
//  EWPhotoCell.h
//  EasyWedAPP
//
//  Created by AAA on 15/8/13.
//  Copyright (c) 2015年 easywed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EWPhotoCell : UICollectionViewCell
@property (nonatomic, strong)UIImage *photo;
@property (nonatomic, strong)UIImageView *photoImage;
@property (nonatomic, strong)UIButton    *deleteButn;
@property (nonatomic, strong)UIView      *addPhoto;
@property (nonatomic, strong)void(^deleteBtn)(NSInteger tag);             //全部
@property (nonatomic, strong)void(^addeBtn)();             //全部
@end
