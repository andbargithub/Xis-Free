//
//  MasterClass.m
//  xis
//
//  Created by Anderson Barcelos on 08/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterClass.h"


@implementation MasterClass

@synthesize bancoDeDados;

#pragma mark - Método para atender DataProtocol
-(NSString *)ComandoSelect
{
    return @"";
}

#pragma mark - Métodos para Trabalhar com Banco de Dados


- (void)createEditableCopyOfDatabaseIfNeeded
{
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:nomeDoBancoDeDados];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success)
        return;
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nomeDoBancoDeDados];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

-(NSString *)DatabasePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
    
	return [documentsDirectory stringByAppendingPathComponent:nomeDoBancoDeDados];
}

-(BOOL)abreBanco
{
    [self createEditableCopyOfDatabaseIfNeeded];
    
	if (sqlite3_open([[self DatabasePath] UTF8String], &bancoDeDados) != SQLITE_OK) 
	{
		sqlite3_close(bancoDeDados);
		return NO;
	}
    
	return YES;
}

-(NSArray *)Lista
{
    return nil;
}

@end
