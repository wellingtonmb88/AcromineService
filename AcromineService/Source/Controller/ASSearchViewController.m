//
//  ViewController.m
//  AcromineService
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//  Copyright (c) 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "ASSearchViewController.h"
#import "ASAcronymManager.h"
#import "ASAcronym.h"
#import "MBProgressHUD.h"
#import "ASCustomTableViewCell.h"
#import "ASLongFormObject.h"
#import "ASVariationsViewController.h"
#import "UIAlertController+Utils.h" 

@interface ASSearchViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ASAcronymManager *manager;
@property (strong, nonatomic) ASAcronym *acronymRetrieved;

@end

@implementation ASSearchViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_acronymRetrieved == nil) {
        [self searchAcronym:nil];
    }
}

#pragma mark - Getters/Setters

- (ASAcronymManager *)manager {
    if (!_manager) {
        _manager = [ASAcronymManager new];
    }
    
    return _manager;
}

- (void)setAcronymRetrieved:(ASAcronym *)acronym {
     _acronymRetrieved = acronym;
    [self.tableView reloadData];
}


#pragma mark - Actions
- (void)searchWithAcronym:(NSString *)acronym {
    [self showProgress];
    
    typeof(self) __weak __block weakSelf = self;
    
    [self.manager searchWithAcronym:acronym withCompletionBlock:^(ASAcronym *acronym, BOOL success) {
        
        typeof(weakSelf) __strong strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        
        if(success){
            
            if(acronym.abbreviation == nil || [acronym.longFormObjects count] < 1){
                [strongSelf createAndShowAlerView:NSLocalizedString(@"alertcontroller.title.error", @"Error")
                                      withMessage:NSLocalizedString(@"alertcontroller.message.noacronymfound", @"No Acronym found!")];
            }else {
                strongSelf.acronymRetrieved = acronym;
            }
            
        } else {
            [strongSelf createAndShowAlerView:NSLocalizedString(@"alertcontroller.title.error", @"Error") withMessage:NSLocalizedString(@"alertcontroller.message.requestfailure", @"Request Failure!")];
        }
        
        [strongSelf hideProgress];
        
    }];
}

- (IBAction)searchAcronym:(id)sender {
    
    UIAlertController *alertController = [UIAlertController createAndShowAlertWithTitle:NSLocalizedString(@"alertcontroller.title.searchacronym", @"Type the Acronym to search!") withMessage:nil hasDefaultAction:NO];
    
    typeof(self) __weak __block weakSelf = self;
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"alertcontroller.action.ok", @"OK")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   
                                   __strong typeof(weakSelf) strongSelf = weakSelf;
                                   if (!strongSelf) {
                                       return ;
                                   }
                                   
                                   NSString *textSearch = [[[alertController textFields]objectAtIndex:0] text];
                                   if(textSearch != nil && [textSearch length] > 0){
                                       [strongSelf searchWithAcronym:textSearch];
                                   }
                               }];
    
    [alertController addAction:okAction];
    [alertController addTextFieldWithConfigurationHandler:nil];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void) createAndShowAlerView:(NSString*) title withMessage:(NSString*)message {
    
    UIAlertController *alertController = [UIAlertController createAndShowAlertWithTitle:title withMessage:message hasDefaultAction:YES];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void) showProgress {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"mbprogresshud.label", @"Loading...");
}

- (void) hideProgress {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - Table View Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [self.acronymRetrieved.longFormObjects count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellID";
    
    ASCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ASCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void) configureCell:(ASCustomTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    ASLongFormObject *longFormObject = [self.acronymRetrieved.longFormObjects objectAtIndex: indexPath.row];
    
    [cell.abbreviation setText: self.acronymRetrieved.abbreviation];
    [cell.fullName setText:longFormObject.fullName];
    [cell.frequency setText:[NSString stringWithFormat:@"%@", longFormObject.freq]];
    [cell.since setText:[NSString stringWithFormat:@"%@", longFormObject.since]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showVariationsSegue"]){
        
        NSInteger index = [[self.tableView indexPathForSelectedRow] row];
        ASLongFormObject *longFormObject = [self.acronymRetrieved.longFormObjects objectAtIndex: index];
        
        ASVariationsViewController *vc = [segue destinationViewController];
        
        [vc setLongFormObject: longFormObject];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
