//
//  DZMGroupsTableView_Test.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/21.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsTableView_Test.h"

@interface DZMGroupsTableView_Test() <UITableViewDataSource>

@end

@implementation DZMGroupsTableView_Test

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.dataSource = self;
    }
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DZMGroupsTableView_Test"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DZMGroupsTableView_Test"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

@end
