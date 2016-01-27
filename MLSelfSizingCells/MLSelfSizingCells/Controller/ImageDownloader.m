//
//  ImageDownloader.m
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 27.01.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

@import UIKit;
#import "ImageDownloader.h"
#import "MLModel.h"

NSInteger const kAppIconSize = 80;


@interface ImageDownloader()
@property (nonatomic, strong) NSURLSessionDataTask *theSessionDataTask;;
@end

@implementation ImageDownloader

#pragma mark - Start / Cancel download
- (void)startDownload {
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.theModel.imageURLString]];
    self.theSessionDataTask = [[NSURLSession sharedSession] dataTaskWithRequest:theRequest completionHandler:^(NSData * _Nullable inData, NSURLResponse * _Nullable inResponse, NSError * _Nullable inError) {
        
        if (inError) {
            if (inError.code == NSURLErrorAppTransportSecurityRequiresSecureConnection) {
                abort();
            }
            else {
                NSLog(@"%@", inError.localizedDescription);
            }
            

        }
        else {
            NSHTTPURLResponse *theResponse = (NSHTTPURLResponse *)inResponse;
            if (theResponse.statusCode == 200) {
                // hell yeah \o/
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    UIImage *theImage = [UIImage imageWithData:inData];
                    
                    // scale the image if wrong dimension
                    
                    if (theImage.size.width != kAppIconSize || theImage.size.height != kAppIconSize) {
                        CGSize theImageSize = CGSizeMake(kAppIconSize, kAppIconSize);
                        UIGraphicsBeginImageContextWithOptions(theImageSize, NO, 0.0f);
                        CGRect theImageRect = CGRectMake(0.0f, 0.0f, theImageSize.width, theImageSize.height);
                        [theImage drawInRect:theImageRect];
                        self.theModel.image = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                    }
                    else {
                        self.theModel.image = theImage;
                    }
                    
                    if (self.completionHandler) {
                        self.completionHandler();
                    }
                    
                }];
            }
        }
        
    }];
    
    
    [self.theSessionDataTask resume];
    
}

- (void)cancelDownload {
    [self.theSessionDataTask cancel];
    self.theSessionDataTask = nil;
}


@end
