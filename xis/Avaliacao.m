//
//  Avaliacao.m
//  xis
//
//  Created by Anderson Barcelos on 09/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Avaliacao.h"

static NSNumber *PerguntasRespondidas;
static NSDate *InicioDoQuestionario;
static NSNumber *RespostasCertas;
static NSNumber *RespostasErradas;
static NSDate *FinalDoQuestionario;

@implementation Avaliacao


+(NSNumber *)PerguntasRespondidas
{
    return PerguntasRespondidas;
}

+(void)setPerguntasRespondidas:(NSNumber *)perguntasRespondidas
{
    PerguntasRespondidas = perguntasRespondidas;
}

+(NSDate *)InicioDoQuestionario
{
    return InicioDoQuestionario;
}

+(void)setInicioDoQuestionario:(NSDate *)inicioDoQuestionario
{
    InicioDoQuestionario = inicioDoQuestionario;
}

+(NSNumber *)RespostasCertas
{
    return RespostasCertas;
}

+(void)setRespostasCertas:(NSNumber *)respostasCertas
{
    RespostasCertas = respostasCertas;
}

+(NSNumber *)RespostasErradas
{
    return RespostasErradas;
}
+(void)setRespostasErradas:(NSNumber *)respostasErradas
{
    RespostasErradas = respostasErradas;
}

+(NSDate*)FinalDoQuestionario
{
    return FinalDoQuestionario;
}

+(void)setFinalDoQuestionario:(NSDate *)finalDoQuestionario
{
    FinalDoQuestionario = finalDoQuestionario;
}

+(void)IniciaMedicao
{
    InicioDoQuestionario = [NSDate date];
    PerguntasRespondidas = [NSNumber numberWithInt:0];
    RespostasErradas = [NSNumber numberWithInt:0];
    RespostasCertas  = [NSNumber numberWithInt:0];
    
}

+(void)FinalizaMedicao
{
    FinalDoQuestionario = [NSDate date];
}

+(NSNumber *)TempoDoTeste
{
    double start = [InicioDoQuestionario timeIntervalSince1970];
    double end = [FinalDoQuestionario timeIntervalSince1970];
    double difference = end - start;
    
    difference = difference/60;
    
    return [NSNumber numberWithDouble:difference];
    
}


@end
