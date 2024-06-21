//
//  TertCircleMenuLayout.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/19.
//

#import "TertCircleMenuLayout.h"

static NSInteger kItemRadius = 30;

@interface TertCircleMenuLayout()

@property(nonatomic, strong) NSMutableArray *attributeArray;

@end

@implementation TertCircleMenuLayout

- (void)prepareLayout{
    
    self.itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    self.attributeArray = [[NSMutableArray alloc]init];
    
    CGFloat radius = MIN(self.collectionView.frame.size.width,self.collectionView.frame.size.height)/2;
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    
    for(int i = 0; i < self.itemCount; i++){
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        attribute.size = CGSizeMake(kItemRadius, kItemRadius);
        
        //计算每个item的中点坐标 获取到item的中点减去自身的半径才是item的中点
        CGFloat x = center.x + cosf(2 * M_PI / self.itemCount * i)*(radius - kItemRadius/2);
        CGFloat y = center.y + sinf(2 * M_PI / self.itemCount * i)*(radius - kItemRadius/2);

        attribute.center = CGPointMake(x, y);
        [self.attributeArray addObject:attribute];
    }
}

//设置内容区域的大小
- (CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

//返回设置数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributeArray;
}

@end
