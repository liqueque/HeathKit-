//
//  Macros.h
//  CoolRun
//
//  Created by 李雀 on 2016/8/19.
//  Copyright © 2016年 李雀. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]

#define WeakObj(o) __weak typeof(o) o##Weak = o;
#define StrongObj(o) __strong typeof(o) o##Strong = o;


//key 用户id
#define UID @"UID"
//KEY token
#define TOKEN @"TOKEN"
//key 第一次启动时间
#define FIRSTLAUNCHDATE @"LAUNCHDATE"
//key 最后一次同步时间
#define LASTSYNDATE @"LASTSYNDATE"
//key 是否登录
#define ISLOGIN @"ISLOGIN"
//key 用户
#define USER @"USER"

#define UmengAppkey @"5740280ee0f55a5edc002836"
#define WEIXINAppID @"wxef505bdf677830a9"
#define WEIXINAppSecret @"28b49b8dcd84561d1307dfb6c0f3d8ed"

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);

typedef void (^ErrorCodeBlock) (id errorCode);

typedef void (^FailureBlock)(void);


#endif /* Macros_h */
