//
//  ResizingImageView.h
//  AL_Simple
//
//  Created by Mihaela Mihaljević Jakić on 01/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResizingImageView : UIView

@property (nonatomic, strong) UIButton *bottomLeftButton;
@property (nonatomic, strong) UIButton *bottomRightButton;

@property (nonatomic) CGFloat topOffset;
@property (nonatomic) CGFloat bottomOffset;

+ (instancetype)viewWithTopOffset:(CGFloat)topOffset bottomOffset:(CGFloat)bottomOffset;

@end
