//
//  CoreDataManager.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject

/**
 *  临时管理上下文对象
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *tempManagedObjectContext;

/**
 *  管理上下文对象
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/**
 *  全局管理类
 *
 *  @return 
 */
+ (CoreDataManager *)shareManager;

/**
 *  切换数据库，如果没有就新建
 *
 *  @param name 数据库名字
 */
- (void)switchToDatabase:(NSString *)name;

/**
 *  切换到临时数据库
 */
- (void)switchToTempDatabase;

/**
 *  保存上下文对象
 */
- (void)saveContext;

/**
 *  保存临时上下文对象
 */
- (void)saveTempContext;

@end
