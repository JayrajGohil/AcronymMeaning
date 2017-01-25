//
//  AcronymVariationTableViewCell.m
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import "AcronymVariationTableViewCell.h"
#import "AMConstants.h"

@implementation AcronymVariationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // set font to label
    [self.lblTitle setFont:kFontHelveticaNeue_Bold];
    [self.lblSince setFont:kFontHelveticaNeue_desc];
    [self.lblFreq setFont:kFontHelveticaNeue_desc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
