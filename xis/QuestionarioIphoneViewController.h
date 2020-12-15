//
//  QuestionarioIphoneViewController.h
//  xis
//
//  Created by Anderson Barcelos on 10/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questao.h"
#import "Avaliacao.h"
#import "AboutVIewController.h"
#import <iAd/iAd.h>

@interface QuestionarioIphoneViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ADBannerViewDelegate>
{
    //IBOutlet UITextView *Pergunta1;
    IBOutlet UIWebView *Q1;
    IBOutlet UITableView *Opcoes1;
    IBOutlet UILabel *Resposta1;
    Questao *questao1;
    
    IBOutlet UIButton *botaoCorrigir;
    
    BOOL podeAbrir;
    
    UIView *vwEasterEgg;
    UIView *vwApagaLuz;
    
        ADBannerView *Propaganda;
    
}

+(BOOL)Corrigir;
+(void)setCorrigir:(BOOL)corrige;

//@property(nonatomic, retain) IBOutlet UITextView *Pergunta1;
@property(nonatomic, retain) IBOutlet UIWebView *Q1;
@property(nonatomic, retain) IBOutlet UITableView *Opcoes1;
@property(nonatomic, retain) Questao *questao1;
@property(nonatomic, retain) IBOutlet UILabel *Resposta1;
@property(nonatomic, retain)  IBOutlet UIButton *botaoCorrigir;
@property(nonatomic) BOOL podeAbrir;
@property(nonatomic, retain) IBOutlet UIView *vwEasterEgg;
@property(nonatomic, retain) IBOutlet UIView *vwApagaLuz;
@property(nonatomic, retain) IBOutlet ADBannerView *Propaganda;

-(IBAction)fechaEE;
-(IBAction)voltar;
-(IBAction)MontaQuestionario;
-(IBAction)EfetuarCorrecao;
-(IBAction)Encerrar:(id)sender;
-(IBAction)abreAbout:(id)sender;

-(IBAction)fecharEasterEgg;




@end
