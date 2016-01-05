//
//  ViewController.m
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 09.07.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "MLTableViewController.h"
#import "MLTableViewCell.h"

#import "LoremIpsum.h"

@interface MLTableViewController ()
@property (nonatomic, strong) NSMutableArray *contentArray;
@end

@implementation MLTableViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Self Sizing", nil);
    self.view.backgroundColor = [UIColor lightTextColor];
    
    [self.tableView registerClass:[MLTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    self.tableView.estimatedRowHeight = 68.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
    self.contentArray = [@[] mutableCopy];
    for (NSInteger i=0; i<=100; i++) {
        
        NSDictionary *dictionary = @{
                                     @"sentence": [LoremIpsum sentence],
                                     @"name": [LoremIpsum name]
                                     };
        
        [self.contentArray addObject:dictionary];
    }
    
    [self.tableView reloadData];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contentArray count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    MLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dictionary = self.contentArray[indexPath.row];
    
    cell.sentenceLabel.text = dictionary[@"sentence"];
    cell.nameLabel.text = dictionary[@"name"];
    return cell;
}

@end
