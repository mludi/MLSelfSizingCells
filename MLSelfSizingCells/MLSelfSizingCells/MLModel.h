//
//  MLModel.h
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 27.01.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MLModel : NSObject
@property (nonatomic, copy) NSString *sentence;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic, strong) UIImage *image;

@end
