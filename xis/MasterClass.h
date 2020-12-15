//
//  MasterClass.h
//  xis
//
//  Created by Anderson Barcelos on 08/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk/usr/include/sqlite3.h"
#import "DataProtocol.h"

//#define nomeDoBancoDeDados @"xis.sqlite3"
#define nomeDoBancoDeDados @"xis.sqlite"

@interface MasterClass : NSObject <DataProtocol>
{
    sqlite3 *bancoDeDados;
}

@property(nonatomic) sqlite3 *bancoDeDados;

-(NSString *)DatabasePath;
-(BOOL)abreBanco;

-(NSArray *)Lista;

@end
