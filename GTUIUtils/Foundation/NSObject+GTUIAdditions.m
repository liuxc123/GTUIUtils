//
//  NSObject+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSObject+GTUIAdditions.h"

@implementation NSObject (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  AssociatedObject
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - AssociatedObject

- (id)gtui_getAssociatedObjectWithKey:(const void *)cKey
{
    return objc_getAssociatedObject(self, cKey);
}

- (void)gtui_setAssociatedAssignObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_ASSIGN);
}

- (void)gtui_setAssociatedRetainObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)gtui_setAssociatedCopyObject:(id)cValue key:(const void *)cKey
{
    objc_setAssociatedObject(self, cKey, cValue, OBJC_ASSOCIATION_COPY);
}

- (void)gtui_setAssociatedObject:(id)cValue key:(const void *)cKey policy:(objc_AssociationPolicy)cPolicy
{
    objc_setAssociatedObject(self, cKey, cValue, cPolicy);
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  PerformedOnce
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - PerformedOnce

- (void)gtui_performOnce:(void (^)(void))cb key:(NSString *)cKey
{
    NSMutableArray *performedArray = [self gtui_performedArray];
    if (![performedArray containsObject:cKey])
    {
        [performedArray addObject:cKey];
        cb();
    }
}

- (NSMutableArray *)gtui_performedArray
{
    NSMutableArray *curArray = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (curArray) return curArray;

    curArray = [NSMutableArray array];
    [self gtui_setAssociatedObject:curArray key:_cmd policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
    return curArray;
}


@end
