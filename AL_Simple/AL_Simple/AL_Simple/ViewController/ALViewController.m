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
    id viewObject = [[viewClass alloc] init];
    
    self.view = viewObject;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.viewClassName;
}


@end
