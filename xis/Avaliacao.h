//
//  Avaliacao.h
//  xis
//
//  Created by Anderson Barcelos on 09/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Avaliacao : NSObject

+(NSNumber *)PerguntasRespondidas;
+(void)setPerguntasRespondidas:(NSNumber *)perguntasRespondidas;

+(NSDate *)InicioDoQuestionario;
+(void)setInicioDoQuestionario:(NSDate *)inicioDoQuestionario;

+(NSNumber *)RespostasCertas;
+(void)setRespostasCertas:(NSNumber *)respostasCertas;

+(NSNumber *)RespostasErradas;
+(void)setRespostasErradas:(NSNumber *)respostasErradas;

+(NSDate*)FinalDoQuestionario;
+(void)setFinalDoQuestionario:(NSDate *)finalDoQuestionario;


+(void)IniciaMedicao;
+(void)FinalizaMedicao;

+(NSNumber *)TempoDoTeste;



@end
