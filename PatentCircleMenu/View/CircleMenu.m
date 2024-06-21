//
//  CircleMenu.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/18.
//

#import "CircleMenu.h"
#import "CircleMenuLayout.h"
#import "Masonry.h"

static NSString *kCircleCellID = @"CircleCellID";
static NSInteger kItemRadius = 50;
static NSInteger kItemNumber = 10;

@interface CircleMenu()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *menuCollectionView;

@end

@implementation CircleMenu

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    //创建一个流水布局
    CircleMenuLayout *layout = [[CircleMenuLayout alloc]init];
    //设置竖直滚动方向（默认是竖直方向）
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.menuCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.menuCollectionView.backgroundColor = [UIColor whiteColor];
    
    //self.menuCollectionView.userInteractionEnabled = NO;
    
    //self.menuCollectionView.scrollsToTop = NO;
    //self.menuCollectionView.pagingEnabled = NO;
    self.menuCollectionView.dataSource = self;
    self.menuCollectionView.delegate = self;
    
    [self.menuCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCircleCellID];
    
    [self addSubview:self.menuCollectionView];
    
    [self.menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kItemNumber;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCircleCellID forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = kItemRadius/2;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickCircleMenuItemAtIndex:andMenuItemNumber:)]){
        [self.delegate clickCircleMenuItemAtIndex:indexPath.row andMenuItemNumber:kItemNumber];
    }
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//
//    for (UICollectionViewCell *cell in self.menuCollectionView.visibleCells) {
//        CGPoint newPoint = [self convertPoint:point toView:cell];
//        //在cell里面
//        if([cell pointInside:newPoint withEvent:event]){
//            return cell;
//        }
//    }
//    return nil;
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL flag = NO;
    for (UICollectionViewCell *cell in self.menuCollectionView.visibleCells) {
        if(CGRectContainsPoint(cell.frame, point)){
            flag = YES;
            break;
        }
    }
    return  flag;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"CircleMenu");
}

@end
