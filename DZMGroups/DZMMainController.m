//
//  DZMMainController.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMMainController.h"
#import "DZMGroupsTypeNo1_Demo.h"
#import "DZMGroupsTypeNo2_Demo.h"
#import "DZMGroupsTypeNo3_Demo.h"

@interface DZMMainController ()

/// 类型列表
@property (nonatomic, strong) NSArray *dataArray;

@end

/// 支持的使用类型
typedef enum : NSInteger {
    
    /// Groups - 无导航栏
    DZMGroupsTypeNo1,
    
    /// Groups - 有导航栏
    DZMGroupsTypeNo2,
    
    /// Groups - 带定点伸缩HeaderView
    DZMGroupsTypeNo3,
    
} DZMGroupsType;

@implementation DZMMainController

- (NSString *)GroupsTitles:(DZMGroupsType)type {
    
    if (type == DZMGroupsTypeNo1) {
        
        return @"Groups - 无导航栏";
        
    }else if (type == DZMGroupsTypeNo2) {
        
        return @"Groups - 有导航栏";
        
    }else if (type == DZMGroupsTypeNo3) {
        
        return @"Groups - 带定点伸缩HeaderView";
    }
    
    return @"";
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Groups - 功能列表";
    
    self.dataArray = @[@(DZMGroupsTypeNo1), @(DZMGroupsTypeNo2), @(DZMGroupsTypeNo3)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DZMMainController"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DZMMainController"];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    DZMGroupsType type = (DZMGroupsType)[self.dataArray[indexPath.row] integerValue];
  
    cell.textLabel.text = [self GroupsTitles:type];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZMGroupsType type = (DZMGroupsType)[self.dataArray[indexPath.row] integerValue];
    
    if (type == DZMGroupsTypeNo1) {
        
        DZMGroupsTypeNo1_Demo *no1 = [[DZMGroupsTypeNo1_Demo alloc] init];
        
        [self.navigationController pushViewController:no1 animated:YES];
        
    }else if (type == DZMGroupsTypeNo2) {
        
        DZMGroupsTypeNo2_Demo *no2 = [[DZMGroupsTypeNo2_Demo alloc] init];
        
        no2.title = [self GroupsTitles:DZMGroupsTypeNo2];
        
        [self.navigationController pushViewController:no2 animated:YES];
        
    }else if (type == DZMGroupsTypeNo3) {
        
        DZMGroupsTypeNo3_Demo *no3 = [[DZMGroupsTypeNo3_Demo alloc] init];
        
        no3.title = [self GroupsTitles:DZMGroupsTypeNo3];
        
        [self.navigationController pushViewController:no3 animated:YES];
    }
}

@end
