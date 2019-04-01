//
//  DZMGroupsTypeNo3_Demo.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/21.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsTypeNo3_Demo.h"
#import "DZMGroupsTypeNo3_Demo_TableView.h"
#import "DZMNavigationExtension.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

#define DZMGroupsHeaderMaxHeight 200.0
#define DZMGroupsHeaderMinHeight DZM_HEIGHT_NAVIGATION_BAR

@interface DZMGroupsTypeNo3_Demo ()

@property (nonatomic, strong) DZMNavigationBar *navigationBar;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, assign) BOOL isScrollTop;

@end

@implementation DZMGroupsTypeNo3_Demo

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.fd_prefersNavigationBarHidden = YES;
    
    DZMGroupsTypeNo3_Demo_TableView *temp1 = [[DZMGroupsTypeNo3_Demo_TableView alloc] init];
    
    DZMGroupsTypeNo3_Demo_TableView *temp2 = [[DZMGroupsTypeNo3_Demo_TableView alloc] init];
    
    DZMGroupsTypeNo3_Demo_TableView *temp3 = [[DZMGroupsTypeNo3_Demo_TableView alloc] init];
    
    [self reloadTitles:@[@"小说", @"腾讯新闻", @"极客学院"] groupsViews:@[temp1, temp2, temp3]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subMsg:) name:DZMGroupsTypeNo3_Sub object:nil];
}

- (void)subMsg:(NSNotification *)notification {
    
    NSNumber *isScrollTop = notification.userInfo[DZMGroupsTypeNo3_Key];
    
    if (self.isScrollTop == isScrollTop.boolValue) { return ; }
    
    self.isScrollTop = isScrollTop.boolValue;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DZMGroupsTypeNo3_Sup object:nil userInfo:@{DZMGroupsTypeNo3_Key : @(self.isScrollTop)}];
    
    __weak DZMGroupsTypeNo3_Demo *weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        weakSelf.navigationBar.barAlpha = isScrollTop.floatValue;
        
        
        CGRect headerViewFrame = weakSelf.headerView.frame;
        
        headerViewFrame.size.height = (isScrollTop.boolValue ? DZMGroupsHeaderMinHeight : DZMGroupsHeaderMaxHeight);
        
        weakSelf.headerView.frame = headerViewFrame;
        
        
        CGRect toolBarFrame = weakSelf.toolBar.frame;
        
        toolBarFrame.origin.y = CGRectGetMaxY(weakSelf.headerView.frame);
        
        weakSelf.toolBar.frame = toolBarFrame;
        
        
        CGRect collectionViewFrame = weakSelf.collectionView.frame;
        
        collectionViewFrame.origin.y = CGRectGetMaxY(weakSelf.toolBar.frame);
        
        weakSelf.collectionView.frame = collectionViewFrame;
    }];
}

- (void)initSubViews {
    
    [super initSubViews];
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:self.headerView];
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, DZMGroupsHeaderMaxHeight);
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = self.title;
    self.navigationBar = [[DZMNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, DZM_HEIGHT_NAVIGATION_BAR)];
    self.navigationBar.items = @[navigationItem];
    [self.view addSubview:self.navigationBar];
    
    __weak DZMGroupsTypeNo3_Demo *weakSelf = self;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        weakSelf.navigationBar.barAlpha = 0;
    });
}

- (void)initToolBar:(CGRect)frame {
    
    [super initToolBar:CGRectMake(frame.origin.x, DZMGroupsHeaderMaxHeight, frame.size.width, frame.size.height)];
}

- (void)initCollectionView:(CGRect)frame {
    
    [super initCollectionView:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, self.view.frame.size.height - DZMGroupsHeaderMinHeight - self.toolBar.frame.size.height)];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DZMGroupsTypeNo3_Sub object:nil];
}

@end
