//
//  CKScrollHostingView.m
//  WildeGuess
//
//  Created by lixin on 10/26/15.
//
//

#import "CKScrollHostingView.h"
#import <ComponentKit/ComponentKit.h>

@interface CKScrollHostComponentProvider()

@property (nonatomic, weak) CKComponentHostingView *hosting;

@end

@implementation CKScrollHostComponentProvider
- (void)updateModel:(id<NSObject>)model mode:(CKUpdateMode)mode {
    [_hosting updateModel:model mode:mode];
}

- (void)updateContext:(id<NSObject>)context mode:(CKUpdateMode)mode {
    [_hosting updateContext:context mode:mode];
}
@end

@interface CKScrollHostingView()<CKComponentHostingViewDelegate>

@end

@implementation CKScrollHostingView {
    CKComponentFlexibleSizeRangeProvider *_sizeProvider;
    NSMutableArray *_cachedSize;
    NSMutableArray *_hostingViews;
}

- (id)initWithFrame:(CGRect)frame direction:(CKScrollHostingViewDirection)direction componentProviders:(NSArray*)componentProviders {
    if (self = [super initWithFrame:frame]) {
        
        _sizeProvider = [CKComponentFlexibleSizeRangeProvider
                         providerWithFlexibility:
                         direction == CKScrollHostingViewVertical?CKComponentSizeRangeFlexibleHeight:CKComponentSizeRangeFlexibleWidth];
        _cachedSize = [[NSMutableArray alloc] initWithCapacity:componentProviders.count];
        _hostingViews = [[NSMutableArray alloc ] initWithCapacity:componentProviders.count];
        [componentProviders enumerateObjectsUsingBlock:^(CKScrollHostComponentProvider *provider, NSUInteger idx, BOOL * _Nonnull stop) {
            CKComponentHostingView *hostView = [[CKComponentHostingView alloc] initWithComponentProvider:[provider class] sizeRangeProvider:_sizeProvider];
            [self addSubview: hostView];
            hostView.tag = idx;
            hostView.delegate = self;
            hostView.frame = CGRectMake(0, 0, self.frame.size.width, 1);
            hostView.clipsToBounds = YES;
            provider.hosting = hostView;
            _cachedSize[idx] = [NSValue valueWithCGSize:CGSizeZero];
            [_hostingViews addObject:hostView];
        }];
    }
    return self;
}

static CGFloat getAxisSize(CKScrollHostingViewDirection direction, const CGSize &size) {
    return direction == CKScrollHostingViewVertical?size.height:size.width;
}

- (void)componentHostingViewDidInvalidateSize:(CKComponentHostingView *)hostingView {
    CGSize size = [hostingView sizeThatFits:self.frame.size];
    
    NSValue *cachedSize = _cachedSize[hostingView.tag];
    if (CGSizeEqualToSize(size, [cachedSize CGSizeValue])) {
        return;
    }
    _cachedSize[hostingView.tag] = [NSValue valueWithCGSize:size];
    
    //recalculate layout
    CGRect f = hostingView.frame;
    f.size = size;
    hostingView.frame = f;
    
    CGFloat axisContentSize = 0;
    for (UIView *hostView in _hostingViews) {
        CGRect f = hostView.frame;
        if (_direction == CKScrollHostingViewVertical) {
            f.origin = CGPointMake(0, axisContentSize);
        } else {
            f.origin = CGPointMake(axisContentSize, 0);
        }
        hostView.frame = f;
        axisContentSize += getAxisSize(_direction, hostView.frame.size);
    }
    
    self.contentSize = _direction == CKScrollHostingViewVertical ? CGSizeMake(self.frame.size.width, axisContentSize):CGSizeMake(axisContentSize, self.frame.size.height);    
}

@end
