//
//  CustomCollectionViewCell.m
//  SearchApp
//
//  Created by Roman Kolosov on 29.01.2021.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

//MARK: - Initialization

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configureCell];
    }
    
    return self;
}

//MARK: - Configure

-(void)configureCell {
    self.backgroundColor = [UIColor greenColor];
    
    CGRect carLabelFrame = CGRectMake(0, 0, self.bounds.size.width, 18);
    self.carLabel = [[UILabel alloc] initWithFrame:carLabelFrame];
    self.carLabel.font = [UIFont italicSystemFontOfSize:12];
    self.carLabel.textColor = [UIColor blueColor];
    self.carLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.carLabel];
    
    CGRect carImageViewFrame = CGRectMake(0, 20, self.bounds.size.width, 80);
    self.carImageView = [[UIImageView alloc] initWithFrame:carImageViewFrame];
    self.carImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.carImageView];
}

@end
