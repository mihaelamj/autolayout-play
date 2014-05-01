//
//  ResizingImageView.m
//  AL_Simple
//
//  Created by Mihaela Mihaljević Jakić on 01/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ResizingImageView.h"

static const NSInteger kGeneralOffset = 20;

@interface ResizingImageView ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIImageView *middleImageView;

@end

@implementation ResizingImageView

- (instancetype)init
{
    return [self initWithTopOffset:0 bottomOffset:0];
}

- (instancetype)initWithTopOffset:(CGFloat)topOffset bottomOffset:(CGFloat)bottomOffset
{
    self = [super init];
    if (self) {
        
        _topOffset = topOffset;
        _bottomOffset = bottomOffset;
        
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        
        //add subviews
        [self addSubview:self.topLabel];
        [self addSubview:self.bottomRightButton];
        [self addSubview:self.bottomLeftButton];
        [self addSubview:self.middleImageView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

+ (instancetype)viewWithTopOffset:(CGFloat)topOffset bottomOffset:(CGFloat)bottomOffset
{
    ResizingImageView *view = [[ResizingImageView alloc] initWithTopOffset:topOffset bottomOffset:bottomOffset];
    return view;
}

- (void)printViews
{
    NSLog(@"Self Frame %@", NSStringFromCGRect(self.frame));
    NSLog(@"topLabel Frame %@", NSStringFromCGRect(self.topLabel.frame));
    NSLog(@"bottomRightButton Frame %@", NSStringFromCGRect(self.bottomRightButton.frame));
    NSLog(@"bottomLeftButton Frame %@", NSStringFromCGRect(self.bottomLeftButton.frame));
    NSLog(@"middleImageView Frame %@", NSStringFromCGRect(self.middleImageView.frame));
    
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

#pragma mark - Auto Layout

- (void)setupMyConstraints
{
    //save top constraint for later
    //topLabel top
    NSLayoutConstraint *constraintTopLabelTop = [NSLayoutConstraint constraintWithItem:self.topLabel
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0f
                                                                           constant:kGeneralOffset + self.topOffset];
    
    //topLabel leading
    NSLayoutConstraint *constraintTopLabelLeading = [NSLayoutConstraint constraintWithItem:self.topLabel
                                                                             attribute:NSLayoutAttributeLeading
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self
                                                                             attribute:NSLayoutAttributeLeading
                                                                            multiplier:1.0f
                                                                              constant:kGeneralOffset];
    
    //center middleImageView in super view on X
    NSLayoutConstraint *constraintMiddleImageX = [NSLayoutConstraint constraintWithItem:self.middleImageView
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterX
                                                                       multiplier:1.0f
                                                                         constant:0];
    
    //middleImageView below label
    NSLayoutConstraint *constraintMiddleImageY = [NSLayoutConstraint constraintWithItem:self.middleImageView
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.topLabel
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.0f
                                                                               constant:kGeneralOffset];
    
    //middleImageView above buttons
    NSLayoutConstraint *constraintMiddleImageBottom = [NSLayoutConstraint constraintWithItem:self.middleImageView
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.bottomLeftButton
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0f
                                                                               constant:-kGeneralOffset];
    
    //bottomLeftButton 20 above bottom
    NSLayoutConstraint *constraintbottomLeftButtonBottom = [NSLayoutConstraint constraintWithItem:self.bottomLeftButton
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0f
                                                                            constant:-(kGeneralOffset + self.bottomOffset)];
    
    //bottomLeftButton leading
    NSLayoutConstraint *constraintbottomLeftButtonLeading = [NSLayoutConstraint constraintWithItem:self.bottomLeftButton
                                                                                        attribute:NSLayoutAttributeLeading
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self
                                                                                        attribute:NSLayoutAttributeLeading
                                                                                       multiplier:1.0f
                                                                                         constant:kGeneralOffset];
    
    //bottomRightButton 20 above bottom
    NSLayoutConstraint *constraintbottomRightButtonBottom = [NSLayoutConstraint constraintWithItem:self.bottomRightButton
                                                                                        attribute:NSLayoutAttributeBottom
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self
                                                                                        attribute:NSLayoutAttributeBottom
                                                                                       multiplier:1.0f
                                                                                         constant:-(kGeneralOffset + self.bottomOffset)];
    
    //bottomRightButton trailing
    NSLayoutConstraint *constraintbottomRightButtonTrailing = [NSLayoutConstraint constraintWithItem:self.bottomRightButton
                                                                                         attribute:NSLayoutAttributeTrailing
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                            toItem:self
                                                                                         attribute:NSLayoutAttributeTrailing
                                                                                        multiplier:1.0f
                                                                                          constant:-kGeneralOffset];
    
    [self addConstraints: @[constraintTopLabelTop, constraintTopLabelLeading, constraintbottomLeftButtonBottom, constraintbottomLeftButtonLeading, constraintbottomRightButtonBottom, constraintbottomRightButtonTrailing,
                            constraintMiddleImageX, constraintMiddleImageY, constraintMiddleImageBottom]];
    
    
//Without setting these priorities the image will not resize, but keep it's insrinsic content size
    
    //Set the vertical priorities to be less than those of the other subviews (defaults are 250 and 750)
    [self.middleImageView setContentHuggingPriority:200 forAxis:UILayoutConstraintAxisVertical];
    [self.middleImageView setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisVertical];
    
    //Set the horizontal priorities to be less than those of the other subviews (defaults are 250 and 750)
    [self.middleImageView setContentHuggingPriority:200 forAxis:UILayoutConstraintAxisHorizontal];
    [self.middleImageView setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisHorizontal];
    
}

- (void)updateConstraints
{
    [self removeConstraints:self.constraints];
    
    [self setupMyConstraints];
    
    [super updateConstraints];
}

#pragma mark - Public Properties

- (void)setTopOffset:(CGFloat)topOffset
{
    _topOffset = topOffset;
    [self setNeedsUpdateConstraints];
}

- (void)setBottomOffset:(CGFloat)bottomOffset
{
    _bottomOffset = bottomOffset;
    [self setNeedsUpdateConstraints];
}

#pragma mark - Private Properties - Views

- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont systemFontOfSize:14];
        _topLabel.textColor = [UIColor redColor];
        _topLabel.text = @"Some information about the image...";
        
        [_topLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _topLabel;
}

- (UIButton *)bottomLeftButton
{
    if (!_bottomLeftButton) {
        _bottomLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomLeftButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_bottomLeftButton setTitle:@"Bottom Left" forState:UIControlStateNormal];
        _bottomLeftButton.backgroundColor = [UIColor grayColor];
        
        [_bottomLeftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _bottomLeftButton;
}

- (UIButton *)bottomRightButton
{
    if (!_bottomRightButton) {
        _bottomRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomRightButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_bottomRightButton setTitle:@"Bottom Right" forState:UIControlStateNormal];
        _bottomRightButton.backgroundColor = [UIColor grayColor];
        
        [_bottomRightButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _bottomRightButton;
}

- (UIImageView *)middleImageView
{
    if (!_middleImageView) {
        _middleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heisenberg.jpg"]];
        
        // The contentMode of the image view in the XIB was Aspect Fit:
        _middleImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_middleImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _middleImageView;
}


@end
