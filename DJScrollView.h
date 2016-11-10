//
//  DJScrollView.h
//  DJSuperScrollView
//
//  Created by 刘文江 on 2016/11/10.
//  Copyright © 2016年 刘文江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJScrollView : UIView

//定义数组
@property (nonatomic,strong) NSArray *imageArray;

//定义是否循环滚动
@property (nonatomic,assign) BOOL isScroll;

//定义是否整页滚动
@property (nonatomic,assign) BOOL isPageScroll;


//定义滚动视图
@property (nonatomic,retain) UIScrollView *myScroll;

//定义page
@property (nonatomic,retain) UIPageControl *myPage;


@end
