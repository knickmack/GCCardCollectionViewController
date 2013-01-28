//
//  GamesCollectionViewCell.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-28.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GamesCollectionViewCell.h"

@implementation GamesCollectionViewCell

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.layer.cornerRadius = 5.f;
    self.layer.masksToBounds = YES;
    
    return self;
}

@end
