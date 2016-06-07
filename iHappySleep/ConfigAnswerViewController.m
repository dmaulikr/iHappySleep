//
//  ConfigAnswerViewController.m
//  iHappySleep
//
//  Created by 诺之家 on 15/11/20.
//  Copyright (c) 2015年 诺之家. All rights reserved.
//

#import "ConfigAnswerViewController.h"
#import "myHeader.h"

@interface ConfigAnswerViewController ()

@end

@implementation ConfigAnswerViewController
{
    UITableView *configAnswerTableView;
    NSArray *questionAndAnswer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.translucent=YES;
    
    configAnswerTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    configAnswerTableView.tableFooterView=[[UIView alloc] init];
    configAnswerTableView.delegate=self;
    configAnswerTableView.dataSource=self;
    
    [self.view addSubview:configAnswerTableView];
    
    questionAndAnswer=[NSArray arrayWithObjects:[_answerDic objectForKey:@"Question"],[_answerDic objectForKey:@"Answer"], nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return questionAndAnswer.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return 1.5*cell.frame.size.height;
    }
    else
    {
        if (SCREEN_HEIGHT==480)
        {
            return SCREEN_WIDTH/2;
        }
        else if (SCREEN_HEIGHT==667)
        {
            return SCREEN_HEIGHT/3.5;
        }
        else
        {
            return SCREEN_HEIGHT/3.7;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"ConfigAnswer";
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text=[questionAndAnswer objectAtIndex:indexPath.row];
    if (indexPath.row==1)
    {
        cell.textLabel.textColor=UIColorWithRGBA(20.0f, 80.0f, 200.0f, 0.7f);
    }
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
