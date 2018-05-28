//
//  SecondViewController.m
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/25.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "SecondViewController.h"
#import "TableViewCell.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UICollectionView *collView;
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) NSMutableArray *arrData;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrData = [NSMutableArray arrayWithObjects:@"末",@"将",@"于",@"禁",@"愿",@"为",@"曹",@"家",@"世",@"代",@"赴",@"汤",@"蹈",@"火", nil];
    [self setupTabView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"text1" object:nil];
}

-(void)setupTabView{
    self.tabView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;

    self.tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];
    
    [self.tabView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell1"];
}

-(void)noti:(NSNotification *)noti{
    NSLog(@"noti===%@",noti.object);
}

#pragma mark --UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.arrData.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell1.arr = self.arrData;
        return cell1;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
           cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell.textLabel.text = self.arrData[indexPath.row];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150;
    }else{
        return 44;
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
