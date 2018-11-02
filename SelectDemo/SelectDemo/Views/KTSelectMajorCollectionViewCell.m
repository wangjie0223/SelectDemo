//
//  KTSelectMajeoTwoCollectionViewCell.m
//  SelectDemo
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018 wangjie. All rights reserved.
//
#define defaultGreenColor  [UIColor colorWithRed:0/255.0 green:175/255.0 blue:107/255.0 alpha:1/1.0]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "KTSelectMajorCollectionViewCell.h"

@implementation KTSelectMajorCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5,  self.frame.size.width - 10, 30)];
    [self addSubview:self.label];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = UIColor.darkGrayColor;
    self.label.font = [UIFont systemFontOfSize:13.0f];
    [self.label.layer setMasksToBounds:YES];
    [self.label.layer setCornerRadius:8];
    self.label.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.label.layer.borderWidth = 0.5f;
    
}


- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.label.backgroundColor = selected ? defaultGreenColor : UIColor.whiteColor;
    self.label.textColor = selected ? [UIColor whiteColor] : UIColor.darkGrayColor;
    
}

@end
