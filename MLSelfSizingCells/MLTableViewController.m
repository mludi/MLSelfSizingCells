//
//  ViewController.m
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 09.07.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "MLTableViewController.h"
#import "LoremIpsum.h"

@interface MLTableViewController ()
@property (nonatomic, strong) NSMutableArray *contentArray;
@end

@implementation MLTableViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightTextColor];
    self.contentArray = [@[] mutableCopy];
    for (NSInteger i=0; i<=100; i++) {
        [self.contentArray addObject:[LoremIpsum sentence]];
    }
    
    [self.tableView reloadData];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
