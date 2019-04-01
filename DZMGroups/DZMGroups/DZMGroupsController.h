//
//  DZMGroupsController.h
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMGroupsToolBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMGroupsController : UIViewController

/// 工具条
@property (nonatomic, strong, readonly) DZMGroupsToolBar *toolBar;

/// 内容视图
@property (nonatomic, strong, readonly) UICollectionView *collectionView;

/// 初始化子控件
- (void)initSubViews;

/// 初始化工具条
- (void)initToolBar:(CGRect)frame;

/// 初始化内容视图
- (void)initCollectionView:(CGRect)frame;

/// 刷新标题以及子视图列表
- (void)reloadTitles:(NSArray<NSString *> * _Nonnull)titles groupsViews:(NSArray<UIView *> * _Nonnull)groupsViews;

/// 刷新标题以及子视图列表
- (void)reloadTitles:(NSArray<NSString *> * _Nonnull)titles groupsViews:(NSArray<UIView *> * _Nonnull)groupsViews index:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
