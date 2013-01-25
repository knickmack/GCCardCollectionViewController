//
//  GCCardCollectionFooterView.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-24.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionFooterView.h"

@implementation GCCardCollectionFooterView

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.backgroundColor = [UIColor purpleColor];
    
    return self;
}

@end
