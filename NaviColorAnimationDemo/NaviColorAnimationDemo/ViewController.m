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

UIView *alphaView;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView *bgview;

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
    CGRect frame = self.navigationController.navigationBar.frame;
    alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -[UIApplication sharedApplication].statusBarFrame.size.height, frame.size.width, frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height)];
    alphaView.backgroundColor = RGBA(53, 53, 53, 0);
    alphaView.userInteractionEnabled = NO;
    [self.navigationController.navigationBar insertSubview: alphaView atIndex:0];
    

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    alphaView.backgroundColor = RGBA(53, 53, 53, scrollView.contentOffset.y/([UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height));
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
