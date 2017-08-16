//
//  ViewController.m
//  BlurEffect
//
//  Created by ohyesih on 16/08/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

#import "ViewController.h"

#import "BlurEffectViewExporter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [BlurEffectViewExporter setImage:[UIImage imageNamed:@"gsw.jpg"] blurRadius:@20 complete:^(UIImage *coverImage) {
        self.imageView.image = coverImage;
    }];
    
}

@end
