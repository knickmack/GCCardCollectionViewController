//
//  GCCardCollectionViewPlainLayout.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-24.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewPlainLayout.h"

@interface GCCardCollectionViewPlainLayout ()

@property (assign, nonatomic, readonly) CGSize headerReferenceSize;
@property (assign, nonatomic, readonly) CGSize itemSize;
@property (strong, nonatomic, readonly) NSMutableDictionary *layoutAttributes;
@property (assign, nonatomic, readonly) CGFloat minimumLineSpacing;
@property (assign, nonatomic, readonly) UIEdgeInsets sectionInset;

@end

@implementation GCCardCollectionViewPlainLayout

@synthesize headerReferenceSize = _headerReferenceSize;
@synthesize itemSize = _itemSize;
@synthesize layoutAttributes = _layoutAttributes;
@synthesize minimumLineSpacing = _minimumLineSpacing;
@synthesize sectionInset = _sectionInset;

#pragma mark - GCCardCollectionViewPlainLayout

- (CGSize)headerReferenceSize {
    if (CGSizeEqualToSize(_headerReferenceSize, CGSizeZero)) {
        _headerReferenceSize = CGSizeMake(300.f, 30.f);
    }
    
    return _headerReferenceSize;
}

- (CGSize)itemSize {
    if (CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        _itemSize = CGSizeMake(300.f, 46.f);
    }
    
    return _itemSize;
}

- (NSMutableDictionary *)layoutAttributes {
    if (!_layoutAttributes) {
        _layoutAttributes = [@{} mutableCopy];
    }
    
    return _layoutAttributes;
}

- (CGFloat)minimumLineSpacing {
    if (_minimumLineSpacing == 0) {
        _minimumLineSpacing = 10.f;
    }
    
    return _minimumLineSpacing;
}

- (UIEdgeInsets)sectionInset {
    if (UIEdgeInsetsEqualToEdgeInsets(_sectionInset, UIEdgeInsetsZero)) {
        _sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    }
    
    return _sectionInset;
}

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    CGFloat height = self.sectionInset.top + self.layoutAttributes.allValues.count * self.itemSize.height + (self.layoutAttributes.allValues.count - 1) * self.minimumLineSpacing + self.sectionInset.bottom;
    CGFloat width = self.collectionView.bounds.size.width;
    
    return CGSizeMake(width, height);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = CGRectMake(self.sectionInset.left, self.sectionInset.top, self.itemSize.width, self.itemSize.height);
    
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributesForElementsInRect = [@[] mutableCopy];
    
    for (NSIndexPath *indexPath in self.layoutAttributes) {
        NSArray *attributes = self.layoutAttributes[indexPath];
        
        for (UICollectionViewLayoutAttributes *attribute in attributes) {
            if (CGRectContainsRect(rect, attribute.frame)) {
                [layoutAttributesForElementsInRect addObject:attribute];
            }
        }
    }
    
    return layoutAttributesForElementsInRect;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    for (NSInteger section = 0; section < self.collectionView.numberOfSections; section++) {
        for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *cellLayoutAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            if (section == 0 && item == 0) {
                self.layoutAttributes[indexPath] = @[ cellLayoutAttributes ];
                continue;
            }
            
            NSInteger previousSection, previousItem;
            NSIndexPath *previousIndexPath = nil;
            UICollectionViewLayoutAttributes *previousAttributes = nil;
            
            // If this is the first item in the section,
            // the previous item is the last item in the previous section.
            if (item == 0) {
                previousSection = section - 1;
                previousItem = [self.collectionView numberOfItemsInSection:previousSection] - 1;
                
            // If this is not the first item in the section,
            // then the previous item is the item before this one.
            } else {
                previousSection = section;
                previousItem = item - 1;
            }
            
            previousIndexPath = [NSIndexPath indexPathForItem:previousItem inSection:previousSection];
            previousAttributes = [(NSArray *)self.layoutAttributes[previousIndexPath] lastObject];
            
            cellLayoutAttributes.frame = CGRectOffset(previousAttributes.frame, 0.f, self.itemSize.height + self.sectionInset.bottom);
            
            self.layoutAttributes[indexPath] = @[ cellLayoutAttributes ];
        }
    }
}

@end
