//
//  DZMGroupsCell.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsCell.h"

@implementation DZMGroupsCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setGroupsView:(UIView *)groupsView {
    
    [_groupsView removeFromSuperview];
    
    _groupsView = groupsView;
    
    if (groupsView != nil) {
        
        [self.contentView addSubview:groupsView];
        
        groupsView.frame = self.bounds;
    }
}

@end
