//
//  ALViewController.m
//  AL_Basic
//
//  Created by Mihaela Mihaljević Jakić on 20/04/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ALViewController.h"
#import "ALMainView.h"
#import "ALMainViewNSLayout.h"


@interface ALViewController ()

//@property (nonatomic, strong) ALMainView *mainView;

@property (nonatomic, strong) ALMainViewNSLayout *mainView;

@end

@implementation ALViewController


- (void)makeButton
{
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"PrintViews" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(10, 10, 100, 20);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeButton];
}

- (void)buttonClick
{
    [self.mainView printViews];
}


- (void)loadView
{
    self.view = self.mainView;
    [self makeButton];

}

#pragma mark - Properties - Views

- (ALMainViewNSLayout *)mainView
{
    if (!_mainView) {
        _mainView = [[ALMainViewNSLayout alloc] init];
    }
    return _mainView;
}

//- (ALMainView *)mainView
//{
//    if (!_mainView) {
//        _mainView = [[ALMainView alloc] init];
//    }
//    return _mainView;
//}

@end
