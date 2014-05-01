//
//  ALChooserViewController.m
//  AL_Simple
//
//  Created by Mihaela Mihaljević Jakić on 01/05/14.
//  Copyright (c) 2014 Token d.o.o. All rights reserved.
//

#import "ALChooserViewController.h"

#import "ALViewController.h"

#define LAYOUTS_CELL_ID @"layouts_cell"

@interface ALChooserViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *viewClassNames;

@end

@implementation ALChooserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add tableView to view
    [self.view addSubview:self.tableView];
    
    self.title = @"Choose view class name";
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewClassNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //get cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LAYOUTS_CELL_ID];
    
    //set video link as cell's text
    cell.textLabel.text = [self viewClassNameAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *viewClassName = [self viewClassNameAtIndex:indexPath.row];
    
    if (viewClassName) {
        
        ALViewController *detailVC = [[ALViewController alloc] initWithViewClassName:viewClassName];
        
        //instruct navigation controller to push detail view controller
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

#pragma mark - Private Methods

- (NSString *)viewClassNameAtIndex:(NSInteger)index
{
    if ([self.viewClassNames count] > index)
        return [self.viewClassNames objectAtIndex:index];
    return nil;
}

#pragma mark - Properties - Views

- (UITableView *)tableView
{
    if (!_tableView) {
        
        //create tableView
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        //setup table view protocol objects
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        //setup table appearance
        _tableView.rowHeight = 50;
        
        //register reusable cell class ID
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:LAYOUTS_CELL_ID];
    }
    return _tableView;
}


#pragma mark - Private Properties

- (NSArray *)viewClassNames
{
    if (!_viewClassNames) {
        _viewClassNames = @[@"ResizingImageView"];
    }
    return _viewClassNames;
}

@end
