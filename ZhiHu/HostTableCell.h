//
//  HostTableCell.h
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>

/*@brief:个人tableViewCell重写
 *
 *
 */

@interface HostTableCell : UITableViewCell

@property (weak, nonatomic) UIImageView *photoView;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UIImageView *selectView;
@property (weak, nonatomic) UISwitch *swiBtn;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;



@end
