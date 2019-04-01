//
//  DZMGroupsController.m
//  DZMGroups
//
//  Created by dengzemiao on 2019/3/20.
//  Copyright © 2019年 DZM. All rights reserved.
//

#import "DZMGroupsController.h"
#import "DZMGroupsCell.h"

@interface DZMGroupsController ()<UICollectionViewDelegate, UICollectionViewDataSource, DZMGroupsToolBarDelegate>

@property (nonatomic, strong) NSArray<NSString *> *titles;

@property (nonatomic, strong) NSArray<UIView *> *groupsViews;

@property (nonatomic, assign) BOOL isDragging;

@end

@implementation DZMGroupsController

- (NSArray<NSString *> *)titles {
    
    if (!_titles) {
        
        _titles = [NSArray array];
    }
    
    return _titles;
}

- (NSArray<UIView *> *)groupsViews {
    
    if (!_groupsViews) {
        
        _groupsViews = [NSArray array];
    }
    
    return _groupsViews;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubViews];
}

- (void)reloadTitles:(NSArray<NSString *> *)titles groupsViews:(NSArray<UIView *> *)groupsViews {
    
    [self reloadTitles:titles groupsViews:groupsViews index:0];
}

- (void)reloadTitles:(NSArray<NSString *> *)titles groupsViews:(NSArray<UIView *> *)groupsViews index:(NSInteger)index {
    
    self.titles = titles;
    
    self.groupsViews = groupsViews;
    
    [self.toolBar reloadTitles:titles index:index];
    
    [self.collectionView reloadData];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

- (void)initSubViews {
    
    [self initToolBar: CGRectMake(0, 0, self.view.frame.size.width, 44.0)];
    
    [self initCollectionView:CGRectMake(0, CGRectGetMaxY(_toolBar.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(_toolBar.frame))];
}

- (void)initToolBar:(CGRect)frame {
    
    _toolBar = [[DZMGroupsToolBar alloc] initWithFrame:frame];
    
    _toolBar.delegate = self;
    
    [self.view addSubview:_toolBar];
}

- (void)initCollectionView:(CGRect)frame {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[DZMGroupsCell class] forCellWithReuseIdentifier:@"DZMGroupsCell"];
    
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DZMGroupsCell *cell = (DZMGroupsCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DZMGroupsCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0];
    
    cell.groupsView = self.groupsViews[indexPath.row];
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    self.isDragging = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.isDragging) {
        
        NSInteger page = (NSInteger)((scrollView.contentOffset.x / scrollView.frame.size.width) + 0.5);
        
        [self.toolBar selectIndex:page animated:YES];
    }
}

#pragma mark - DZMGroupsToolBarDelegate

- (void)toolBar:(DZMGroupsToolBar *)toolBar clickIndex:(NSInteger)index {
    
    self.isDragging = NO;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

@end
