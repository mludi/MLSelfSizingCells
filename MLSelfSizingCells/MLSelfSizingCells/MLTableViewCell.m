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
        self.sentenceLabel.font = [UIFont fontWithName:@"Menlo-Regular" size:25.0f];
        [self.contentView addSubview:self.sentenceLabel];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.nameLabel.numberOfLines = 0;
        self.nameLabel.font = [UIFont fontWithName:@"SanFranciscoDisplay-Light" size:12.0f];
        [self.contentView addSubview:self.nameLabel];
        
        NSDictionary *viewsDictionary = @{
                                            @"sentenceLabel": self.sentenceLabel,
                                            @"nameLabel": self.nameLabel
                                          };


        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[sentenceLabel]-8-|"
                                                                                        options:kNilOptions
                                                                                        metrics:nil
                                                                                          views:viewsDictionary]];
        
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[sentenceLabel]-10-[nameLabel]-20-|"
                                                                                        options: NSLayoutFormatAlignAllLeading | NSLayoutFormatAlignAllTrailing
                                                                                        metrics:nil
                                                                                          views:viewsDictionary]];
        
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
