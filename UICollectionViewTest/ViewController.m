// Copyright (c) 2016 Lightricks. All rights reserved.
// Created by Amit Shabtay.

#import "ViewController.h"

#import "UICollectionTestCell.h"

@interface ViewController () <UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setup];
}

- (void)setup {
  [self setupCollectionViewLayout];
  [self setupCollectionView];
}

- (void)setupCollectionViewLayout {
  self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
}

- (void)setupCollectionView {
  CGSize screenSize = [[UIScreen mainScreen] bounds].size;
  CGRect frame = CGRectMake(0, screenSize.height - 200, screenSize.width, 100);
  self.collectionView =
      [[UICollectionView alloc] initWithFrame:frame
                         collectionViewLayout:self.collectionViewLayout];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  [self.collectionView registerClass:[UICollectionTestCell class]
          forCellWithReuseIdentifier:@"testCell"];
  self.collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  self.collectionView.backgroundColor = [UIColor blackColor];

  [self.view addSubview:self.collectionView];
}

- (UICollectionViewFlowLayout *)layoutForCollectionView {
  UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
  return flowLayout;
}

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout
#pragma mark -

- (CGSize)collectionView:(UICollectionView __unused *)collectionView
                  layout:(UICollectionViewLayout __unused *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath __unused *)indexPath {
  return CGSizeMake(100, 100);
}

#pragma mark -
#pragma mark UICollectionViewDataSource
#pragma mark -

- (NSInteger)collectionView:(UICollectionView __unused *)collectionView
     numberOfItemsInSection:(NSInteger __unused)section {
  return 50;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView __unused *)collectionView {
  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell" forIndexPath:indexPath];
  return cell;
}

@end
