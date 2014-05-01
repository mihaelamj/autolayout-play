//
//  ALViewController.m
//  AL_Simple
//
//  Created by Mihaela Mihaljević Jakić on 01/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ALViewController.h"

#import "ResizingImageView.h"

@interface ALViewController ()

@property (nonatomic, strong) NSString *viewClassName;

@end

@implementation ALViewController

- (instancetype)initWithViewClassName:(NSString *)viewClassName
{
    self = [super init];
    if (self) {
        _viewClassName = viewClassName;
    }
    return self;
}

- (void)loadView
{
    //make  view
    Class viewClass = NSClassFromString(self.viewClassName);
    id viewObject;
    
    CGFloat topOffset = [self.topLayoutGuide length];
    CGFloat bottomOffset = [self.bottomLayoutGuide length];
    
    if ([viewClass respondsToSelector:@selector(viewWithTopOffset:bottomOffset:)]) {
        viewObject = [viewClass viewWithTopOffset:topOffset bottomOffset:bottomOffset];
    } else {
        viewObject = [[viewClass alloc] init];
    }
    
//    id viewObject = [[viewClass alloc] init];

    self.view = viewObject;
    
    //force measuring of the view
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
//
    
    //hook up view buttons
    if ([self.view respondsToSelector:@selector(bottomLeftButton)]) {
        UIButton *leftButton = [self.view performSelector:@selector(bottomLeftButton)];
        if (leftButton) {
            [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    if ([self.view respondsToSelector:@selector(bottomRightButton)]) {
        UIButton *rightButton = [self.view performSelector:@selector(bottomRightButton)];
        if (rightButton) {
            [rightButton addTarget:self action:@selector(rightButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [self makeButton];
}

#pragma mark - View Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.viewClassName;
}

- (void)viewDidLayoutSubviews
{
//    [self setViewViewController:self];
    CGFloat topOffset = [self.topLayoutGuide length];
    CGFloat bottomOffset = [self.bottomLayoutGuide length];
}


- (void)leftButtonPressed
{
    NSLog(@"Left Button");
    
    //set self as view's myViewController property
}

- (void)rightButtonPressed
{
   NSLog(@"Right Button");
}


#pragma mark - Private Methods

- (void)makeButton
{
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"PrintViews" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(10, 70, 100, 20);
    button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    if ([self.view respondsToSelector:@selector(printViews)]) {
        [self.view performSelector:@selector(printViews)];
    }
}



@end
