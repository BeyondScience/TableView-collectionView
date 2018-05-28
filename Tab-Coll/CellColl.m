//
//  CellColl.m
//  Tab-Coll
//
//  Created by Li Peixin on 2018/5/26.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "CellColl.h"

@implementation CellColl

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    UIImage *img = [UIImage imageNamed:@"timg.jpg"];
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:self.bounds];
    imgview.image = img;
    self.backgroundView = imgview;
    
    self.lbl = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    self.lbl.textAlignment = NSTextAlignmentCenter;
    self.lbl.textColor = [UIColor whiteColor];
    self.lbl.text = @"Hello";
    [self.contentView addSubview:self.lbl];
}


@end
