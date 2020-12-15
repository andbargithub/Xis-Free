//
//  PrincipalViewController.m
//  xis
//
//  Created by Anderson Barcelos on 30/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PrincipalViewController.h"
#import "QuestionarioIphoneViewController.h"

@implementation PrincipalViewController
@synthesize vwEspera;
@synthesize aiEspera;
@synthesize Propaganda;

-(IBAction)abreQuestionario
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera startAnimating];
    [vwEspera setHidden:NO];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    
    [Questao setFiltrado:NO];
    
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
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera stopAnimating];
    [vwEspera setHidden:YES];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

-(IBAction)abreAssuntos
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera startAnimating];
    [vwEspera setHidden:NO];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    
    [Questao setTipoQuestionario:@"A"];    
    [Questao setOpcoes:[[[Questao alloc] init] ListaAssuntos]];
    
    PlanoEstudosViewController *tela;
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosView" bundle:nil];
    }
    else
    {
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:tela animated:YES];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera stopAnimating];
    [vwEspera setHidden:YES];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

-(IBAction)abreCargos
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera startAnimating];
    [vwEspera setHidden:NO];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    
    [Questao setTipoQuestionario:@"C"];
    [Questao setOpcoes:[[[Questao alloc] init] ListaCargos]];
    
    PlanoEstudosViewController *tela;
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosView" bundle:nil];
    }
    else
    {
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:tela animated:YES];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera stopAnimating];
    [vwEspera setHidden:YES];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

-(IBAction)abreOrganizadoras
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera startAnimating];
    [vwEspera setHidden:NO];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    
    [Questao setTipoQuestionario:@"O"];
    [Questao setOpcoes:[[[Questao alloc] init] ListaOrganizadoras]];
    
    PlanoEstudosViewController *tela;
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosView" bundle:nil];
    }
    else
    {
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:tela animated:YES];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera stopAnimating];
    [vwEspera setHidden:YES];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

-(IBAction)abreMaterialDidatico
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera startAnimating];
    [vwEspera setHidden:NO];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    
    [Questao setTipoQuestionario:@"M"];
    [Questao setOpcoes:[Questao ListaMaterialDidatico]];
    
    PlanoEstudosViewController *tela;
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
        
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosView" bundle:nil];
    }
    else
    {
        tela  = [[PlanoEstudosViewController alloc] initWithNibName:@"PlanoEstudosViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:tela animated:YES];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    [aiEspera stopAnimating];
    [vwEspera setHidden:YES];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
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

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

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
