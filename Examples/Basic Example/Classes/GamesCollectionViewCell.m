//
//  GamesCollectionViewCell.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-28.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GamesCollectionViewCell.h"
#import "UIColor+BasicExample.h"

@implementation GamesCollectionViewCell

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.backgroundColor = [UIColor randomTexture];
    self.layer.cornerRadius = 5.f;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.f, 2.f);
    self.layer.shadowOpacity = 0.6f;
    self.layer.shadowRadius = 1.f;
    self.layer.shouldRasterize = YES;
    
    return self;
}

@end
