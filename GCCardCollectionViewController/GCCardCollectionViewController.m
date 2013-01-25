//
//  GCCardCollectionViewController.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-23.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewController.h"
#import "GCCardCollectionViewSelectedFlowLayout.h"
#import "GCCardCollectionViewDetailFlowLayout.h"
#import "GCCardCollectionHeaderView.h"
#import "GCCardCollectionViewCell.h"
#import "GCCardCollectionFooterView.h"

static NSString * const GCCardCollectionHeaderViewIdentifier = @"Header";
static NSString * const GCCardCollectionViewCellIdentifier = @"Cell";
static NSString * const GCCardCollectionFooterViewIdentifier = @"Footer";

@interface GCCardCollectionViewController ()

@property (strong, nonatomic, readonly) UICollectionViewFlowLayout *cardCollectionViewPlainFlowLayout;
@property (strong, nonatomic, readonly) GCCardCollectionViewSelectedFlowLayout *cardCollectionViewSelectedFlowLayout;
@property (strong, nonatomic, readonly) GCCardCollectionViewDetailFlowLayout *cardCollectionViewDetailFlowLayout;

@end

@implementation GCCardCollectionViewController

@synthesize cardCollectionViewPlainFlowLayout = _cardCollectionViewPlainFlowLayout;
@synthesize cardCollectionViewSelectedFlowLayout = _cardCollectionViewSelectedFlowLayout;
@synthesize cardCollectionViewDetailFlowLayout = _cardCollectionViewDetailFlowLayout;

#pragma mark - GCCardCollectionViewController

- (GCCardCollectionViewSelectedFlowLayout *)cardCollectionViewSelectedFlowLayout {
    if (!_cardCollectionViewSelectedFlowLayout) {
        _cardCollectionViewSelectedFlowLayout = [GCCardCollectionViewSelectedFlowLayout new];
    }
    
    return _cardCollectionViewSelectedFlowLayout;
}

- (GCCardCollectionViewDetailFlowLayout *)cardCollectionViewDetailFlowLayout {
    if (!_cardCollectionViewDetailFlowLayout) {
        _cardCollectionViewDetailFlowLayout = [GCCardCollectionViewDetailFlowLayout new];
    }
    
    return _cardCollectionViewDetailFlowLayout;
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
    [self.collectionView setCollectionViewLayout:self.cardCollectionViewDetailFlowLayout animated:YES];
}

#pragma mark - UIViewController

- (void)didReceiveMemoryWarning {
    _cardCollectionViewPlainFlowLayout = nil;
    _cardCollectionViewSelectedFlowLayout = nil;
    _cardCollectionViewDetailFlowLayout = nil;
    
    [super didReceiveMemoryWarning];
}

#pragma mark - NSObject

- (id)init {
    _cardCollectionViewPlainFlowLayout = [UICollectionViewFlowLayout new];
    
    _cardCollectionViewPlainFlowLayout.headerReferenceSize = CGSizeMake(300.f, 30.f);
    _cardCollectionViewPlainFlowLayout.itemSize = CGSizeMake(300.f, 64.f);
    _cardCollectionViewPlainFlowLayout.sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    
    self = [super initWithCollectionViewLayout:_cardCollectionViewPlainFlowLayout];
    if (!self) {
        return nil;
    }
    
    [self.collectionView registerClass:[GCCardCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GCCardCollectionHeaderViewIdentifier];
    [self.collectionView registerClass:[GCCardCollectionViewCell class] forCellWithReuseIdentifier:GCCardCollectionViewCellIdentifier];
    [self.collectionView registerClass:[GCCardCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:GCCardCollectionFooterViewIdentifier];
    
    return self;
}

@end
