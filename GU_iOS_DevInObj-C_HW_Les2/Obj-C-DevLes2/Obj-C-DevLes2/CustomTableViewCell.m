//
//  CustomTableViewCell.m
//  Obj-C-DevLes2
//
//  Created by Roman Kolosov on 17.01.2021.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//MARK: - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//MARK: - Initializer

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        CGRect leftLabelFrame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2, 44.0);
        _leftLabel = [[UILabel alloc] initWithFrame:leftLabelFrame];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_leftLabel];
        
        CGRect rightLabelFrame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0.0, [UIScreen mainScreen].bounds.size.width / 2, 44.0);
        _rightLabel = [[UILabel alloc] initWithFrame:rightLabelFrame];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_rightLabel];
    }
    return self;
}

@end
