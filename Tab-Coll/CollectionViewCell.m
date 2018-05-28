//
//  CollectionViewCell.m
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, self.bounds.size.width - 40, self.bounds.size.height) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.tabView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *shape = [CAShapeLayer layer];
//    shape.path = path.CGPath;
//    self.tabView.layer.mask = shape;
    [self addSubview:self.tabView];
}

#pragma mark --UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tabCell"];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectCell) {
        self.selectCell();
    }
}



@end
