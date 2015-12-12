//
//  ViewController.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZLoginController.h"
#import "TZMainViewController.h"
#import "SVProgressHUD.h"

@interface TZLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *rememberPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;

- (IBAction)loginBtnDidClick;
- (IBAction)rememberBtnDidClick;
- (IBAction)autoLoginBtnDidClick;

@end

#define accountKey @"account"
#define passwordKey @"password"
#define rememberPwdKey @"rememberPwd"
#define autoLonginKey @"autoLongin"
@implementation TZLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    self.accountTextField.text = [userDefault objectForKey:accountKey];
    if ([userDefault boolForKey:rememberPwdKey] == YES) {
       self.passwordTextField.text = [userDefault objectForKey:passwordKey];
        self.rememberPwdBtn.selected = YES;
    }
    if ([userDefault boolForKey:autoLonginKey] == YES) {
        self.autoLoginBtn.selected = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loginBtnDidClick];
        });
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击登陆按钮触发的事件
- (IBAction)loginBtnDidClick {
    
    NSString *account = self.accountTextField.text;
    NSString *password = self.passwordTextField.text;
    if (account.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"账号不能为空"];
    }
    if(password.length == 0){
    
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
    }
    
    if ([account isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:account forKey:accountKey];
        [userDefault setObject:password forKey:passwordKey];
        [userDefault setBool:self.rememberPwdBtn.selected forKey:rememberPwdKey];
        [userDefault setBool:self.autoLoginBtn.selected forKey:autoLonginKey];
        UIApplication *app = [UIApplication sharedApplication];
        
        TZMainViewController *mainController = [[TZMainViewController alloc] init];
        app.keyWindow.rootViewController = mainController;
    }else{
    
        [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
    }
}

//记住密码
- (IBAction)rememberBtnDidClick {
    self.rememberPwdBtn.selected = !self.rememberPwdBtn.selected;
    if (!self.rememberPwdBtn.selected) {
        self.autoLoginBtn.selected = NO;
    }
}
//自动登录
- (IBAction)autoLoginBtnDidClick {
    self.autoLoginBtn.selected = !self.autoLoginBtn.selected;
    if (self.autoLoginBtn.selected) {
        self.rememberPwdBtn.selected = YES;
    }
    
}
@end
