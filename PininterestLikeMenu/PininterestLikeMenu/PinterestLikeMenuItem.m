//
//  PininterestLikeMenuItem.m
//  PininterestLikeMenu
//
//  Created by Tu You on 12/21/13.
//  Copyright (c) 2013 Tu You. All rights reserved.
//

#import "PinterestLikeMenuItem.h"



@interface PinterestLikeMenuItem ()

@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation PinterestLikeMenuItem {
    UILabel *_subButtonLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithImage:(UIImage *)image selctedImage:(UIImage *)selectedImage selectedBlock:(SelectedBlock)selectedBlock
{
    if (self = [super init])
    {
        self.bounds = CGRectMake(0, 0, kMenuItemLength, kMenuItemLength);
        
        self.imageView = [[UIImageView alloc] initWithImage:image];
        self.imageView.frame = self.bounds;
        self.imageView.image = image;
        self.imageView.highlightedImage = selectedImage;
        [self addSubview:self.imageView];
        
        self.selectedBlock = selectedBlock;
        
        _subButtonLabel = [[UILabel alloc] initWithFrame:CGRectMake(ceilf((kMenuItemLength - 50) / 2.0), ceilf((kMenuItemLength - 20) / 2.0) - 40.0, 50.0, 20.0)];
        _subButtonLabel.font = [UIFont systemFontOfSize:14.0];
        _subButtonLabel.textColor = [UIColor whiteColor];
        _subButtonLabel.backgroundColor = [UIColor clearColor];
        _subButtonLabel.layer.cornerRadius = 10.0;
        _subButtonLabel.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8].CGColor;
        _subButtonLabel.text = @"test";
        _subButtonLabel.textAlignment = NSTextAlignmentCenter;
        _subButtonLabel.transform = CGAffineTransformMakeScale(0.1, 0.1);
        _subButtonLabel.alpha = 0.0;

        [self addSubview:_subButtonLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected != _selected) {
        
        [UIView animateWithDuration:0.2 animations:^{
            if (selected) {
                _subButtonLabel.transform = CGAffineTransformIdentity;
            } else {
                _subButtonLabel.transform = CGAffineTransformMakeScale(0.1, 0.1);
            }
            _subButtonLabel.alpha = selected ? 1.0 : 0.0;
        }];
    }
    _selected = selected;
    self.imageView.highlighted = selected;
}


@end
