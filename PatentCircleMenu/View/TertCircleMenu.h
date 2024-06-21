//
//  TertCircleMenu.h
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TertCircleMenu : UIView
@property(nonatomic, assign) NSInteger itemCount;
- (void)showTertCircleMenu;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
