//
//  AcronymVariationTableViewCell.h
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcronymVariationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSince;
@property (weak, nonatomic) IBOutlet UILabel *lblFreq;

@end
