//
//  EWPhotoCell.m
//  EasyWedAPP
//
//  Created by AAA on 15/8/13.
//  Copyright (c) 2015年 easywed. All rights reserved.
//

#import "EWPhotoCell.h"

@interface EWPhotoCell()

@end;
@implementation EWPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _photoImage.contentMode = UIViewContentModeScaleAspectFill;
        _photoImage.layer.masksToBounds = YES;
        [self addSubview:_photoImage];
        _deleteButn = [[UIButton alloc]init];
        CGFloat side = 20*EWScaleFrame;
        _deleteButn.frame = CGRectMake(self.width-side, 0, side, side);
        [_deleteButn setBackgroundImage:[UIImage imageNamed:@"compose_location_icon_delete"] forState:UIControlStateNormal];
        [_deleteButn addTarget:self action:@selector(deletePhot:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteButn];
        _addPhoto = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width,self.height+15)];
        UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,  self.width,  self.width)];
        [add setBackgroundImage:[UIImage imageNamed:@"compose_pic_add"] forState:UIControlStateNormal];
        [add addTarget:self action:@selector(addPhotoBtn) forControlEvents:UIControlEventTouchUpInside];
        [_addPhoto addSubview:add];
        UILabel *numL = [[UILabel alloc]init];
        CGRect frame = CGRectMake(-10, CGRectGetMaxY(add.frame)+5,  self.width+20, 25);
        [numL lableFrame:frame FontName:@"Arial" FontSize:12 title_Color:[UIColor grayColor] BgColor:[UIColor clearColor] TextAlignment:1];
        numL.text = @"共可选10张图片";
        [_addPhoto addSubview:numL];
        [self addSubview:_addPhoto];
      
    }
    return self;
}
-(void)setPhoto:(UIImage *)photo{
    _photoImage.image = photo;
    _deleteButn.tag = self.tag;
}
//删除照片
-(void)deletePhot:(UIButton *)btn{
    if (self.deleteBtn) {
        self.deleteBtn(btn.tag);
    }
}
//添加照片
-(void)addPhotoBtn{
    if (self.addeBtn) {
        self.addeBtn();
    }
}
@end
