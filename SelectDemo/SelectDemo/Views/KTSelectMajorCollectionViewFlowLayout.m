//
//  KTSelectMajorCollectionViewFlowLayout.m
//  SelectDemo
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018 wangjie. All rights reserved.
//

#import "KTSelectMajorCollectionViewFlowLayout.h"

@implementation KTSelectMajorCollectionViewFlowLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    //头视图大小
    self.headerReferenceSize = CGSizeMake(0,30);
    //调节段间距
    self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
//    self.sectionHeadersPinToVisibleBounds = YES;
//    self.sectionFootersPinToVisibleBounds = NO;
    
}

@end
