//
//  CollectionViewCell.h
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, copy) NSArray *arr;
@property (nonatomic, copy) dispatch_block_t selectCell;

@end
