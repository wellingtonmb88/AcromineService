//
//  ASCustomTableViewCell.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import <UIKit/UIKit.h>

@interface ASCustomTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *abbreviation;
@property (nonatomic, weak) IBOutlet UILabel *fullName;
@property (nonatomic, weak) IBOutlet UILabel *frequency;
@property (nonatomic, weak) IBOutlet UILabel *since;

@end
