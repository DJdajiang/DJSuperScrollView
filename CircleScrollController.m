//
//  CircleScrollController.m
//  DJSuperScrollView
//
//  Created by 刘文江 on 2016/11/10.
//  Copyright © 2016年 刘文江. All rights reserved.
//

/*
 ********************************************************************************
 *                                                                               *
 * 在您使用此封装的滚动视图的过程中如果出现bug请及时以以下任意一种方式联系我们，                *
 * 我们会及时修复bug并帮您解决问题。                                                    *
 * QQ    : 464280789                                                               *
 * Email : 464280789@qq.com  || wenjiang555@gmail.com                              *
 * GitHub: https://github.com/DJdajiang/SuperScrollView                            *
 * 新浪微博: http://blog.sina.com.cn/u/5996203625                                   *
 *                                                                                *
 *********************************************************************************
 */

#import "CircleScrollController.h"
#import "DJScrollView.h"

@interface CircleScrollController ()
{
    DJScrollView *scroll;
}
@end

@implementation CircleScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化封装好的滚动视图
    scroll = [[DJScrollView alloc] initWithFrame:self.view.bounds];
    
    //添加到视图上
    [self.view addSubview:scroll];
    
    //为封装的视图属性赋值
    scroll.isScroll = YES;
    scroll.isPageScroll = YES;
    
    /*
     注意：这里要先为滚动视图属性赋值，最后再为数组赋值 。只有这样运行起来才是正确的逻辑。否则容易出现滚动不规则的效果。
     
     */
    scroll.imageArray = @[@"m10.jpg",@"m11.jpg",@"m12.jpg",@"m13.jpg",@"m15.jpg"];
    
    //添加单击手势返回上一页面
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    
    [self.view addGestureRecognizer:tap];
}


- (void)tapClick:(UIGestureRecognizer *)gestrue
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
