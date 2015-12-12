//
//  TZMainViewController.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZMainViewController.h"
#import "TZDockView.h"
#import "TZBottomMenu.h"
#import "TZPersonalCenterButton.h"

@interface TZMainViewController ()<TZBottomMenuDelegate,TZTabBarViewDelegate>
@property (nonatomic, weak) TZDockView *dockView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation TZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self addDockView];
    [self addContentView];
    [self addContentViewController];
    [self tabBarView:nil ItemDidClickFromIndex:0 toIndex:0];
}

#pragma mark - 添加导航栏
//添加导航栏
- (void)addDockView{
    TZDockView *dockView = [[TZDockView alloc] init];
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(self.interfaceOrientation);
    [dockView orientationOfScreenIsLandscape:isLandscape];
    dockView.height = self.view.height;
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:dockView];
    self.dockView = dockView;
    dockView.backgroundColor = [UIColor blackColor];
    //指定代理
    dockView.bottomMenu.delegate = self;
    dockView.tabBarView.delegate = self;
    //为个人中心添加点击事件
    [dockView.personalCenter addTarget:self action:@selector(personalCenterDidTouch:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 个人中心点击事件
- (void)personalCenterDidTouch:(TZPersonalCenterButton *)personalCenterButton{

    [self tabBarView:nil ItemDidClickFromIndex:0 toIndex:6];
    [self.dockView.tabBarView cancelSelecetAll];
    
}
#pragma mark - 添加切换视图界面
//添加站位View
- (void) addContentView
{
    UIView *contentView = [[UIView alloc] init];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    contentView.backgroundColor = [UIColor whiteColor];
    
    //  设置高度自由
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    //  设置frame
    contentView.x = self.dockView.width;
    contentView.y = 20;
    contentView.width = TZContentViewWidth;
    contentView.height = self.view.height - contentView.y;
}
//添加切换的子视图控制器
- (void)addContentViewController{

    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"全部动态";
    [self packToNavWithController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"与我相关";
    vc2.view.backgroundColor = [UIColor blackColor];
    [self packToNavWithController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    vc3.title = @"照片墙";
    [self packToNavWithController:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.title = @"电子相框";
    vc4.view.backgroundColor = [UIColor orangeColor];
    [self packToNavWithController:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"好友";
    vc5.view.backgroundColor = [UIColor yellowColor];
    [self packToNavWithController:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"更多";
    vc6.view.backgroundColor = [UIColor greenColor];
    [self packToNavWithController:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor grayColor];
    [self packToNavWithController:vc7];

}
//包装ViewController成为NavigationController
- (void)packToNavWithController:(UIViewController *)controller{

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
    
}


#pragma mark - 判断屏幕方向
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    [self.dockView orientationOfScreenIsLandscape:isLandscape];
    
}

#pragma mark - TZBottomMenu的代理方法
- (void)bottomMenuItemDidClick:(TZBottomMenu *)bottomMenu andItemType:(TZBottomMenuItemType)itemType{
    if (itemType == TZBottomMenuItemTypeMood) {
        UIViewController *moodVc = [[UIViewController alloc] init];
        UINavigationController *moodNav = [[UINavigationController alloc] initWithRootViewController:moodVc];
        moodNav.modalPresentationStyle = UIModalPresentationFormSheet;
        moodVc.title = @"说说";
        moodVc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeModal:)];
        moodVc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表说说" style:UIBarButtonItemStylePlain target:self action:nil];
        [self presentViewController:moodNav animated:YES completion:^{
            
        }];
    }else if (itemType == TZBottomMenuItemTypePhoto){
    
        UIViewController *photoVc = [[UIViewController alloc] init];
        UINavigationController *photoNav = [[UINavigationController alloc] initWithRootViewController:photoVc];
        photoNav.modalPresentationStyle = UIModalPresentationFormSheet;
        photoVc.title = @"照片";
        photoVc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeModal:)];
            [self presentViewController:photoNav animated:YES completion:^{
            
        }];

    }else{
    
        UIViewController *blogVc = [[UIViewController alloc] init];
        UINavigationController *blogNav = [[UINavigationController alloc] initWithRootViewController:blogVc];
        blogNav.modalPresentationStyle = UIModalPresentationFormSheet;
        blogVc.title = @"博客";
        blogVc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeModal:)];
        blogVc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享博客" style:UIBarButtonItemStylePlain target:self action:nil];
        [self presentViewController:blogNav animated:YES completion:^{
            
        }];

        
    }
    
}

#pragma mark - TZTabBarView的代理方法
- (void)tabBarView:(TZTabBarView *)tabBarView ItemDidClickFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    if (self.selectedIndex != 0 && self.selectedIndex == toIndex) {
        return;
    }
    
    //移除原来的视图
    UIViewController *fromViewController = self.childViewControllers[fromIndex];
    [fromViewController.view removeFromSuperview];
    
    //将要跳转的视图取出
    UIViewController *toViewController = self.childViewControllers[toIndex];
    toViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:toViewController.view];
    
    //添加动画
    CATransition *transaction = [CATransition animation];
    transaction.type = @"reveal";
    transaction.subtype = @"fromLeft";
    transaction.duration = 0.3;
    [self.contentView.layer addAnimation:transaction forKey:nil];
    self.selectedIndex = toIndex;
    
}

#pragma mark - 关闭modal方式显示的界面
- (void)closeModal:(UIBarButtonItem *)item{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
