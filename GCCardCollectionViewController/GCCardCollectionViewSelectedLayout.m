//
//  GCCardCollectionViewSelectedLayout.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-24.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewSelectedLayout.h"

@interface GCCardCollectionViewSelectedLayout ()

@property (assign, nonatomic, readonly) CGSize itemSize;
@property (strong, nonatomic, readonly) NSMutableDictionary *layoutAttributes;
@property (assign, nonatomic, readonly) UIEdgeInsets sectionInset;

@end

@implementation GCCardCollectionViewSelectedLayout

@synthesize itemSize = _itemSize;
@synthesize layoutAttributes = _layoutAttributes;
@synthesize sectionInset = _sectionInset;

#pragma mark - GCCardCollectionViewSelectedLayout

- (CGSize)itemSize {
    if (CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        _itemSize = CGSizeMake(300.f, 236.f);
    }
    
    return _itemSize;
}

- (NSMutableDictionary *)layoutAttributes {
    if (!_layoutAttributes) {
        _layoutAttributes = [@{} mutableCopy];
    }
    
    return _layoutAttributes;
}

- (UIEdgeInsets)sectionInset {
    if (UIEdgeInsetsEqualToEdgeInsets(_sectionInset, UIEdgeInsetsZero)) {
        _sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    }
    
    return _sectionInset;
}

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = CGRectMake(self.sectionInset.left, self.sectionInset.top, self.itemSize.width, self.itemSize.height);
    
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [@[] mutableCopy];
    
    for (NSIndexPath *indexPath in self.layoutAttributes) {
        UICollectionViewLayoutAttributes *attribute = self.layoutAttributes[indexPath];
        
        if (CGRectContainsRect(rect, attribute.frame)) {
            [attributes addObject:attribute];
        }
    }
    
    return attributes;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    for (NSInteger section = 0; section < self.collectionView.numberOfSections; section++) {
        for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            self.layoutAttributes[indexPath] = attributes;
        }
    }
}

@end
