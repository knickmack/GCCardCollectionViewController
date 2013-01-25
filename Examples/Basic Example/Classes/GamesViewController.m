//
//  GamesViewController.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-24.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GamesViewController.h"
#import "UIColor+BasicExample.h"
#import "GCCardCollectionHeaderView.h"
#import "GCCardCollectionViewCell.h"

@interface GamesViewController () <UITableViewDataSource>

@property (strong, nonatomic, readonly) UIImageView *backgroundView;

@end

@implementation GamesViewController

@synthesize backgroundView = _backgroundView;

#pragma mark - GamesViewController

- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"color-wood"]];
    }
    
    return _backgroundView;
}

#pragma mark - UICollectionViewDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [super collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view.backgroundColor = [UIColor clearColor];
        view.layer.contents = (id)[UIImage imageNamed:@"background-section-header"].CGImage;
        view.layer.contentsGravity = kCAGravityLeft;
        view.layer.contentsScale = [UIScreen mainScreen].scale;
    } else {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.dataSource = self;
        
        [view addSubview:tableView];
    }
    
    return view;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return section + 1;
}

- (GCCardCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GCCardCollectionViewCell *cell = (GCCardCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor randomTexture];
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%i", indexPath.row];
    
    return cell;
}

#pragma mark - NSObject

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.title = NSLocalizedString(@"Games", nil);
    
    [self.view insertSubview:self.backgroundView belowSubview:self.collectionView];
    
    return self;
}

@end
