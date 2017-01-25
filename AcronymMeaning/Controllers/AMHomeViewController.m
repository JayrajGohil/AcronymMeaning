//
//  AMHomeViewController.m
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import "AMHomeViewController.h"
#import "MBProgressHUD.h"
#import "AMConstants.h"
#import "AcronymResult.h"
#import "AMServiceManager.h"
#import "VariationsTableViewController.h"
#import "AcronymVariationTableViewCell.h"
#import "Reachability.h"

@interface AMHomeViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, strong) AcronymResult *acroResult;
@property (nonatomic, strong) NSCharacterSet *disallowedCharacters;
@end

@implementation AMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Load custom cell to Tableview.
    UINib *cellNib = [UINib nibWithNibName:@"AcronymVariationTableViewCell" bundle:nil];
    [self.tblAcronymMeaning registerNib:cellNib forCellReuseIdentifier:@"AcronymVariationTableViewCell"];
    self.tblAcronymMeaning.tableFooterView = [UIView new];
    
    // Adjust dynamic height of cell
    self.tblAcronymMeaning.rowHeight = UITableViewAutomaticDimension;
    self.tblAcronymMeaning.estimatedRowHeight = RowHeight;
    
    // reset data
    [self resetData];
    
    // set characterset which are disallowed in searchbar
    self.disallowedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
/*
 * @discussion - This method reset data and hide tableview.
 */
- (void)resetData
{
    self.tblAcronymMeaning.hidden = YES;
    self.acroResult = nil;
}

/*
 * @discussion - This method fetch the meaning of acronym from web service.
 * @acronym Acronym/Initialisms to be fetched meaning from service *
 */
- (void)searchMeaningOfAchronym:(NSString *)acronym
{
    
    // Check internet connection
    if ([self connectedToNetwork]) {
        // Load progressview
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        // set paramater for webservice
        NSDictionary *param = @{@"sf": acronym};
        // call webservice to fetch meaning
        [[AMServiceManager sharedManager] getResponseForURLString:kURLBase parameters:param success:^(NSURLSessionDataTask *task, AcronymResult *acronymResult) {
            
            // Hide progressview
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            // check result and if it is there so assign result and load to tableview.
            self.acroResult = acronymResult;
            if (self.acroResult && self.acroResult.lfs.count > 0) {
                [self.tblAcronymMeaning setHidden:NO];
                [self.tblAcronymMeaning setContentOffset:CGPointZero animated:NO];
                [self.tblAcronymMeaning reloadData];
            }
            else{
                // show no results alerts
                [self showErrorAlertWithTitle:NSLocalizedString(@"NoResultsTitle", @"") message:[NSString stringWithFormat:NSLocalizedString(@"NoResultsMessage", @""),self.sbAcronym.text]];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            // Hide progressview
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            // show error alert with error description
            [self showErrorAlertWithTitle:nil message:error.localizedDescription];
        }];
    }
    else{
        // show error alert with error description for no internet connection
        [self showErrorAlertWithTitle:NSLocalizedString(@"NoInternetTitle", @"") message:NSLocalizedString(@"NoInternetMessage", @"")];
    }
}

/*
 * @discussion - This method check internet connection is available or not.
 */
- (BOOL) connectedToNetwork{
    Reachability* reachability = [Reachability reachabilityWithHostName:@"nactem.ac.uk"];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if (remoteHostStatus == ReachableViaWWAN || remoteHostStatus == ReachableViaWiFi)
    {
        return  TRUE;
    }
    return NO;
}

/*
 * @discussion - This method check internet connection is available or not.
 * @title String to set title *
 * @message String to set message of alert *
 */
-(void)showErrorAlertWithTitle:(NSString *) title message:(NSString *) message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.sbAcronym becomeFirstResponder];
    }];
    [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - TableView DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *headerIdentifier = @"HeaderIdentifier";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerIdentifier];
    [headerView.textLabel setFont:kFontHelveticaNeue];
    headerView.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"SectionHeaderText", @""),self.sbAcronym.text];
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.acroResult.lfs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AcronymVariationTableViewCell *cell = (AcronymVariationTableViewCell *) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AcronymVariationTableViewCell class])];
    
    Lf *meaning = [self.acroResult.lfs objectAtIndex:indexPath.row];
    cell.lblTitle.text = meaning.lf;
    cell.lblSince.text =  [NSString stringWithFormat:NSLocalizedString(@"MeaningSince", @""),(long)meaning.since];
    cell.lblFreq.text =  [NSString stringWithFormat:NSLocalizedString(@"MeaningFrequency", @""),(long)meaning.freq];
    
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sbAcronym resignFirstResponder];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    VariationsTableViewController *variationVC = (VariationsTableViewController *)[mainStoryboard
                                                                instantiateViewControllerWithIdentifier:@"VariationsTableViewController"];
    variationVC.meanings = [self.acroResult.lfs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:variationVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - SearchView Delegate
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSUInteger oldLength = [searchBar.text length];
    NSUInteger replacementLength = [text length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    if (([text rangeOfString: @"\n"].location != NSNotFound)) {
        
        [searchBar resignFirstResponder];
        [self searchMeaningOfAchronym:searchBar.text];
    }
    else if (newLength <= MAXLENGTH && [text rangeOfCharacterFromSet:self.disallowedCharacters].location == NSNotFound) {
        return YES;
    }
    return NO;
}

/*
#pragma mark - Navigation

 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}
*/

@end
