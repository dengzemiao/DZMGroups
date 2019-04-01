//
//  DZMGroupsToolBar.h
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 滑条宽度自适应填充
static CGFloat const DZMGroupsToolBarSliderWidthFill = -1;

@class DZMGroupsToolBar;
@protocol DZMGroupsToolBarDelegate <NSObject>
@optional

/// 点击按钮
- (void)toolBar:(DZMGroupsToolBar *)toolBar clickIndex:(NSInteger)index;

/// 当前滚动到的索引
- (void)toolBar:(DZMGroupsToolBar *)toolBar scrollIndex:(NSInteger)index;

@end

@interface DZMGroupsToolBar : UIView

/// 代理
@property (nonatomic, weak) id<DZMGroupsToolBarDelegate> delegate;

/// 默认字体
@property (nonatomic, strong) UIFont *normalFont;

/// 选中字体
@property (nonatomic, strong) UIFont *selectFont;

/// 默认字体颜色
@property (nonatomic, strong) UIColor *normalColor;

/// 选中字体颜色
@property (nonatomic, strong) UIColor *selectColor;

/// 滑条颜色
@property (nonatomic, strong) UIColor *sliderColor;

/// 滑条高度
@property (nonatomic, assign) CGFloat sliderHeight;

/// 滑条宽度 (小于0为自适应填充)
@property (nonatomic, assign) CGFloat sliderWidth;

/// 按钮间距
@property (nonatomic, assign) CGFloat itemSpace;

/// 四周间距
@property (nonatomic, assign) UIEdgeInsets insets;

/// 当前选中索引 (默认-1)
@property (nonatomic, assign, readonly) NSInteger selectIndex;

/// ----- 注意下面操作在确保 ToolBar Frame 有值之后调用

/// 刷新(列表 | 布局 | 默认选中0)
- (void)reloadTitles:(NSArray<NSString *> *)titles;

/// 刷新(列表 | 布局)
- (void)reloadTitles:(NSArray<NSString *> *)titles index:(NSInteger)index;

/// 刷新(布局)
- (void)reloadUI;

/// 选中索引
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated;

/// 滑动滑条(暂时不支持,待开发)
- (void)scrollSlider:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
