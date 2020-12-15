//
//  PlanoEstudosViewController.m
//  xis
//
//  Created by Anderson Barcelos on 03/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PlanoEstudosViewController.h"
#import "Questao.h"
#import "MateriaTableViewCellController.h"
#import "QuestionarioIphoneViewController.h"
#import "PDFReaderViewController.h"

@implementation PlanoEstudosViewController
@synthesize Assuntos;
@synthesize AssuntosSelecionados;
@synthesize TodosAssuntos;
@synthesize Propaganda;

-(IBAction)voltar
{
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)iniciarTeste
{}

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    TodosAssuntos = [Questao Opcoes];
    //TodosAssuntos = [Questao Assuntos];
    //AssuntosSelecionados = [[NSMutableArray alloc] init];
    [super viewDidLoad];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [TodosAssuntos count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IdentificadorDoItem = @"Pontos";
	
    MateriaTableViewCellController *linha = (MateriaTableViewCellController *)[tableView dequeueReusableCellWithIdentifier:IdentificadorDoItem];
	
    if (linha == nil)
	{
        if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
        {
            
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MateriaTableViewCell" owner:self
                                                       options:nil];
            linha = [nib objectAtIndex:0];
        }
        else
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MateriaTableViewCellIphone" owner:self
                                                       options:nil];
            linha = [nib objectAtIndex:0];
        }
	}
    
	NSString *q;
	NSUInteger row = [indexPath row];
    
    q = [TodosAssuntos objectAtIndex:row];
    
    linha.lblMateria.text = q;
    
    return linha;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    NSUInteger row = [indexPath row];
    NSString *assunto = [TodosAssuntos objectAtIndex:row];
    
    if([[Questao TipoQuestionario] isEqualToString:@"M"])
    {
        
        //NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        [Questao setMateriaDaProva:[documentsDirectory stringByAppendingPathComponent:assunto]];
        
        UIViewController *tela;
        
        if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
        {
            tela = [[PDFReaderViewController alloc] initWithNibName:@"PDFReaderView" bundle:nil];
        }
        else
        {
            tela = [[PDFReaderViewController alloc] initWithNibName:@"PDFReaderViewIphone" bundle:nil];
        }
        
        tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:tela animated:YES];
    }
    else
    {
        
        [Questao setFiltrado:YES];
        [Questao setMateriaDaProva:assunto];
        
        UIViewController *tela;
        
        if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
        {
            tela = [[QuestionarioViewController alloc] initWithNibName:@"QuestionarioView" bundle:nil];
        }
        else
        {
            tela = [[QuestionarioIphoneViewController alloc] initWithNibName:@"QuestionarioViewIphone" bundle:nil];
        }
        
        tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:tela animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
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
