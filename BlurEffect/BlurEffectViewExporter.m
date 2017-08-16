//
//  BlurEffectExporter.m
//  BlurEffect
//
//  Created by ohyesih on 16/08/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

#import "BlurEffectViewExporter.h"

@implementation BlurEffectViewExporter

+ (void)setImage:(UIImage *)image blurRadius:(NSNumber *)radius complete:(CompleteBlock)complete {
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    CIContext *ciContext = [CIContext context];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:radius forKey:kCIInputRadiusKey];
    
    CGRect rect = CGRectMake(radius.floatValue, radius.floatValue, CGRectGetWidth(ciImage.extent) - radius.floatValue * 2 , CGRectGetHeight(ciImage.extent) - radius.floatValue * 2);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        CGImageRef cgImageRef = [ciContext createCGImage:filter.outputImage fromRect:rect];
        dispatch_async(dispatch_get_main_queue(), ^{
            complete([UIImage imageWithCGImage:cgImageRef]);
        });
    });
}

@end
