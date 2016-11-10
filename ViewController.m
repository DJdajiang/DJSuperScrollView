//
//  ViewController.m
//  DJSuperScrollView
//
//  Created by 刘文江 on 2016/11/10.
//  Copyright © 2016年 刘文江. All rights reserved.
//

#import "ViewController.h"
#import "NoCricleScrollViewController.h"
#import "CircleScrollController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"ScrollView Pickage";
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    table.dataSource = self;
    table.delegate = self;
    
    [self.view addSubview:table];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"CircleScroll";
    }
    else
    {
        cell.textLabel.text = @"NoCricleScroll";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        CircleScrollController *circle = [[CircleScrollController alloc] init];
        
        [self presentViewController:circle animated:YES completion:nil];
    }
    else
    {
        NoCricleScrollViewController *noCircle = [[NoCricleScrollViewController alloc] init];
        
        [self presentViewController:noCircle animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
