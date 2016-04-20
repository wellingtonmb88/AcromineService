//
//  ASVariationsTableViewController.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import "ASVariationsViewController.h"
#import "ASCustomTableViewCell.h"
#import "ASVariationObject.h"

@interface ASVariationsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property(strong, nonatomic) ASLongFormObject* longFormObject;
@end

@implementation ASVariationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setLongFormObject:(ASLongFormObject *)longFormObject {
    _longFormObject = longFormObject; 
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.longFormObject.variationObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellID";
    
    ASCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ASCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void) configureCell:(ASCustomTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    ASVariationObject *variantionObject = [self.longFormObject.variationObjects objectAtIndex: indexPath.row];
    
    [cell.abbreviation setText: self.longFormObject.abbreviation];
    [cell.fullName setText:variantionObject.fullName];
    [cell.frequency setText:[NSString stringWithFormat:@"%@", variantionObject.freq]];
    [cell.since setText:[NSString stringWithFormat:@"%@", variantionObject.since]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
