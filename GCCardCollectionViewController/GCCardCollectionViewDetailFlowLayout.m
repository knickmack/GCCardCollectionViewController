//
//  GCCardCollectionViewDetailFlowLayout.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-25.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewDetailFlowLayout.h"

@implementation GCCardCollectionViewDetailFlowLayout

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    CGRect frame = attributes.frame;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        
        frame.origin = CGPointMake(0.f, 10.f);
        attributes.frame = frame;
        attributes.zIndex = cell.selected;
    } else {
        frame.origin = CGPointMake(0.f, 296.f);
        attributes.frame = frame;
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    CGRect frame = attributes.frame;
    
    frame.origin = CGPointMake(self.sectionInset.left, self.sectionInset.top + self.headerReferenceSize.height + self.minimumLineSpacing);
    attributes.frame = frame;
    attributes.zIndex = [self.collectionView.indexPathsForSelectedItems containsObject:indexPath];
    
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        CGRect frame = attribute.frame;
        
        if (attribute.representedElementCategory == UICollectionElementCategorySupplementaryView) {
            if ([attribute.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                frame.origin = CGPointMake(0.f, 10.f);
            } else {
                frame.origin = CGPointMake(0.f, 296.f);
                attribute.frame = frame;
            }
        } else {
            frame.origin = CGPointMake(self.sectionInset.left, self.sectionInset.top + self.headerReferenceSize.height + self.minimumLineSpacing);
        }
        
        attribute.frame = frame;
    }
    
    return attributes;
}

#pragma mark - NSObject

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.footerReferenceSize = CGSizeMake(300.f, 208.f);
    self.headerReferenceSize = CGSizeMake(300.f, 30.f);
    self.itemSize = CGSizeMake(300.f, 236.f);
    self.sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    
    return self;
}

@end
