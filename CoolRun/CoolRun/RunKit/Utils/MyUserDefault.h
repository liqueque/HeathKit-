//
//  MyUserDefault.h
//  tuangou_iphone
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUserDefault : NSObject
+(MyUserDefault*)shareUserDefault;
-(void)storeValue:(id)value withKey:(NSString*)key;
-(id)valueWithKey:(NSString*)key;
-(void)removeObjectWithKey:(NSString*)key;
@end
