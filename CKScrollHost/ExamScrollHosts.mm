//
//  ExamScrollHosts.m
//
//  Created by lixin on 10/26/15.
//
//

#import "ExamScrollHosts.h"

@implementation ExamScrollHosts0
+ (CKComponent *)componentForModel:(NSNumber*)model context:(id<NSObject>)context {
    std::vector<CKStackLayoutComponentChild> childs = {
        {
            [CKLabelComponent
             newWithLabelAttributes:{
                 .string = @"Hi world",
                 .font = [UIFont systemFontOfSize:20]
             }
             viewAttributes:{
                 
             }]
        }
    };
    for (NSInteger i = 0; i < [model integerValue]; i ++) {
        childs.push_back({
            [CKLabelComponent
             newWithLabelAttributes:{
                 .string = [NSString stringWithFormat:@"This is %ld", i],
                 .font = [UIFont systemFontOfSize:20]
             }
             viewAttributes:{
                 
             }]
        });
    }
    return [CKStackLayoutComponent
            newWithView:{
            }
            size:{
            }
            style:{
                .direction = CKStackLayoutDirectionVertical,
            }
            children:childs];
}

@end

@implementation ExamScrollHosts1

+ (CKComponent *)componentForModel:(NSString*)model context:(id<NSObject>)context {
    return [CKStackLayoutComponent
            newWithView:{
            }
            size:{
            }
            style:{
                .direction = CKStackLayoutDirectionVertical,
            }
            children:{
                {
                    [CKLabelComponent
                     newWithLabelAttributes:{
                         .string = model,
                         .font = [UIFont systemFontOfSize:30]
                     }
                     viewAttributes:{
                         
                     }]
                }
            }];
}

@end

@implementation ExamScrollHosts2

+ (CKComponent *)componentForModel:(NSString*)model context:(id<NSObject>)context {
    return [CKStackLayoutComponent
            newWithView:{
            }
            size:{
            }
            style:{
                .direction = CKStackLayoutDirectionVertical,
            }
            children:{
                {
                    [CKLabelComponent
                     newWithLabelAttributes:{
                         .string = model,
                         .font = [UIFont systemFontOfSize:30]
                     }
                     viewAttributes:{
                         
                     }]
                }
            }];
}

@end
