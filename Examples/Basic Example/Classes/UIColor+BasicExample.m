//
//  UIColor+Random.m
//  Basic Example
//
//  Created by Nik Macintosh on 2013-01-24.
//  Copyright (c) 2013 GameCall Social Sports. All rights reserved.
//

#import "UIColor+BasicExample.h"

@implementation UIColor (BasicExample)

+ (UIColor *)carbonColor {
    UIImage *image = [UIImage imageNamed:@"color-carbon"];
    
    return [UIColor colorWithPatternImage:image];
}

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}

+ (UIColor *)randomTexture {
    NSArray *names = @[ @"badminton", @"baseball", @"basketball", @"fitness", @"football", @"golf", @"hockey", @"soccer", @"tennis", @"yoga" ];
    NSMutableArray *textures = [@[] mutableCopy];
    
    for (NSString *name in names) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"color-%@", name]];
        UIColor *color = [UIColor colorWithPatternImage:image];
        
        [textures addObject:color];
    }
    
    return [textures objectAtIndex:arc4random_uniform(textures.count)];
}

+ (UIColor *)woodColor {
    UIImage *image = [UIImage imageNamed:@"color-wood"];
    
    return [UIColor colorWithPatternImage:image];
}

@end
