//
//  PhotoSelect.m
//  PhotoSelectDemo
//
//  Created by AAA on 15/12/16.
//  Copyright © 2015年 easywed. All rights reserved.
//

#import "PhotoSelect.h"
#import "EWPhotoCell.h"
#import "ViewController.h"
#define ShowPhotoH   276*EWScaleFrame       //照片显示图片的高度
#define photoWidth  (screenWidth-10*5)/3
#define photoHeight (screenWidth-10*5)/3
#define cellIdentifier @"EWPhotoCell"

@interface PhotoSelect()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation PhotoSelect

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(self.frame.size.width, ShowPhotoH)];//设置cell的尺寸
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//设置其布局方向
    flowLayout.minimumLineSpacing =  0.0f;
    flowLayout.headerReferenceSize =CGSizeMake(0, 0);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, ShowPhotoH) collectionViewLayout:flowLayout];
    [_collectionView registerClass:[EWPhotoCell class] forCellWithReuseIdentifier:cellIdentifier];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.pagingEnabled = YES;
    
    [self addSubview:_collectionView];
    // 初始化每一个item的相关属性
    // 1.设置间隙
    // 设置水平间隙
    flowLayout.minimumInteritemSpacing = 10;
    // 设置垂直间隙
    flowLayout.minimumLineSpacing = 10;
    // 设置全局左右间隙
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    
    // 2.设置宽高
    flowLayout.itemSize = CGSizeMake(photoWidth, photoWidth);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.selectPhotos.count+1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EWPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //    NSLog(@"%d",indexPath.item);
    __weak typeof(self) weakself = self;
    if (self.selectPhotos.count == indexPath.item) {
        cell.photoImage.hidden = YES;
        cell.deleteButn.hidden = YES;
        if (indexPath.item == 10) {
            cell.addPhoto.hidden = YES;
        }else{
            cell.addPhoto.hidden = NO;
            cell.addeBtn = ^(){
                NSLog(@"添加照片");
                [weakself addPhotoBtn];
            };
            cell.deleteBtn = ^(NSInteger tag){
                NSLog(@"删除照片");
            };

        }
    }else{
        cell.addPhoto.hidden = YES;
        cell.photoImage.hidden = NO;
        cell.deleteButn.hidden = NO;
        cell.tag =indexPath.row;
        cell.photo =[_selectPhotos objectAtIndex:indexPath.item];
    }
        
    return cell;
}

-(void)addPhotoBtn{
    ViewController *vc = (ViewController *)[CustomViewClass getMyVC:self];
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:nil
                                    delegate:vc
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"打开照相机", @"从相册获取",nil];
    
    [myActionSheet showInView:self];

}

@end
