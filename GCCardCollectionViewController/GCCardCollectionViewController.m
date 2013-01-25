//
//  GCCardCollectionViewController.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-23.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewController.h"
#import "GCCardCollectionViewPlainLayout.h"
#import "GCCardCollectionViewSelectedLayout.h"
#import "GCCardCollectionHeaderView.h"
#import "GCCardCollectionViewCell.h"
#import "GCCardCollectionFooterView.h"

static NSString * const GCCardCollectionHeaderViewIdentifier = @"Header";
static NSString * const GCCardCollectionViewCellIdentifier = @"Cell";
static NSString * const GCCardCollectionFooterViewIdentifier = @"Footer";

@interface GCCardCollectionViewController ()

@property (strong, nonatomic, readonly) GCCardCollectionViewPlainLayout *cardCollectionViewPlainLayout;
@property (strong, nonatomic, readonly) GCCardCollectionViewSelectedLayout *cardCollectionViewSelectedFlowLayout;

@end

@implementation GCCardCollectionViewController

@synthesize cardCollectionViewPlainLayout = _cardCollectionViewPlainLayout;
@synthesize cardCollectionViewSelectedFlowLayout = _cardCollectionViewSelectedFlowLayout;

#pragma mark - GCCardCollectionViewController

- (GCCardCollectionViewSelectedLayout *)cardCollectionViewSelectedFlowLayout {
    if (!_cardCollectionViewSelectedFlowLayout) {
        _cardCollectionViewSelectedFlowLayout = [GCCardCollectionViewSelectedLayout new];
    }
    
    return _cardCollectionViewSelectedFlowLayout;
}

#pragma mark - UICollectionViewDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        GCCardCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GCCardCollectionHeaderViewIdentifier forIndexPath:indexPath];
        
        return header;
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        GCCardCollectionFooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:GCCardCollectionFooterViewIdentifier forIndexPath:indexPath];
        
        return footer;
    }
    
    return nil;
}

- (GCCardCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GCCardCollectionViewCell *cell = (GCCardCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:GCCardCollectionViewCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionView setCollectionViewLayout:self.cardCollectionViewSelectedFlowLayout animated:YES];
}

#pragma mark - NSObject

- (id)init {
    _cardCollectionViewPlainLayout = [GCCardCollectionViewPlainLayout new];
    
    self = [super initWithCollectionViewLayout:_cardCollectionViewPlainLayout];
    if (!self) {
        return nil;
    }
    
    [self.collectionView registerClass:[GCCardCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GCCardCollectionHeaderViewIdentifier];
    [self.collectionView registerClass:[GCCardCollectionViewCell class] forCellWithReuseIdentifier:GCCardCollectionViewCellIdentifier];
    [self.collectionView registerClass:[GCCardCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:GCCardCollectionFooterViewIdentifier];
    
    return self;
}

@end
