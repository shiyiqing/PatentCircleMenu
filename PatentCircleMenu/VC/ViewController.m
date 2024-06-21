//
//  ViewController.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/13.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MenuViewController.h"
#import "CommonMethod.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *backGroundImageView;
@property(nonatomic,strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupFirstPage];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
}


- (void)setupFirstPage{
    
    self.backGroundImageView = ^{
        UIImageView *imgView = [[UIImageView alloc]init];
        [imgView setImage:[UIImage imageNamed:@"desktop"]];
        return imgView;
    }();
    
    self.button = ^{
        UIButton *button = [[UIButton alloc]init];
        //[button setTitle:@"点我" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"menu0"] forState:UIControlStateNormal];
        //[button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }();
    
    [self.view addSubview:self.backGroundImageView];
    [self.backGroundImageView addSubview:self.button];
    
    [self.backGroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    
    //[button setFrame:CGRectMake(100, 100, 40, 40)];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-16-99);
        make.right.equalTo(self.view).offset(-16);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
  
    self.backGroundImageView.userInteractionEnabled = YES;
    
}

//按钮触发事件
-(void)btnClick:(UIButton *)button{

    MenuViewController *menuVC = [[MenuViewController alloc]init];
    
    UIViewController *vc = [CommonMethod topNavViewController];
    if(vc){
        //UINavigationController *navVC = (UINavigationController *)vc;
        [(UINavigationController *)vc pushViewController:menuVC animated:NO];
    }
    
    //[self.navigationController pushViewController:menuVC animated:NO];
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
