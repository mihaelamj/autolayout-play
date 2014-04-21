//
//  ALMainView.h
//  AL_Basic
//
//  Created by Mihaela Mihaljević Jakić on 20/04/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ALMainView : UIView

@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIButton *shrinkButton;
@property (nonatomic, strong) UIButton *enlargeButton;
@property (nonatomic, strong) UIImageView *imageView;

- (void)printViews;

//abstract
- (void)setupConstraints;

@end
