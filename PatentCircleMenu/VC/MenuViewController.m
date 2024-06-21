//
//  MenuViewController.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/18.
//

#import "MenuViewController.h"
#import "CircleMenu.h"
#import "Masonry.h"
#import "SecCircleMenu.h"
#import "TertCircleMenu.h"

@interface MenuViewController ()<CircleMenuDelegate,SecCircleMenuDelegate>

@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) UIImageView *backGroundImageView;
@property(nonatomic, strong) UIView *backGroundView;
@property(nonatomic, strong) CircleMenu *circleMenu;
@property(nonatomic, strong) SecCircleMenu *secCircleMenu;
@property(nonatomic, strong) TertCircleMenu *tertCircleMenu;
@end

@implementation MenuViewController

//界面加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubViews];
    [self defaultSelectedMenu];
}
//界面
- (void)setupSubViews{
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    
    self.containerView = [[UIView alloc]init];
    //self.containerView.backgroundColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1];
    self.view.backgroundColor = [UIColor clearColor];
    self.containerView.backgroundColor = [UIColor clearColor];
    
    self.backGroundImageView = [[UIImageView alloc]init];
    self.backGroundImageView.image = [UIImage imageNamed:@"desktop"];
    self.backGroundImageView.userInteractionEnabled = YES;
    
    self.backGroundView = [[UIView alloc]init];
    self.backGroundView.backgroundColor = [UIColor whiteColor];
    self.backGroundView.layer.masksToBounds = YES;
    self.backGroundView.layer.cornerRadius = 180;
    //self.backGroundView.alpha = 0.7;
    self.backGroundView.userInteractionEnabled = YES;
    
    self.circleMenu = [[CircleMenu alloc]init];
    self.circleMenu.layer.masksToBounds = YES;
    self.circleMenu.layer.cornerRadius = 100;
    self.circleMenu.backgroundColor = [UIColor clearColor];
    self.circleMenu.delegate = self;
    
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.backGroundImageView];
    [self.backGroundImageView addSubview:self.backGroundView];
    [self.backGroundView addSubview:self.circleMenu];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.backGroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
    
    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.backGroundImageView);
        make.size.mas_equalTo(CGSizeMake(360, 360));
    }];
    
    [self.circleMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}
//默认选中菜单
- (void)defaultSelectedMenu{
    [self clickCircleMenuItemAtIndex:1 andMenuItemNumber:10];
    [self clickSecCircleMenuItemAtIndex:1 andMenuItemNumber:10];
}
//点击一级菜单item

- (void)clickCircleMenuItemAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber{
    NSLog(@"一级菜单 %ld",(long)index);
    self.secCircleMenu.itemCount = [self secCircleMenuItemNumberAtIndex:index andMenuItemNumber:menuItemNumber];
    [self.secCircleMenu showSecCircleMenu];
    [self.backGroundView bringSubviewToFront:self.circleMenu];
    
    self.tertCircleMenu.itemCount = [self tertCircleMenuItemNumberAtIndex:index andMenuItemNumber:menuItemNumber];
    [self.tertCircleMenu showTertCircleMenu];
    //[self.backGroundImageView sendSubviewToBack:self.tertCircleMenu];
    [self.backGroundView insertSubview:self.tertCircleMenu atIndex:0];
}

//点击二级菜单item
- (void)clickSecCircleMenuItemAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber{
    NSLog(@"二级菜单 %ld",(long)index);
    self.tertCircleMenu.itemCount = [self tertCircleMenuItemNumberAtIndex:index andMenuItemNumber:menuItemNumber];
    [self.tertCircleMenu showTertCircleMenu];
   //[self.backGroundImageView sendSubviewToBack:self.tertCircleMenu];
}
//懒加载二级菜单
- (SecCircleMenu *)secCircleMenu{
    if (!_secCircleMenu) {
        _secCircleMenu = [[SecCircleMenu alloc]init];
        _secCircleMenu.layer.masksToBounds = YES;
        _secCircleMenu.layer.cornerRadius = 140;
        _secCircleMenu.backgroundColor = [UIColor clearColor];
        _secCircleMenu.delegate = self;
        [self.backGroundView addSubview:_secCircleMenu];
        
        [_secCircleMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(280, 280));
        }];
    }
    return _secCircleMenu;
}
//懒加载三级菜单
- (TertCircleMenu *)tertCircleMenu{
    if (!_tertCircleMenu) {
        _tertCircleMenu = [[TertCircleMenu alloc]init];
        _tertCircleMenu.layer.masksToBounds = YES;
        _tertCircleMenu.layer.cornerRadius = 180;
        _tertCircleMenu.backgroundColor = [UIColor clearColor];
        [self.backGroundView addSubview:_tertCircleMenu];
        
        [_tertCircleMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(360, 360));
        }];
    }
    return _tertCircleMenu;
}
//二级菜单数量
- (NSInteger)secCircleMenuItemNumberAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber{
        return index + 5;
}
//三级菜单数量
- (NSInteger)tertCircleMenuItemNumberAtIndex:(NSInteger)index andMenuItemNumber:(NSInteger)menuItemNumber{
        return 30 - index;
}

@end
