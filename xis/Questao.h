//
//  Questao.h
//  xis
//
//  Created by Anderson Barcelos on 31/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "MasterClass.h"
#import "Avaliacao.h"

@interface Questao : MasterClass
{
    NSString *Cargo;
    NSNumber *Ano;
    NSString *Pergunta;
    NSString *Opcao1;
    NSString *Opcao2;
    NSString *Opcao3;
    NSString *Opcao4;
    NSString *Opcao5;
    NSString *Organizadora;
    NSString *Gabarito;
    NSString *Materia;
    NSString *Assunto1;
    NSString *Assunto2;
    NSString *Assunto3;
    
    NSNumber *Marcado;

    

    
}

@property(nonatomic, retain) NSString *Cargo;
@property(nonatomic, retain) NSNumber *Ano;
@property(nonatomic, retain) NSString *Pergunta;
@property(nonatomic, retain) NSString *Opcao1;
@property(nonatomic, retain) NSString *Opcao2;
@property(nonatomic, retain) NSString *Opcao3;
@property(nonatomic, retain) NSString *Opcao4;
@property(nonatomic, retain) NSString *Opcao5;
@property(nonatomic, retain) NSString *Organizadora;
@property(nonatomic, retain) NSString *Gabarito;
@property(nonatomic, retain) NSString *Materia;
@property(nonatomic, retain) NSString *Assunto1;
@property(nonatomic, retain) NSString *Assunto2;
@property(nonatomic, retain) NSString *Assunto3;
@property(nonatomic, retain)NSNumber *Marcado;

-(NSArray *)Opcoes;
-(NSNumber *)Resposta;

+(NSArray *)Opcoes;
+(void)setOpcoes:(NSArray *)o;

+(NSString *)TipoQuestionario;
+(void)setTipoQuestionario:(NSString *)tipo;

+(NSString *)MateriaDaProva;
+(void)setMateriaDaProva:(NSString *)materia;


+(BOOL) Filtrado;
+(void)setFiltrado:(BOOL)comFiltro;

+(NSArray *)Questionario;
+(void)setQuestionario:(NSArray *)perguntas;

+(void)PreparaQuestionario;

-(NSArray *)ListaSubAssuntos:(NSString *)assunto;
-(NSArray *)ListaAssuntos;
-(NSArray *)ListaCargos;
-(NSArray *)ListaOrganizadoras;

-(NSString *)ComandoSubAssuntos:(NSString *)Assunto;
-(NSString *)ComandoCargo;
-(NSString *)ComandoOrganizadora;

-(NSArray *)ListaComAssunto:(NSString *)assunto;
-(NSArray *)ListaComCargo:(NSString *)cargo;
-(NSArray *)ListaComOrganizadora:(NSString *)organizadora;
-(NSArray *)ListaComSubAssunto:(NSString *)assunto:(NSString *)subAssunto;

+(NSArray *)ListaMaterialDidatico;


@end
