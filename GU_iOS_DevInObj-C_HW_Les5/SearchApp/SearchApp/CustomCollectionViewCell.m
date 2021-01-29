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
    
    CGRect carLabelFrame = CGRectMake(0, 0, self.bounds.size.width, 40);
    _carLabel = [[UILabel alloc] initWithFrame:carLabelFrame];
    [self.contentView addSubview:_carLabel];
    
    CGRect carImageViewFrame = CGRectMake(0, 50, self.bounds.size.width, 50);
    _carImageView = [[UIImageView alloc] initWithFrame:carImageViewFrame];
    [self.contentView addSubview:_carImageView];
}

@end
