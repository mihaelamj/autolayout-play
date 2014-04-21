//
//  ALMainView.m
//  AL_Basic
//
//  Created by Mihaela Mihaljević Jakić on 20/04/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ALMainView.h"

@implementation ALMainView

- (id)init
{
    self = [super init];
    if (self) {
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addSubview:self.infoLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.shrinkButton];
        [self addSubview:self.enlargeButton];
        
        self.imageView.backgroundColor = [UIColor blueColor];
        
        [self setupConstraints];
        
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

/*
 If any property of your view changes, and that change affects the intrinsic content size, your view must call invalidateIntrinsicContentSize so that the layout system notices the change and can recalculate the layout. 
 For example, a text field calls invalidateIntrinsicContentSize if the string value changes.
 */

#pragma mark - Autolayout

- (void)printViews
{
    NSLog(@"Self Frame %@", NSStringFromCGRect(self.frame));
    NSLog(@"infoLabel Frame %@", NSStringFromCGRect(self.infoLabel.frame));
    NSLog(@"imageView Frame %@", NSStringFromCGRect(self.imageView.frame));
    NSLog(@"editButton Frame %@", NSStringFromCGRect(self.shrinkButton.frame));
    NSLog(@"cancelButton Frame %@", NSStringFromCGRect(self.enlargeButton.frame));
    
    for (UIView *aView in [self subviews]) {
        if ([aView hasAmbiguousLayout]) {
            NSLog(@"-");
            NSLog(@"class %@", [aView class]);
            NSLog(@"1: %@", [aView constraintsAffectingLayoutForAxis:1]);
            NSLog(@"2 :%@", [aView constraintsAffectingLayoutForAxis:0]);
            
            [aView exerciseAmbiguityInLayout];
        }
    }
    
    NSLog(@"Self constraints %@", self.constraints);
}

- (void)updateConstraints
{
//    [self setupConstraints];
    [super updateConstraints];
    
}

- (void)setupConstraints
{
 //abstract
}

#pragma mark - Public properties - Views

- (UILabel *)infoLabel
{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.font = [UIFont systemFontOfSize:14];
        _infoLabel.textColor = [UIColor blueColor];
        _infoLabel.text = @"Some information about the image";
        [_infoLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _infoLabel;
}

- (UIButton *)shrinkButton
{
    if (!_shrinkButton) {
        _shrinkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shrinkButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_shrinkButton setTitle:@"Shrink" forState:UIControlStateNormal];
        _shrinkButton.backgroundColor = [UIColor grayColor];
        
        [_shrinkButton setContentCompressionResistancePriority:500 forAxis:UILayoutConstraintAxisHorizontal];
        [_shrinkButton setContentHuggingPriority:401 forAxis:UILayoutConstraintAxisHorizontal];
        
        [_shrinkButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _shrinkButton;
}

- (UIButton *)enlargeButton
{
    if (!_enlargeButton) {
        _enlargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _enlargeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_enlargeButton setTitle:@"Enlarge" forState:UIControlStateNormal];
        
        [_enlargeButton setContentCompressionResistancePriority:500 forAxis:UILayoutConstraintAxisHorizontal];
        [_enlargeButton setContentHuggingPriority:401 forAxis:UILayoutConstraintAxisHorizontal];
        
        _enlargeButton.backgroundColor = [UIColor grayColor];
        [_enlargeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _enlargeButton;
}

//image is 256x256
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Camera.png"]];
        [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _imageView;
}



@end
