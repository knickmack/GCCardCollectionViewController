//
//  GCCardCollectionViewSelectedFlowLayout.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-25.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewSelectedFlowLayout.h"

@implementation GCCardCollectionViewSelectedFlowLayout

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    CGRect frame = attributes.frame;
    
    frame.origin = CGPointZero;
    attributes.frame = frame;
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    CGRect frame = attributes.frame;
    
    frame.origin = CGPointMake(self.sectionInset.left, self.headerReferenceSize.height + self.minimumLineSpacing);
    attributes.frame = frame;
    
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        CGRect frame = attribute.frame;
        
        if (attribute.representedElementCategory == UICollectionElementCategorySupplementaryView) {
                frame.origin = CGPointZero;
        } else {
            frame.origin = CGPointMake(self.sectionInset.left, self.headerReferenceSize.height + self.minimumLineSpacing);
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
    
    self.headerReferenceSize = CGSizeMake(300.f, 30.f);
    self.itemSize = CGSizeMake(300.f, 236.f);
    self.sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    
    return self;
}

@end
