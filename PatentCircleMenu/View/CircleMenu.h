//
//  CircleMenu.h
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CircleMenuDelegate <NSObject>
- (void)clickCircleMenuItemAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber;
@end


@interface CircleMenu : UIView

@property(nonatomic, assign) id<CircleMenuDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
