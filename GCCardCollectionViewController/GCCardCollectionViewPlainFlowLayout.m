//
//  GCCardCollectionViewPlainFlowLayout.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-25.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "GCCardCollectionViewPlainFlowLayout.h"

@implementation GCCardCollectionViewPlainFlowLayout

#pragma mark - NSObject

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.headerReferenceSize = CGSizeMake(300.f, 30.f);
    self.itemSize = CGSizeMake(300.f, 64.f);
    self.sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
    
    return self;
}

@end
