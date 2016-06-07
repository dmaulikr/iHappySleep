//
//  SoftwareOptionViewController.m
//  iHappySleep
//
//  Created by 诺之家 on 15/11/20.
//  Copyright (c) 2015年 诺之家. All rights reserved.
//

#import "SoftwareOptionViewController.h"
#import "myHeader.h"
#import "SoftwareAnswerViewController.h"

@interface SoftwareOptionViewController ()

@end

@implementation SoftwareOptionViewController
{
    UITableView *softwareTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.translucent=YES;
    
    softwareTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    softwareTableView.tableFooterView=[[UIView alloc] init];
    softwareTableView.delegate=self;
    softwareTableView.dataSource=self;
    
    [self.view addSubview:softwareTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _softwareOptionArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row==2 || indexPath.row==4 || indexPath.row==5)
    {
        return 1.5*cell.frame.size.height;
    }
    else
    {
        return cell.frame.size.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"ConfigRequire";
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text=[[_softwareOptionArray objectAtIndex:indexPath.row] objectForKey:@"Question"];
    if (SCREEN_WIDTH==320)
    {
        cell.textLabel.font=[UIFont systemFontOfSize:18];
    }
    else if (SCREEN_WIDTH==375)
    {
        cell.textLabel.font=[UIFont systemFontOfSize:20];
    }
    else
    {
        cell.textLabel.font=[UIFont systemFontOfSize:22];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoftwareAnswerViewController *softwareAnswer=[[SoftwareAnswerViewController alloc] init];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"回答";
    [temporaryBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    softwareAnswer.questionIndex=indexPath.row;
    softwareAnswer.answerDic=[_softwareOptionArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:softwareAnswer animated:YES];
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
