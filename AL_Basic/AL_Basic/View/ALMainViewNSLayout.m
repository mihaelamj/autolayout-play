//
//  ALMainViewNSLayout.m
//  AL_Basic
//
//  Created by Mihaela Mihaljević Jakić on 21/04/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ALMainViewNSLayout.h"

@implementation ALMainViewNSLayout

- (void)setupConstraints
{
    //put infoLabel in 10px above self
    NSLayoutConstraint *constraintLabelTop = [NSLayoutConstraint constraintWithItem:self.infoLabel
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0f
                                                                           constant:30];
    
    //center imageView in super view on X
    NSLayoutConstraint *constraintImageX = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterX
                                                                       multiplier:1.0f
                                                                         constant:0];
    
    //image widyh
    NSLayoutConstraint *constraintImageWidth = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0f
                                                                             constant:100];
    constraintImageWidth.priority = 300;
    
    //image width
    NSLayoutConstraint *constraintImageHeight = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.imageView
                                                                             attribute:NSLayoutAttributeWidth
                                                                            multiplier:1.0f
                                                                              constant:0];
    constraintImageHeight.priority = 300;
    
    //put imageView in 10px above infolabel bottom
    NSLayoutConstraint *constraintImageBottom = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                             attribute:NSLayoutAttributeTop
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.infoLabel
                                                                             attribute:NSLayoutAttributeBottom
                                                                            multiplier:1.0f
                                                                              constant:10];
    
    
    //put infoLabel left same as imageView
    NSLayoutConstraint *constraintLabelLeft = [NSLayoutConstraint constraintWithItem:self.infoLabel
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.imageView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.0f
                                                                            constant:0];
    
    //   enlargeButton 10 above bottom
    NSLayoutConstraint *constraintCancelTop = [NSLayoutConstraint constraintWithItem:self.enlargeButton
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0f
                                                                            constant:-10];
    
    //put editButton top as cancel
    NSLayoutConstraint *constraintEditTop = [NSLayoutConstraint constraintWithItem:self.shrinkButton
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.enlargeButton
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0f
                                                                          constant:0];
    

    
    //put shrink Button left as imageView
    NSLayoutConstraint *constraintEditLeft = [NSLayoutConstraint constraintWithItem:self.shrinkButton
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.imageView
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0f
                                                                           constant:0];
    
    
    NSLayoutConstraint *constraintEditWidth= [NSLayoutConstraint constraintWithItem:self.shrinkButton
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0f
                                                                           constant:100];
    
    NSLayoutConstraint *constraintCancelWidth= [NSLayoutConstraint constraintWithItem:self.enlargeButton
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.shrinkButton
                                                                            attribute:NSLayoutAttributeWidth
                                                                           multiplier:1.0f
                                                                             constant:0];
    
    
    //put cancelButton 10 px left after cancelButton
    NSLayoutConstraint *constraintCancelLeft = [NSLayoutConstraint constraintWithItem:self.enlargeButton
                                                                            attribute:NSLayoutAttributeLeft
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.shrinkButton
                                                                            attribute:NSLayoutAttributeRight
                                                                           multiplier:1.0f
                                                                             constant:10];
    
    
    [self addConstraints: @[constraintLabelTop, constraintImageX, constraintImageBottom, constraintLabelLeft, constraintCancelTop, constraintEditTop, constraintEditLeft, constraintCancelLeft, constraintEditWidth, constraintCancelWidth, constraintImageWidth, constraintImageHeight]];
}

@end
