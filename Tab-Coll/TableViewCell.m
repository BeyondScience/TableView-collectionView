//
//  TableViewCell.m
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "TableViewCell.h"
#import "CellColl.h"


@interface TableViewCell() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collView;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.arr = [NSMutableArray array];
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    self.collView.contentInset = UIEdgeInsetsMake(5, 10, 5, 10);
    self.collView.backgroundColor = [UIColor lightGrayColor];
    [self.collView registerClass:[CellColl class] forCellWithReuseIdentifier:@"cell000"];
    self.collView.delegate = self;
    self.collView.dataSource = self;
    [self addSubview:self.collView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.collView.frame = self.bounds;
}

#pragma mark --UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CellColl *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell000" forIndexPath:indexPath];
    cell.lbl.text = [NSString stringWithFormat:@"%@",self.arr[indexPath.row]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, self.bounds.size.height-20);
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    cell.layer.mask = shape;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CellColl *cell = (CellColl *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *text = cell.lbl.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"text1" object:[NSString stringWithFormat:@"%@",text]];
}

@end
