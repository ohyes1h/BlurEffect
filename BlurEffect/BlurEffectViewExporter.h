//
//  BlurEffectExporter.h
//  BlurEffect
//
//  Created by ohyesih on 16/08/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CompleteBlock)(UIImage *coverImage);

@interface BlurEffectViewExporter : NSObject

+ (void)setImage:(UIImage *)image blurRadius:(NSNumber *)radius complete:(CompleteBlock)complete;

@end
