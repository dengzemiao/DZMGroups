//
//  DZMGroupsController_Demo.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsController_Demo.h"
#import "DZMGroupsTableView_Test.h"

@interface DZMGroupsController_Demo ()

@end

@implementation DZMGroupsController_Demo

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    DZMGroupsTableView_Test *temp1 = [[DZMGroupsTableView_Test alloc] init];
    
    DZMGroupsTableView_Test *temp2 = [[DZMGroupsTableView_Test alloc] init];
    
    DZMGroupsTableView_Test *temp3 = [[DZMGroupsTableView_Test alloc] init];
    
    [self reloadTitles:@[@"小说", @"腾讯新闻", @"极客学院"] groupsViews:@[temp1, temp2, temp3]];
}

- (void)initToolBar:(CGRect)frame {
    
    [super initToolBar:frame];
    
    self.toolBar.backgroundColor = [UIColor purpleColor];
}

@end
