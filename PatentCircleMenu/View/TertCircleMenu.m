//
//  TertCircleMenu.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/19.
//

#import "TertCircleMenu.h"
#import "TertCircleMenuLayout.h"
#import "Masonry.h"

static NSString *kCircleCellID = @"SecCircleCellID";
static NSInteger kItemRadius = 30;

@interface TertCircleMenu()<UICollectionViewDelegate,UICollectionViewDataSource>

//@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) UICollectionView *menuCollectionView;

@end

@implementation TertCircleMenu

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.itemCount = 10;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
//    self.containerView = [[UIView alloc]init];
//    self.containerView.backgroundColor = [UIColor blackColor];
//    self.containerView.alpha = 0.2;
    
    //创建一个流水布局
    TertCircleMenuLayout *layout = [[TertCircleMenuLayout alloc]init];
    //设置竖直滚动方向（默认是竖直方向）
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.menuCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    //self.menuCollectionView.backgroundColor = [UIColor clearColor];
    self.menuCollectionView.backgroundColor = [UIColor blackColor];
    //self.menuCollectionView.scrollsToTop = NO;
    //self.menuCollectionView.pagingEnabled = NO;
    self.menuCollectionView.dataSource = self;
    self.menuCollectionView.delegate = self;
    
    [self.menuCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCircleCellID];
    
//    [self addSubview:self.containerView];
    [self addSubview:self.menuCollectionView];
    
    
    [self.menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCircleCellID forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = kItemRadius/2;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}


#pragma mark - 显示界面
- (void)showTertCircleMenu{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.6;
        [self.menuCollectionView reloadData];
    }];
}

#pragma mark - 隐藏界面
- (void)dismiss{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        [self removeFromSuperview];
        [self.menuCollectionView removeFromSuperview];
    } completion:^(BOOL finished) {

    }];
}

@end

