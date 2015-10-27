//
//  CKScrollHostingView.h
//  WildeGuess
//
//  Created by lixin on 10/26/15.
//
//

#import <UIKit/UIKit.h>
#import <ComponentKit/CKComponentProvider.h>

@interface CKScrollHostComponentProvider<CKComponentProvider> : NSObject

@end

typedef enum : NSUInteger {
    CKScrollHostingViewVertical,
    CKScrollHostingViewHorizontal,
} CKScrollHostingViewDirection;

@interface CKScrollHostingView : UIScrollView

@property (nonatomic, assign) CKScrollHostingViewDirection direction;

- (id)initWithFrame:(CGRect)frame direction:(CKScrollHostingViewDirection)direction componentProviders:(NSArray*)componentProviders;

@end
