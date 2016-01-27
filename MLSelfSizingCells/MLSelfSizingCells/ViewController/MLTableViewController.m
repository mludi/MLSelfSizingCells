//
//  ViewController.m
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 09.07.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "MLTableViewController.h"
#import "MLTableViewCell.h"
#import "MLModel.h"

#import "LoremIpsum.h"
#import "ImageDownloader.h"

@interface MLTableViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;
@end

@implementation MLTableViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    
    self.title = NSLocalizedString(@"Self Sizing", nil);
    self.view.backgroundColor = [UIColor lightTextColor];
    
    [self.tableView registerClass:[MLTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    self.tableView.estimatedRowHeight = 68.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
    self.contentArray = [@[] mutableCopy];
    for (NSInteger i=0; i<=100; i++) {
        
        MLModel *theModel = [[MLModel alloc] init];
        theModel.sentence = [LoremIpsum sentence];
        theModel.name = [LoremIpsum name];
        theModel.imageURLString = @"http://dummyimage.com/80x80/0000ff/ffebff";
        
        [self.contentArray addObject:theModel];
    }
    
    [self.tableView reloadData];
 
}

- (void)terminateAllDownloads {
    
//    for (ImageDownloader *theImageDownloader in self.imageDownloadsInProgress) {
//        [theImageDownloader cancelDownload];
//    }
    
    NSArray *allDownloadsArray = [self.imageDownloadsInProgress allValues];
    [allDownloadsArray makeObjectsPerformSelector:@selector(cancelDownload)];
    
    [self.imageDownloadsInProgress removeAllObjects];
}

- (void)dealloc {
    [self terminateAllDownloads];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self terminateAllDownloads];
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

    MLModel *theModel = (MLModel *)self.contentArray[indexPath.row];
    
    cell.sentenceLabel.text = theModel.sentence;
    cell.nameLabel.text = theModel.name;
    
    if(!theModel.image) {
        if (!self.tableView.dragging && !self.tableView.decelerating) {
            [self startImageDownload:theModel forIndexPath:indexPath];
        }
    }
    else {
        cell.theImageView.image = theModel.image;
    }

    
    return cell;
}

#pragma mark - TableViewCellImageLoadong
- (void)startImageDownload:(MLModel *)inModel forIndexPath:(NSIndexPath *)inIndexPath {
    
    ImageDownloader *theImageDownloader = (ImageDownloader *)self.imageDownloadsInProgress[inIndexPath];
    if (!theImageDownloader) {
        theImageDownloader = [[ImageDownloader alloc] init];
        theImageDownloader.theModel = inModel;
        [theImageDownloader setCompletionHandler:^{
           
            MLTableViewCell *theCell = [self.tableView cellForRowAtIndexPath:inIndexPath];
            theCell.theImageView.image = inModel.image;            
            [self.imageDownloadsInProgress removeObjectForKey:inIndexPath];
            
        }];
        
        self.imageDownloadsInProgress[inIndexPath] = theImageDownloader;
        [theImageDownloader startDownload];
    }
    
}

- (void)loadImagesForOnScreenRows {
    
    if ([self.contentArray count] > 0) {
        NSArray *theVisibleRows = [self.tableView indexPathsForVisibleRows];
        
        for (NSIndexPath *theIndexPath in theVisibleRows) {
            MLModel *theModel = self.contentArray[theIndexPath.row];
            
            if (!theModel.image) {
                [self startImageDownload:theModel forIndexPath:theIndexPath];
            }
        }
    }
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self loadImagesForOnScreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self loadImagesForOnScreenRows];
}


@end
