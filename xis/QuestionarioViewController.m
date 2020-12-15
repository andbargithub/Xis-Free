//
//  QuestionarioViewController.m
//  xis
//
//  Created by Anderson Barcelos on 30/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionarioViewController.h"
#import "OpcaoViewController.h"
#import "OpcaoTableCellViewController.h"
#import "EstatisticasViewController.h"


static BOOL Corrigir;
static BOOL recarregaItens;

#define kAlturaDaLinha 74;

@implementation QuestionarioViewController

//@synthesize Pergunta1;
@synthesize Q1;
@synthesize Q2;
@synthesize Opcoes1;
@synthesize Opcoes2;
@synthesize questao1;
@synthesize questao2;
@synthesize Resposta1;
@synthesize Resposta2;
@synthesize botaoCorrigir;
@synthesize podeAbrir;
@synthesize vwEasterEgg;
@synthesize vwApagaLuz;
@synthesize Propaganda;

-(IBAction)fechaEasterEgg:(id)sender
{
    [vwEasterEgg setHidden:YES];
    [vwApagaLuz setHidden:YES];
}

-(IBAction)abreAbout:(id)sender
{
    
    AboutVIewController *tela;
    
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        
        tela  = [[AboutVIewController alloc] initWithNibName:@"AboutView" bundle:nil];
    }
    else
    {
        tela  = [[AboutVIewController alloc] initWithNibName:@"AboutViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:tela animated:YES];
    
}


+(BOOL)Corrigir
{
    return Corrigir;
}

+(void)setCorrigir:(BOOL)corrige
{
    Corrigir = corrige;
}

-(void)EfetuarCorrecao
{
    [Avaliacao setPerguntasRespondidas:[NSNumber numberWithInt:[[Avaliacao PerguntasRespondidas] intValue] +1]];
    
    NSUserDefaults *configuracoes = [NSUserDefaults standardUserDefaults];	
	NSUInteger quantidadePerguntas = [[configuracoes objectForKey:@"QuantidadePerguntas"] intValue]; 
    NSString *versao =[configuracoes objectForKey:@"Versao"];
    
    quantidadePerguntas += 2;    
    
    [configuracoes setObject:[[NSNumber numberWithInt:quantidadePerguntas] stringValue] forKey:@"QuantidadePerguntas"];
    
    if([versao isEqualToString:@"free"])
    {
        if(quantidadePerguntas >= 20)
        {
            UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Xis" message:@"Esta versão (free) só permite que sejam respondidas 20 questões por dia. Seu limite para hoje está esgotado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alerta show];
            [self Encerrar:nil];
        }
    }
    
    
    if (quantidadePerguntas ==10 & [[Avaliacao RespostasCertas] intValue] ==0) 
    {
        [vwEasterEgg setHidden:NO];
        [vwApagaLuz setHidden:NO];
    }
    
    if(questao1.Marcado == [questao1 Resposta])
    {
        Resposta1.alpha = 0.8;
        Resposta1.textColor = [UIColor colorWithRed:100 green:149 blue:237 alpha:1.0];
        Resposta1.text = @"Resposta Correta!";
        [Avaliacao setRespostasCertas:[NSNumber numberWithInt: [[Avaliacao RespostasCertas] intValue] +1]];
    }
    else
    {
        Resposta1.alpha = 0.8;
        Resposta1.textColor = [UIColor colorWithRed:233 green:150 blue:122 alpha:1.0];
        Resposta1.text = [NSString stringWithFormat:@"Resposta Errada! Gabarito: %@", questao1.Gabarito];
        [Avaliacao setRespostasErradas:[NSNumber numberWithInt: [[Avaliacao RespostasErradas] intValue] +1]];
    }
    
    
    [Avaliacao setPerguntasRespondidas:[NSNumber numberWithInt:[[Avaliacao PerguntasRespondidas] intValue] +1]];
    if(questao2.Marcado == [questao2 Resposta])
    {
        Resposta2.alpha = 0.8;
        Resposta2.textColor = [UIColor colorWithRed:100 green:149 blue:237 alpha:1.0];
        Resposta2.text = @"Resposta Correta!";
        [Avaliacao setRespostasCertas:[NSNumber numberWithInt: [[Avaliacao RespostasCertas] intValue] +1]];
    }
    else
    {
        Resposta2.alpha = 0.8;
        Resposta2.textColor = [UIColor colorWithRed:233 green:150 blue:122 alpha:1.0];
        Resposta2.text = [NSString stringWithFormat:@"Resposta Errada! Gabarito: %@", questao2.Gabarito];
        [Avaliacao setRespostasErradas:[NSNumber numberWithInt: [[Avaliacao RespostasErradas] intValue] +1]];
    }
    
    
    
    [botaoCorrigir setHidden:YES];
    
}

-(IBAction)Encerrar:(id)sender
{
    [Avaliacao FinalizaMedicao];
    
    NSString *nomeDoXib;
    
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        nomeDoXib = @"EstatisticasView";
    }
    else
    {
        nomeDoXib = @"EstatisticaViewIphone";
    }
    
    EstatisticasViewController *tela = [[EstatisticasViewController alloc] initWithNibName:nomeDoXib bundle:nil];
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:tela animated:YES];
}

-(IBAction)voltar
{
	self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

-(IBAction)MontaQuestionario
{
    
    @try
    {
        
        if (![botaoCorrigir isHidden]) 
        {
            [self EfetuarCorrecao];
        }
        
        [botaoCorrigir setHidden:NO];
        
        questao1 = [[Questao Questionario] objectAtIndex:arc4random()%[[Questao Questionario] count]];
        questao2 = [[Questao Questionario] objectAtIndex:arc4random()%[[Questao Questionario] count]];
        
        //Pergunta1.text = questao1.Pergunta;
        
        NSMutableString *conteudo = [[NSMutableString alloc]init];
        
        Resposta1.text = @"";
        Resposta2.text = @"";
        
        [conteudo appendString:@"<html><body style=\"background-color:transparent\">"];
        [conteudo appendString:@"<font face=\"Noteworthy\" size = 4 color=\"white\">"];
        [conteudo appendString:questao1.Pergunta];
        [conteudo appendString:@"</font>"];
        [conteudo appendString:@"</body></html>"];
        
        [Q1 loadHTMLString:conteudo baseURL:nil];
        
        conteudo = [[NSMutableString alloc]init];
        
        [conteudo appendString:@"<html><body style=\"background-color:transparent\">"];
        [conteudo appendString:@"<font face=\"Noteworthy\" size = 4 color=\"white\">"];
        [conteudo appendString:questao2.Pergunta];
        [conteudo appendString:@"</font>"];
        [conteudo appendString:@"</body></html>"];
        
        [Q2 loadHTMLString:conteudo baseURL:nil];
        
        
        
        Corrigir = NO;
        recarregaItens = NO;
        
    }
    
    @catch (NSException *exception) 
    {
        [self MontaQuestionario];
    }
    @finally 
    {
        [Opcoes1 reloadData];
        [Opcoes2 reloadData];
        
    }
    
    
    
    
    
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSDateFormatter *formatoData = [[NSDateFormatter alloc] init];
    [formatoData setDateFormat:@"dd/MM/yyyy"];
    
    NSUserDefaults *configuracoes = [NSUserDefaults standardUserDefaults];
	
    //ESTA LINHA DEVE SER APAGADA ANTES DE LIBERAR A VERSÃO FREE!
    //[configuracoes setObject:[[NSNumber numberWithInt:0] stringValue] forKey:@"QuantidadePerguntas"];
    
    
	NSUInteger quantidadePerguntas = [[configuracoes objectForKey:@"QuantidadePerguntas"] intValue]; 
    NSString *dataUltimaPergunta = [configuracoes objectForKey:@"DataUltimaUtilizacao"];
    NSString *versao =[configuracoes objectForKey:@"Versao"];
    
    NSString *data = [formatoData stringFromDate:[NSDate date]];
    
    podeAbrir = YES;
    
    if([versao isEqualToString:@"free"])
    {
        if([data isEqualToString:dataUltimaPergunta])
        {   
            
            if(quantidadePerguntas >= 20)
            {
                UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Xis" message:@"Esta versão (free) só permite que sejam respondidas 20 questões por dia. Seu limite para hoje está esgotado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                [alerta show];
                
                podeAbrir = NO;
            }
        }
        else
        {
            [configuracoes setObject:data forKey:@"DataUltimaUtilizacao"];
            [configuracoes setObject:@"0" forKey:@"QuantidadePerguntas"];
        }
    }
    
    
    
    if(podeAbrir)
    {
        recarregaItens = YES;
        
        [Questao PreparaQuestionario];
        
        [botaoCorrigir setHidden:YES];
        [self MontaQuestionario];
        [botaoCorrigir setHidden:NO];
        [super viewDidLoad];
    }
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

-(void) viewWillAppear:(BOOL)animated
{

}

-(void)viewDidAppear:(BOOL)animated
{
    if(!podeAbrir)
        [self abreAbout:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == Opcoes1)
    {
        return [questao1.Opcoes count];
    }
    
    if(tableView == Opcoes2)
    {
        return [questao2.Opcoes count];
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *SimpleTableIdentifier = @"Pontos";
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    
    static NSString *IdentificadorDoItem = @"Pontos";
	
    
    if ([indexPath row] == 0)
    {
        OpcaoViewController *linha = (OpcaoViewController *)[tableView dequeueReusableCellWithIdentifier:IdentificadorDoItem];
        
        if(linha == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OpcaoView" owner:self options:nil];
            
            linha = [nib objectAtIndex:0];
        }
        
        if(tableView == Opcoes1)
        {
            
            [linha setPergunta:[questao1.Opcoes objectAtIndex:[indexPath row]]];
        }
        
        if(tableView == Opcoes2)
        {
            [linha setPergunta:[questao2.Opcoes objectAtIndex:[indexPath row]]];
        }
        
        
        return linha;
    }
    else
    {
        OpcaoTableCellViewController *linha = (OpcaoTableCellViewController *)[tableView dequeueReusableCellWithIdentifier:IdentificadorDoItem];
        
        if (linha == nil)
        {
            
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OpcaoTableCellView" owner:self options:nil];
            
            linha = [nib objectAtIndex:0];
            
        }
        
        NSString *q;
        NSString *textoOpcao;
        NSUInteger row = [indexPath row];
        
        if(tableView == Opcoes1)
        {
            textoOpcao = [questao1.Opcoes objectAtIndex:row];
            
            if(questao1.Marcado != nil)
            {
                if ([questao1.Marcado intValue] == row) 
                {
                    q = [NSString stringWithFormat:@"(X)"];
                }
                else
                {
                    q = [NSString stringWithFormat:@"(  )"];
                }
                
            }
            else
            {
                q = [NSString stringWithFormat:@"(  )"];
            }
            
        }
        
        if (tableView == Opcoes2) 
        {
            textoOpcao = [questao2.Opcoes objectAtIndex:row];
            
            if(questao2.Marcado != nil)
            {
                if ([questao2.Marcado intValue] == row) 
                {
                    q = [NSString stringWithFormat:@"(X)"];
                }
                else
                {
                    q = [NSString stringWithFormat:@"(  )"];
                }            
            }
            else
            {
                q = [NSString stringWithFormat:@"(  )"];
            }
        }
        
        if(Corrigir)
        {
            UIColor *corCerto = [UIColor greenColor];
            UIColor *corErrado = [UIColor redColor];
            
            
            
            if(tableView == Opcoes1)
            {
                NSUInteger resp = [[Opcoes1 indexPathForSelectedRow] row]; 
                
                if(row == [questao1.Resposta intValue])
                {
                    linha.backgroundColor = corCerto;
                }        
                
                
                if(row==resp)
                {
                    if(resp != [questao1.Resposta intValue])
                    {
                        linha.backgroundColor = corErrado;
                    }
                }
            }
            
            if(tableView == Opcoes2)
            {
                NSUInteger resp = [[Opcoes2 indexPathForSelectedRow] row];
                
                if(row == [questao2.Resposta intValue])
                {
                    linha.backgroundColor = corCerto;
                }        
                
                
                if(row==resp)
                {
                    if(resp != [questao2.Resposta intValue])
                    {
                        linha.backgroundColor = corErrado;
                    }
                }
            }
            
        }
        else
        {
            UIColor *corDeFundo = [UIColor whiteColor];
            
            linha.backgroundColor = corDeFundo;
        }
        
        linha.txtOpcao.text = q;//[NSString stringWithFormat:@"( ) %@", q];
        
        [linha setOpcao:textoOpcao];
        
        return linha;
    }
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    recarregaItens = NO;
    
    if(tableView == Opcoes1)
    {
        [Opcoes1 deselectRowAtIndexPath:indexPath animated:YES];
        NSInteger row = [indexPath row];
        
        questao1.Marcado = [NSNumber numberWithInt:row];   
        
        [Opcoes1 reloadData];
    }
    
    if(tableView == Opcoes2)
    {
        [Opcoes2 deselectRowAtIndexPath:indexPath animated:YES];
        NSInteger row = [indexPath row];
        
        questao2.Marcado = [NSNumber numberWithInt:row];
        
        [Opcoes2 reloadData];
    }
    recarregaItens = YES;
    
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     CGSize dimensoes;
     
     CGFloat tamanhoDoTexto;
     
     if(tableView == Opcoes1)
     dimensoes = [questao1.Pergunta sizeWithFont:[UIFont fontWithName:@"Noteworthy" size:17.0]];
     
     if(tableView == Opcoes2)
     dimensoes = [questao2.Pergunta sizeWithFont:[UIFont fontWithName:@"Noteworthy" size:17.0]];
     
     tamanhoDoTexto = dimensoes.height;
     */
    
    
    
    
    switch ([indexPath row]) 
    {
        case 0:
        {
            int tamanhoDoTexto;
            
            if(tableView == Opcoes1)
                tamanhoDoTexto = [questao1.Pergunta length];
            
            if(tableView == Opcoes2)
                tamanhoDoTexto = [questao2.Pergunta length];
            
            
            tamanhoDoTexto = MIN(tamanhoDoTexto, 380);
            
            if(tamanhoDoTexto > 100)
            {
                return tamanhoDoTexto;
            }
            else
            {
                return 100;
            }
            
            return tamanhoDoTexto;
            break;
        }
            
        default:
        {
            int tamanhoDoTexto;
            
            if(tableView == Opcoes1)
                tamanhoDoTexto = [[questao1.Opcoes objectAtIndex:[indexPath row]] length];
            
            if(tableView == Opcoes2)
                tamanhoDoTexto = [[questao2.Opcoes objectAtIndex:[indexPath row]] length];
            
            
            tamanhoDoTexto = MIN(tamanhoDoTexto, 200);
            
            if(tamanhoDoTexto > 74)
            {
                return tamanhoDoTexto;
            }
            else
            {
                return 74;
            }
            
            break;
        }
    }
    
    
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:@"mostraBanner" context:NULL];
    [Propaganda setHidden:NO];
    [UIView commitAnimations];
    
    /*
     [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
     // banner is invisible now and moved out of the screen on 50 px
     banner.frame = CGRectOffset(banner.frame, 0, 50);
     [UIView commitAnimations];
     */
    
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    
    [UIView beginAnimations:@"escondeBanner" context:NULL];
    [Propaganda setHidden:YES];
    [UIView commitAnimations];
    
    /*
     [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
     // banner is visible and we move it out of the screen, due to connection issue
     banner.frame = CGRectOffset(banner.frame, 0, -50);
     [UIView commitAnimations];
     */
    
}


@end


