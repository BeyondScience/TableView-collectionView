//
//  ViewController.m
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "SecondViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) UICollectionView *collView;

@property (nonatomic, strong) NSMutableArray *arrData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.arrData = [NSMutableArray arrayWithObjects:@"name00",@"name01",@"name02",@"name03",@"name04", nil];
    
    [self setupCollView];
}

-(void)setupCollView{

    self.collView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    self.collView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    self.collView.backgroundColor = [UIColor cyanColor];
    self.collView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    [self.collView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"collCell0"];
    [self.collView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collCell1"];
    
    [self.collView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header0"];
    [self.view addSubview:self.collView];
    
    self.collView.delegate = self;
    self.collView.dataSource = self;
}

#pragma mark --UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        CollectionViewCell *cell0 = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell0" forIndexPath:indexPath];
        cell0.arr = self.arrData;
        [cell0 setSelectCell:^{
            [self.navigationController pushViewController:[SecondViewController new] animated:YES];
        }];
        
        return cell0;
    }else{
        UICollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell1" forIndexPath:indexPath];
        cell1.backgroundColor = [UIColor orangeColor];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:cell1.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *shape = [CAShapeLayer layer];
        shape.path = path.CGPath;
        cell1.layer.mask = shape;
        
        return cell1;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return CGSizeMake(self.view.bounds.size.width, 100);
    }else{
        return CGSizeMake(150, 180);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.bounds.size.width, 100);
    }else{
        return CGSizeMake(self.view.bounds.size.width, 40);
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header0" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:headerView.bounds];
        imgView.image = [UIImage imageNamed:@"timg.jpg"];
        [headerView addSubview:imgView];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:headerView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    headerView.layer.mask = shape;
    
    return headerView;
}

















@end
