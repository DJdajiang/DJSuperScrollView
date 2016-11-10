//
//  DJScrollView.m
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
#import "DJScrollView.h"
@interface DJScrollView()
{
    NSInteger ka;
    NSTimer *time;
}

@end
@implementation DJScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

//重写get方法
-(UIScrollView *)myScroll
{
    if (_myScroll == nil)
    {
        _myScroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        _myScroll.bounces = NO;
        _myScroll.showsHorizontalScrollIndicator = YES;
        
    }
    return _myScroll;
}

-(UIPageControl *)myPage
{
    if (_myPage == nil)
    {
        _myPage = [[UIPageControl alloc] initWithFrame:CGRectMake(30, self.frame.size.height - 40, self.frame.size.width - 60, 30)];
        _myPage.pageIndicatorTintColor = [UIColor redColor];
        
        _myPage.currentPageIndicatorTintColor = [UIColor greenColor];     
        
    }
    return _myPage;
}

//调用set方法赋值
- (void)setIsPageScroll:(BOOL)isPageScroll
{
    self.myScroll.pagingEnabled = isPageScroll;
}

- (void)setIsScroll:(BOOL)isScroll
{
    _isScroll = isScroll;
}

//添加按钮
- (void)showEnterButton
{
    UIButton *bun = [UIButton buttonWithType:UIButtonTypeCustom];
    
    bun.frame = CGRectMake(self.bounds.size.width * self.imageArray.count - (self.bounds.size.width / 2 - 30), self.bounds.size.height - 60,60, 40);
    bun.tag = 520;
    
    [bun setTitle:@"进入" forState:UIControlStateNormal];
    
    [bun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [self.myScroll addSubview:bun];
    
}

//移除所有控件
- (void)clearAll
{
    for (UIView *view1 in self.myScroll.subviews)
    {
        [view1 removeFromSuperview];
    }
}

//不循环滚动添加图片
- (void)addImage
{
    for (NSInteger i = 0; i< self.imageArray.count; i ++)
    {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * i , 0, self.frame.size.width, self.frame.size.height)];
        
        imageV.image = [UIImage imageNamed:self.imageArray[i]];
        imageV.userInteractionEnabled = YES;
        
        
        [self.myScroll addSubview:imageV];
    }
    
    self.myScroll.contentSize = CGSizeMake(self.frame.size.width * self.imageArray.count, self.frame.size.height);
    
    [self showEnterButton];
}

//添加图片
- (void)addImageForMyScroll
{
    //添加第一张图片，实际是最后一张
    CGFloat x = 0.0;
    
    UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
    
    imageView.image = [UIImage imageNamed:[self.imageArray lastObject]];
    
    [self.myScroll addSubview:imageView];
    
    //添加中间的图片
    x = x + self.frame.size.width;
    
    for (NSInteger i = 0; i < self.imageArray.count; i++)
    {
        UIImageView *imageViewMiddle = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
        
        imageViewMiddle.image = [UIImage imageNamed:self.imageArray[i]];
        
        
        [self.myScroll addSubview:imageViewMiddle];
        
        x = x + self.frame.size.width;
    }
    
    //添加显示最后，其实是第一张图片
    UIImageView *imageViewLast = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
    
    imageViewLast.image = [UIImage imageNamed:[self.imageArray firstObject]];
    
    [self.myScroll addSubview:imageViewLast];
    
    x = x + self.frame.size.width;
    
    self.myScroll.contentSize = CGSizeMake(x, self.frame.size.height);
}

-(void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    
    if (_imageArray.count)
    {
        
        [self addSubview:self.myScroll];
        
        [self addSubview:self.myPage];
        
        //点数等于数组个数
        _myPage.numberOfPages = self.imageArray.count;
        
       
        
        if (_isScroll)
        {
            
            //调用清除方法
            [self clearAll];
            
            //调用循环滚动加载图片
            [self addImageForMyScroll];
            
            //在这里要先指示一下滚动视图当前偏移量
            self.myScroll.contentOffset = CGPointMake(self.frame.size.width, 0);
        }
        else
        {
            //调用清除方法
            [self clearAll];
            
            //调用加载图片的方法
            [self addImage];
            
            //在这里要先指示一下滚动视图当前偏移量
            self.myScroll.contentOffset = CGPointMake(0, 0);

        }
        ka = 0;
        
        time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scroll:) userInfo:nil repeats:YES];
    }
}

-(void)scroll:(UIScrollView *)scroll
{
    if (_isScroll)
    {
        _myPage.currentPage = ka;
        
        ka ++;
        
        self.myScroll.contentOffset = CGPointMake(self.frame.size.width * ka, 0);
        
        if (ka == self.imageArray.count)
        {
            ka = 0;
        }
    }
    else
    {
        _myPage.currentPage = ka;
        
        _myScroll.contentOffset = CGPointMake(self.frame.size.width*ka, 0);

        if(ka == self.imageArray.count - 1)
        {
            _myPage.hidden=YES;
            
            [time invalidate];
        }
        ka ++;
    }
}

@end
