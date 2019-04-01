//
//  DZMGroupsTypeNo3_Demo_TableView.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/21.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsTypeNo3_Demo_TableView.h"

@interface DZMGroupsTypeNo3_Demo_TableView() <UITableViewDelegate>

@property (nonatomic, assign) BOOL isScrollTop;

@end

@implementation DZMGroupsTypeNo3_Demo_TableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.delegate = self;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(supMsg:) name:DZMGroupsTypeNo3_Sup object:nil];
    }
    
    return self;
}

- (void)supMsg:(NSNotification *)notification {
    
    NSNumber *isScrollTop = notification.userInfo[DZMGroupsTypeNo3_Key];
    
    if (self.isScrollTop == isScrollTop.boolValue) { return ; }
    
    self.isScrollTop = isScrollTop.boolValue;
}

#pragma mark - UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint point = [scrollView.panGestureRecognizer translationInView:scrollView];
    
    if (point.y > 0) {
        
        if (self.isScrollTop && scrollView.contentOffset.y <= 0) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:DZMGroupsTypeNo3_Sub object:nil userInfo:@{DZMGroupsTypeNo3_Key : @(NO)}];
        }
        
    }else{
        
        if (!self.isScrollTop) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:DZMGroupsTypeNo3_Sub object:nil userInfo:@{DZMGroupsTypeNo3_Key : @(YES)}];
        }
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DZMGroupsTypeNo3_Sup object:nil];
}

@end
