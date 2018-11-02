//
//  KTSelectMajorViewController.m
//  SelectDemo
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018 wangjie. All rights reserved.
//
#define IS_IPHONE_X (SCREEN_HEIGHT == 812.0f) ? YES : NO
#define Height_NavContentBar 44.0f
#define Height_StatusBar (IS_IPHONE_X==YES)?44.0f: 20.0f
#define Height_NavBar    (IS_IPHONE_X==YES)?88.0f: 64.0f
#define defaultGreenColor  [UIColor colorWithRed:0/255.0 green:175/255.0 blue:107/255.0 alpha:1/1.0]
#import "KTSelectMajorViewController.h"
#import "KTSelectMajorCollectionViewCell.h"
#import "KTSelectMajorCollectionViewFlowLayout.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define Height_TabBar    (IS_IPHONE_X==YES)?83.0f: 49.0f
static NSString *indentifier_cell = @"cell";
static NSString *indentifier_header = @"header";

@interface KTSelectMajorViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic,strong)NSMutableArray * collectionArray;
@property (nonatomic,strong)UIButton * button;
@end

@implementation KTSelectMajorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
   


    
    
    self.collectionArray = [NSMutableArray array];
    //护士
    NSArray * arr1 = @[@"护士资格",
                       @"主管护师",
                       @"初级护师"];
    //药师
    NSArray * arr2 = @[@"执业中药师",
                       @"执业西药师"];
    //医师
    NSArray * arr3 = @[@"临床执业(助理)医师",
                       @"中医执业(助理)医师",
                       @"中西医执业(助理)医师",
                       @"口腔执业(助理)医师",
                       @"乡村全科执业助理医师",
                       @"主治医师(中级)"];
    [self.collectionArray addObject:arr1];
    [self.collectionArray addObject:arr2];
    [self.collectionArray addObject:arr3];
    [self createCollectionView];
    //底部确定按钮
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT - 200), SCREEN_WIDTH - 40, 40)];
    [self.collectionView addSubview:self.button];
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    self.button.backgroundColor = defaultGreenColor;
    
    [self.button.layer setMasksToBounds:YES];
    self.button.layer.cornerRadius = 8;
    [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - 创建collectionview
- (void)createCollectionView{
    KTSelectMajorCollectionViewFlowLayout * layout = [[KTSelectMajorCollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, (Height_NavBar), SCREEN_WIDTH, SCREEN_HEIGHT ) collectionViewLayout:layout];
    self.collectionView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];
    //注册cell
    [self.collectionView registerClass:[KTSelectMajorCollectionViewCell class] forCellWithReuseIdentifier:indentifier_cell];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:indentifier_header];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
}


//设置大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake((SCREEN_WIDTH - 20)/3, 40);
    }else{
        return CGSizeMake((SCREEN_WIDTH - 20)/2, 40);
    }
}




#pragma mark - 段头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:indentifier_header forIndexPath:indexPath];
    header.backgroundColor = UIColor.groupTableViewBackgroundColor;
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH, 30)];
    [header addSubview:label];
    
    switch (indexPath.section) {
        case 0:{
            label.text = @"护士";
            label.font = [UIFont systemFontOfSize:14.0f];
            [header addSubview:label];
        }
            break;
        case 1:{
            label.text = @"药师";
            label.font = [UIFont systemFontOfSize:14.0f];
            [header addSubview:label];
        }
            break;
        default:{
            label.text = @"医师";
            label.font = [UIFont systemFontOfSize:14.0f];
            [header addSubview:label];
        }
            break;
    }
    return header;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.collectionArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.collectionArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KTSelectMajorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier_cell forIndexPath:indexPath];
    cell.label.text = self.collectionArray[indexPath.section][indexPath.row];
   
    return cell;
   
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    KTSelectMajorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier_cell forIndexPath:indexPath];
    cell.label.text = self.collectionArray[indexPath.section][indexPath.row];
    self.majorString = cell.label.text;
    
  
    NSLog(@"点击了--%@",cell.label.text);

}

- (void)click:(UIButton *)sender{
    NSLog(@"最终选择的专业是--%@",self.majorString);
    
   
    
    if ([self.delegate respondsToSelector:@selector(passValue:)]) {
        [self.delegate passValue:self.majorString];
    }
    
    if (self.majorString.length > 0) {
        [self.navigationController popViewControllerAnimated:YES];

    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
