//
//  SecCircleMenu.h
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SecCircleMenuDelegate <NSObject>
- (void)clickSecCircleMenuItemAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber;
@end

@interface SecCircleMenu : UIView
@property(nonatomic, assign) NSInteger itemCount;
@property(nonatomic, assign) id<SecCircleMenuDelegate> delegate;
- (void)showSecCircleMenu;
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
