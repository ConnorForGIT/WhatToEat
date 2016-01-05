//
//  ViewController.m
//  WhatToEat
//
//  Created by ConnorJ on 15/10/14.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import "ViewController.h"
#import "NetworkRequest.h"
#import <MaryPopin/UIViewController+MaryPopin.h>
#import "WhatToEatPrefixHeader.pch"
#import "FBShimmeringView.h"
#import "BaseModel.h"

@interface ViewController ()
{
    UIImageView *_wallpaperView;
    FBShimmeringView *_shimmeringView;
    UIView *_contentView;
    UILabel *_logoLabel;
    
    UILabel *_valueLabel;
    
    CGFloat _panStartValue;
    BOOL _panVertical;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.size = CGSizeMake(50, 50);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blackColor];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id sender) {
         [self pressedShowCCMPlayNDropView:sender];
     }];
    [self.view addSubview:btn];
    
}

-(void)pressedShowCCMPlayNDropView:(id)sender
{
    UIViewController *popin = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PlayNDropViewController"];
    popin.view.bounds = CGRectMake(0, 0, 300, 400);
    [popin setPopinTransitionStyle:BKTPopinTransitionStyleSnap];
    //[popin setPopinOptions:BKTPopinDisableAutoDismiss];
    BKTBlurParameters *blurParameters = [[BKTBlurParameters alloc] init];
    //blurParameters.alpha = 0.5;
    blurParameters.tintColor = [UIColor colorWithWhite:0 alpha:0.5];
    blurParameters.radius = 0.3;
    [popin setBlurParameters:blurParameters];
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    //popin.presentingController = self;

    [self presentPopinController:popin animated:YES completion:^{
        
        [self HeheWithSubView:popin.view];
        
        [NetworkRequest NetworkRequestWithDict:nil BlockCompletion:^(id result) {
            NSMutableArray *arr = result;
            int n = [self getRandomNumber:0 to:(int)arr.count];
            NSLog(@"%d", n);

            NSString *longStr = [(BaseModel *)result[n] name];
            NSString *string1 = @"(";
            NSRange range = [longStr rangeOfString:string1];
            NSUInteger location = range.location;
            
            if (location && location < 99) {
                _logoLabel.text = [longStr substringToIndex:location];
            } else {
                _logoLabel.text = longStr;
            }
            
            _logoLabel.alpha = 0;
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _logoLabel.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
            
        } ErrorBlock:^(id result) {
            
        }];
    }];
}

- (void)HeheWithSubView:(UIView *)subView
{
    
    CGRect valueFrame = subView.bounds;
    valueFrame.size.height = valueFrame.size.height * 0.25;

    CGRect shimmeringFrame = subView.bounds;
    shimmeringFrame.origin.y = 0;
    shimmeringFrame.size.height = shimmeringFrame.size.height * 0.32;
    
    _shimmeringView = [[FBShimmeringView alloc] initWithFrame:shimmeringFrame];
    _shimmeringView.shimmering = YES;
    _shimmeringView.shimmeringBeginFadeDuration = 0.3;
    _shimmeringView.shimmeringOpacity = 0.3;
    _shimmeringView.alpha = 0.3;
    _shimmeringView.layer.position = CGPointMake(subView.width / 2, subView.height / 2);

    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shimmeringViewTapGRAction:)];
    [_shimmeringView addGestureRecognizer:tapGR];
    
    [subView addSubview:_shimmeringView];
    
    _logoLabel = [[UILabel alloc] initWithFrame:_shimmeringView.bounds];
    _logoLabel.text = @"---";
    _logoLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30.0];
    _logoLabel.textColor = [UIColor blackColor];
    _logoLabel.textAlignment = NSTextAlignmentCenter;
    _shimmeringView.contentView = _logoLabel;
    
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _shimmeringView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)shimmeringViewTapGRAction:(UIGestureRecognizer *)sender
{
    
}

- (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from)));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imgView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, 10);

}


@end
