//
//  CoponLabel.h
//  Coupon
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
 VerticalAlignmentTop = 0, // default
 VerticalAlignmentMiddle,
 VerticalAlignmentBottom,
} VerticalAlignment;


@interface CoponLabel : UILabel


@property (nonatomic) VerticalAlignment verticalAlignment;



@end


