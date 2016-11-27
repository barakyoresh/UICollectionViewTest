// Copyright (c) 2016 Lightricks. All rights reserved.
// Created by Amit Shabtay.

#import "UICollectionTestCell.h"

@implementation UICollectionTestCell

#pragma mark -
#pragma mark Initialization
#pragma mark -

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setup];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    [self setup];
  }
  return self;
}

- (void)setup {
  self.backgroundColor = [UIColor orangeColor];
}

#pragma mark -
#pragma mark UICollectionViewCell
#pragma mark -

- (void)setHighlighted:(BOOL)highlighted {
  [super setHighlighted:highlighted];
  [self updateHighlighting];
}

- (void)setSelected:(BOOL)selected {
  [super setSelected:selected];
  [self updateHighlighting];
}

- (void)updateHighlighting {
  self.backgroundColor = self.isSelected || self.isHighlighted ? [UIColor greenColor] : [UIColor orangeColor];
}

@end
