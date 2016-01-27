//
//  ImageDownloader.h
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 27.01.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLModel;

@interface ImageDownloader : NSObject

@property (nonatomic, strong) MLModel *theModel;
@property (nonatomic, copy) void (^completionHandler)(void);

- (void)startDownload;
- (void)cancelDownload;

@end
