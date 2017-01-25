//
//  VariationsTableViewController.m
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import "VariationsTableViewController.h"
#import "AcronymVariationTableViewCell.h"
#import "AMConstants.h"

@interface VariationsTableViewController ()

@end

@implementation VariationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    UINib *cellNib = [UINib nibWithNibName:@"AcronymVariationTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"AcronymVariationTableViewCell"];
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = RowHeight;
    
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedSectionHeaderHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headerIdentifier = @"VariationsHeaderIdentifier";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerIdentifier];
    [headerView.textLabel setFont:kFontHelveticaNeue];
    
    if (self.meanings.vars.count >= 1) {
        headerView.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"VariationsHeaderText", @""),self.meanings.lf];
    }
    else {
        headerView.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"NoResultsTitle", @"")];
    }
    
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meanings.vars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcronymVariationTableViewCell *cell = (AcronymVariationTableViewCell *) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AcronymVariationTableViewCell class])];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // Configure the cell...
    Var *varMeaning = [self.meanings.vars objectAtIndex:indexPath.row];
    cell.lblTitle.text = varMeaning.lf;
    cell.lblSince.text =  [NSString stringWithFormat:NSLocalizedString(@"MeaningSince", @""),(long)varMeaning.since];
    cell.lblFreq.text =  [NSString stringWithFormat:NSLocalizedString(@"MeaningFrequency", @""),(long)varMeaning.freq];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
