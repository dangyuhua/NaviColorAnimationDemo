//
//  ViewController.m
//  NaviColorAnimationDemo
//
//  Created by 党玉华 on 2018/12/5.
//  Copyright © 2018年 dangyuhua. All rights reserved.
//

#import "ViewController.h"

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define Screew self.view.frame.size.width

UIView *bgview;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:true];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableview];
    bgview = [[UIView alloc] initWithFrame:CGRectMake(0, -[UIApplication sharedApplication].statusBarFrame.size.height, Screew, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height)];
    bgview.backgroundColor = RGBA(53, 53, 53, 0);
    bgview.userInteractionEnabled = NO;
    [self.navigationController.navigationBar insertSubview: bgview atIndex:0];
    

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    bgview.backgroundColor = RGBA(53, 53, 53, scrollView.contentOffset.y/([UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height));
}

-(void)setupTableview{
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

@end
