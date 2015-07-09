//
//  MLTableViewCell.m
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 09.07.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "MLTableViewCell.h"

@implementation MLTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.sentenceLabel = [[UILabel alloc] init];
        self.sentenceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.sentenceLabel.numberOfLines = 0;
        
        
        [self addSubview:self.sentenceLabel];
        
        NSDictionary *viewsDictionary = @{
                                            @"sentenceLabel": self.sentenceLabel
                                          };

        
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[sentenceLabel]-20-|"                                                                                        options:0                                                                                        metrics:nil                                                                                          views:viewsDictionary]];

        
        
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[sentenceLabel]-8-|"                                                                                        options:0                                                                                        metrics:nil                                                                                          views:viewsDictionary]];

    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
