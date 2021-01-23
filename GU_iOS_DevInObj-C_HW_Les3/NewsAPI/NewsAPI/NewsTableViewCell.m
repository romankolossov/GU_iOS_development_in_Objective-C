//
//  NewsTableViewCell.m
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//MARK: - Initializer

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        CGRect newsTextViewFrame = CGRectMake(11, 11, [UIScreen mainScreen].bounds.size.width - 22, 180);
        
        _newsTextView = [[UITextView alloc] initWithFrame:newsTextViewFrame];
        _newsTextView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _newsTextView.textAlignment = NSTextAlignmentLeft;
        _newsTextView.textColor = [UIColor blackColor];
        _newsTextView.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:_newsTextView];
    }
    return self;
}

@end
