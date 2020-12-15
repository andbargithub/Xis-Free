//
//  Questao.m
//  xis
//
//  Created by Anderson Barcelos on 31/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Questao.h"

static NSArray *Questionario;
static BOOL Filtrado;
static NSString *MateriaDaProva;
static NSArray *Opcoes;
static NSString *TipoQuestionario;

@implementation Questao

@synthesize Cargo;
@synthesize Ano;
@synthesize Pergunta;
@synthesize Opcao1;
@synthesize Opcao2;
@synthesize Opcao3;
@synthesize Opcao4;
@synthesize Opcao5;
@synthesize Organizadora;
@synthesize Gabarito;
@synthesize Materia;
@synthesize Assunto1;
@synthesize Assunto2;
@synthesize Assunto3;
@synthesize Marcado;


+(NSArray *)ListaMaterialDidatico
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return [fileManager  contentsOfDirectoryAtPath:documentsDirectory error: &error];
    
    /* 
    for(NSString* diretorio in [self ListaAssuntos])
    {
        success = [fileManager fileExistsAtPath:[documentsDirectory stringByAppendingPathComponent:diretorio]];
        if(!success)
        {
            [fileManager createDirectoryAtPath:[documentsDirectory stringByAppendingPathComponent:diretorio] withIntermediateDirectories:NO attributes:nil error:&error];            
            
        }
        for(NSString *subdir in [self ListaSubAssuntos:diretorio])
        {
            NSString *dir = [documentsDirectory stringByAppendingPathComponent:diretorio];
            
            success = [fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:subdir]];
            
            if(!success)
            {
                [fileManager createDirectoryAtPath:[dir stringByAppendingPathComponent:subdir] withIntermediateDirectories:NO attributes:nil error:&error];            
                
            }
        }
    }
    */
    
    //NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:nomeDoBancoDeDados];
    //success = [fileManager fileExistsAtPath:writableDBPath];
}



+(NSString *)TipoQuestionario
{
    return TipoQuestionario;
}

+(void)setTipoQuestionario:(NSString *)tipo
{
    TipoQuestionario = tipo;
}

+(NSArray *)Opcoes
{
    return Opcoes;
}

+(void)setOpcoes:(NSArray *)o
{
    Opcoes = o;
}

+(NSString *)MateriaDaProva
{
    return MateriaDaProva;
}

+(void)setMateriaDaProva:(NSString *)materia
{
    MateriaDaProva = materia;
}

+(BOOL)Filtrado
{
    return Filtrado;
}

+(void)setFiltrado:(BOOL)comFiltro
{
    Filtrado = comFiltro;
}

+(NSArray *)Questionario
{
    return Questionario;
}

+(void)setQuestionario:(NSArray *)perguntas
{
    Questionario = perguntas;
}


+(void)PreparaQuestionario
{
    [Avaliacao IniciaMedicao];
    
    if (Filtrado)
    {
        if ([TipoQuestionario isEqualToString:@"A"]) 
        {
            Questionario = [[[Questao alloc]init] ListaComAssunto:[Questao MateriaDaProva]];
        }
        
        if([TipoQuestionario isEqualToString:@"C"])
        {
            Questionario = [[[Questao alloc]init] ListaComCargo:[Questao MateriaDaProva]];
        }
        
        if([TipoQuestionario isEqualToString:@"O"])
        {
            Questionario = [[[Questao alloc]init] ListaComOrganizadora:[Questao MateriaDaProva]];
        }
        

        
    }
    else
    {
        Questionario = [[[Questao alloc]init] Lista];
    }
}

-(NSString *)ComandoSelect
{
    
    /*
    return @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4, OPCAO5, ORGANIZADORA, GABARITO, MATERIA, "
    " ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM TBQUESTOES "
    " WHERE PERGUNTA NOT LIKE '%img%' "
    " AND OPCAO1 NOT LIKE '%img%' "
    " AND OPCAO2 NOT LIKE '%img%' "
    " AND OPCAO3 NOT LIKE '%img%' "
    " AND OPCAO4 NOT LIKE '%img%' "
    " AND OPCAO5 NOT LIKE '%img%' "
    " AND GABARITO IN ('A','B','C','D''E') "
    " AND ASSUNTO1 <> 'Compreensão e interpretação de textos';";
    */
    
    return @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4, OPCAO5, ORGANIZADORA, GABARITO, MATERIA, "
    " ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM QUESTOES_TB "
    " WHERE PERGUNTA NOT LIKE '%img%' "
    " AND OPCAO1 NOT LIKE '%img%' "
    " AND OPCAO2 NOT LIKE '%img%' "
    " AND OPCAO3 NOT LIKE '%img%' "
    " AND OPCAO4 NOT LIKE '%img%' "
    " AND OPCAO5 NOT LIKE '%img%' "
    " AND GABARITO IN ('A','B','C','D''E') "
    " AND ASSUNTO1 <> 'Compreensão e interpretação de textos';";
    
    /*
    return @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4, OPCAO5, "
               " ORGANIZADORA, GABARITO, MATERIA, ASSUNTO1, ASSUNTO2, ASSUNTO3 "
               " FROM XIS;";
     */
}

-(NSString *)ComandoAssuntos
{
    //return @"select  materia, count(1) from tbquestoes group by materia having count(1) > 50";
    return @"select  materia, count(1) from QUESTOES_TB group by materia having count(1) > 50";
}

-(NSString *)ComandoSubAssuntos:(NSString *)Assunto
{
    NSString *cons = [[NSString alloc]initWithFormat:@"select  assunto1, count(1) from QUESTOES_TB where materia = '%@' GROUP BY ASSUNTO1 ORDER BY assunto1;",Assunto];
    
    return cons;
    
}

-(NSString *)ComandoCargo
{
    NSString *cons = [[NSString alloc]initWithFormat:@"select  CARGO, count(1) from QUESTOES_TB GROUP BY CARGO ORDER BY CARGO;"];
    
    return cons;
}

-(NSString *)ComandoOrganizadora
{
    NSString *cons = [[NSString alloc]initWithFormat:@"select  Organizadora, count(1) from QUESTOES_TB GROUP BY Organizadora ORDER BY Organizadora;"];
    
    return cons;
}

-(NSArray *)Lista
{
	Questao *obj = [[Questao alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
        
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [[self ComandoSelect] UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
            
			obj = [[Questao alloc]init];
            
            obj.Cargo = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
            
            obj.Ano = [[NSNumber alloc] initWithInt:(int)sqlite3_column_int(comandoSQL, 1)];
            
            obj.Pergunta = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_blob(comandoSQL, 2)];
            
            obj.Opcao1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 3)];
            
            obj.Opcao2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 4)];
            
            obj.Opcao3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 5)];
            
            obj.Opcao4 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 6)];
            
            obj.Opcao5 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 7)];
            
            obj.Organizadora = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 8)];
            
            obj.Gabarito = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 9)];
            
            obj.Materia = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 10)];
            
            obj.Assunto1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 11)];
            
            obj.Assunto2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 12)];
            
            obj.Assunto3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 13)];
            
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
                
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
    NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
    
    NSLog(@"%@", erro);
    */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaComSubAssunto:(NSString *)assunto:(NSString *)subAssunto
{
    
    NSString *consulta = @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4,  OPCAO5, ORGANIZADORA, GABARITO, MATERIA, ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM QUESTOES_TB  WHERE PERGUNTA NOT LIKE '%img%'  AND OPCAO1 NOT LIKE '%img%' AND OPCAO2 NOT LIKE '%img%'  AND OPCAO3 NOT LIKE '%img%'  AND OPCAO4 NOT LIKE '%img%'  AND OPCAO5 NOT LIKE '%img%'  AND GABARITO IN ('A','B','C','D''E')  AND ASSUNTO1 <> 'Compreensão e interpretação de textos'";
    
    consulta = [NSString stringWithFormat:@"%@ AND MATERIA = '%@' AND ASSUNTO1 = '%@'",consulta,assunto, subAssunto];
    
	Questao *obj = [[Questao alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [consulta UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[Questao alloc]init];
                
                obj.Cargo = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                obj.Ano = [[NSNumber alloc] initWithInt:(int)sqlite3_column_int(comandoSQL, 1)];
                
                obj.Pergunta = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_blob(comandoSQL, 2)];
                
                obj.Opcao1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 3)];
                
                obj.Opcao2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 4)];
                
                obj.Opcao3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 5)];
                
                obj.Opcao4 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 6)];
                
                obj.Opcao5 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 7)];
                
                obj.Organizadora = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 8)];
                
                obj.Gabarito = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 9)];
                
                obj.Materia = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 10)];
                
                obj.Assunto1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 11)];
                
                obj.Assunto2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 12)];
                
                obj.Assunto3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 13)];
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaComAssunto:(NSString *)assunto;
{
    
    NSString *consulta = @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4,  OPCAO5, ORGANIZADORA, GABARITO, MATERIA, ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM QUESTOES_TB  WHERE PERGUNTA NOT LIKE '%img%'  AND OPCAO1 NOT LIKE '%img%' AND OPCAO2 NOT LIKE '%img%'  AND OPCAO3 NOT LIKE '%img%'  AND OPCAO4 NOT LIKE '%img%'  AND OPCAO5 NOT LIKE '%img%'  AND GABARITO IN ('A','B','C','D''E')  AND ASSUNTO1 <> 'Compreensão e interpretação de textos'";
    
    consulta = [NSString stringWithFormat:@"%@ AND MATERIA = '%@' ",consulta,assunto];
    
	Questao *obj = [[Questao alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [consulta UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[Questao alloc]init];
                
                obj.Cargo = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                obj.Ano = [[NSNumber alloc] initWithInt:(int)sqlite3_column_int(comandoSQL, 1)];
                
                obj.Pergunta = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_blob(comandoSQL, 2)];
                
                obj.Opcao1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 3)];
                
                obj.Opcao2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 4)];
                
                obj.Opcao3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 5)];
                
                obj.Opcao4 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 6)];
                
                obj.Opcao5 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 7)];
                
                obj.Organizadora = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 8)];
                
                obj.Gabarito = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 9)];
                
                obj.Materia = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 10)];
                
                obj.Assunto1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 11)];
                
                obj.Assunto2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 12)];
                
                obj.Assunto3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 13)];
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}


-(NSArray *)ListaComCargo:(NSString *)cargo;
{
    
    NSString *consulta = @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4,  OPCAO5, ORGANIZADORA, GABARITO, MATERIA, ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM QUESTOES_TB  WHERE PERGUNTA NOT LIKE '%img%'  AND OPCAO1 NOT LIKE '%img%' AND OPCAO2 NOT LIKE '%img%'  AND OPCAO3 NOT LIKE '%img%'  AND OPCAO4 NOT LIKE '%img%'  AND OPCAO5 NOT LIKE '%img%'  AND GABARITO IN ('A','B','C','D''E')  AND ASSUNTO1 <> 'Compreensão e interpretação de textos'";
    
    consulta = [NSString stringWithFormat:@"%@ AND CARGO = '%@' ",consulta, cargo];
    
	Questao *obj = [[Questao alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [consulta UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[Questao alloc]init];
                
                obj.Cargo = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                obj.Ano = [[NSNumber alloc] initWithInt:(int)sqlite3_column_int(comandoSQL, 1)];
                
                obj.Pergunta = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_blob(comandoSQL, 2)];
                
                obj.Opcao1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 3)];
                
                obj.Opcao2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 4)];
                
                obj.Opcao3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 5)];
                
                obj.Opcao4 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 6)];
                
                obj.Opcao5 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 7)];
                
                obj.Organizadora = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 8)];
                
                obj.Gabarito = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 9)];
                
                obj.Materia = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 10)];
                
                obj.Assunto1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 11)];
                
                obj.Assunto2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 12)];
                
                obj.Assunto3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 13)];
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaComOrganizadora:(NSString *)organizadora
{
    
    NSString *consulta = @"SELECT CARGO, ANO, PERGUNTA, OPCAO1, OPCAO2, OPCAO3, OPCAO4,  OPCAO5, ORGANIZADORA, GABARITO, MATERIA, ASSUNTO1, ASSUNTO2, ASSUNTO3 FROM QUESTOES_TB  WHERE PERGUNTA NOT LIKE '%img%'  AND OPCAO1 NOT LIKE '%img%' AND OPCAO2 NOT LIKE '%img%'  AND OPCAO3 NOT LIKE '%img%'  AND OPCAO4 NOT LIKE '%img%'  AND OPCAO5 NOT LIKE '%img%'  AND GABARITO IN ('A','B','C','D''E')  AND ASSUNTO1 <> 'Compreensão e interpretação de textos'";
    
    consulta = [NSString stringWithFormat:@"%@ AND ORGANIZADORA = '%@' ",consulta, organizadora];
    
	Questao *obj = [[Questao alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [consulta UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[Questao alloc]init];
                
                obj.Cargo = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                obj.Ano = [[NSNumber alloc] initWithInt:(int)sqlite3_column_int(comandoSQL, 1)];
                
                obj.Pergunta = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_blob(comandoSQL, 2)];
                
                obj.Opcao1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 3)];
                
                obj.Opcao2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 4)];
                
                obj.Opcao3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 5)];
                
                obj.Opcao4 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 6)];
                
                obj.Opcao5 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 7)];
                
                obj.Organizadora = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 8)];
                
                obj.Gabarito = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 9)];
                
                obj.Materia = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 10)];
                
                obj.Assunto1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 11)];
                
                obj.Assunto2 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 12)];
                
                obj.Assunto3 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 13)];
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}



-(NSArray *)ListaAssuntos
{
	NSString *obj = [[NSString alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [[self ComandoAssuntos] UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[NSString alloc]init];
                
                obj = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
              
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaSubAssuntos:(NSString *)assunto
{
	NSString *obj = [[NSString alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [[self ComandoSubAssuntos:assunto ] UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[NSString alloc]init];
                
                obj = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaCargos
{
	NSString *obj = [[NSString alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [[self ComandoCargo] UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[NSString alloc]init];
                
                obj = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}

-(NSArray *)ListaOrganizadoras
{
	NSString *obj = [[NSString alloc] init];
	NSMutableArray *lista = [[NSMutableArray alloc] init];
	
    sqlite3_stmt *comandoSQL;
    
	[self abreBanco];
	
    int sqlCode = sqlite3_prepare_v2([self bancoDeDados], [[self ComandoOrganizadora] UTF8String],-1, &comandoSQL,nil);
	
	if (sqlCode==SQLITE_OK)
	{
		while (sqlite3_step(comandoSQL)==SQLITE_ROW) 
		{
            @try 
            
            {
                
                
                obj = [[NSString alloc]init];
                
                obj = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(comandoSQL, 0)];
                
                
                
			    
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description] );
            }
            @finally 
            {
                [lista addObject:obj];
            }
            
		}
		sqlite3_finalize(comandoSQL);
	}
	
    /*
     NSString *erro = [[NSString alloc] initWithUTF8String:sqlite3_errmsg([self bancoDeDados])];
     
     NSLog(@"%@", erro);
     */
    
	sqlite3_close([self bancoDeDados]);
	
	NSArray *array = [[NSArray alloc] initWithArray:lista];
	
	
	return array;
	
	
}




-(NSArray *)Opcoes
{
    NSMutableArray *ops = [[NSMutableArray alloc]init];
    
    [ops addObject:[self Pergunta]];
    [ops addObject:[NSString stringWithFormat:@"A. %@", self.Opcao1]];
    [ops addObject:[NSString stringWithFormat:@"B. %@", self.Opcao2]];
    [ops addObject:[NSString stringWithFormat:@"C. %@", self.Opcao3]];
    [ops addObject:[NSString stringWithFormat:@"D. %@", self.Opcao4]];
    [ops addObject:[NSString stringWithFormat:@"E. %@", self.Opcao5]];

     
    return ops;
}

-(NSNumber *)Resposta
{
    if([self.Gabarito isEqualToString:@"A"])
    {
        return [NSNumber numberWithInt:1];
    }
    
    if([self.Gabarito isEqualToString:@"B"])
    {
        return [NSNumber numberWithInt:2];
    }
    
    if([self.Gabarito isEqualToString:@"C"])
    {
        return [NSNumber numberWithInt:3];
    }
    
    if([self.Gabarito isEqualToString:@"D"])
    {
        return [NSNumber numberWithInt:4];
    }
    
    if([self.Gabarito isEqualToString:@"E"])
    {
        return [NSNumber numberWithInt:5];
    }
    
    return nil;
    
    
    
}

@end
