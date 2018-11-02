//
//  KTSelectMajorViewController.h
//  SelectDemo
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018 wangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol KTSelectMajorViewControllerDelegate <NSObject>

-(void)passValue:(NSString *)path;


@end
@interface KTSelectMajorViewController : UIViewController
@property (nonatomic,strong)NSString * majorString;
@property (nonatomic, weak)id <KTSelectMajorViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
