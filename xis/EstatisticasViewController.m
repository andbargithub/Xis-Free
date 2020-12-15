//
//  EstatisticasViewController.m
//  xis
//
//  Created by Anderson Barcelos on 10/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EstatisticasViewController.h"


@implementation EstatisticasViewController
@synthesize lblTempoMedio;
@synthesize lblTempoTotal;
@synthesize lblTotalCertas;
@synthesize lblTotalErradas;
@synthesize lblTotalPerguntas;
@synthesize lblPercentualCertas;
@synthesize Propaganda;

-(IBAction)vaiPraHome:(id)sender
{
    PrincipalViewController *tela;
    
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
    {
     tela = [[PrincipalViewController alloc] initWithNibName:@"PrincipalView" bundle:nil];
    }
    else
    {
        tela = [[PrincipalViewController alloc] initWithNibName:@"PrincipalViewIphone" bundle:nil];
    }
	
	tela.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    lblTotalPerguntas.text = [[Avaliacao PerguntasRespondidas] stringValue];
    lblTotalCertas.text = [[Avaliacao RespostasCertas] stringValue];
    lblTotalErradas.text = [[Avaliacao RespostasErradas] stringValue];
    
    if([[Avaliacao TempoDoTeste] intValue] > 1)
    {    
        lblTempoTotal.text = [NSString stringWithFormat:@"%.02f Minutos", [[Avaliacao TempoDoTeste] floatValue]];
    }
    else
    {
        lblTempoTotal.text = @"menos de 1 minuto.";
    }
    
    float percentualDeAcertos = [[Avaliacao RespostasCertas] floatValue] / [[Avaliacao PerguntasRespondidas] floatValue] *100;
    
    lblPercentualCertas.text = [NSString stringWithFormat:@"%.02f%%",[[NSNumber numberWithFloat:percentualDeAcertos] floatValue]];
    
    float tempoMedio = [[Avaliacao PerguntasRespondidas] intValue] / [[Avaliacao TempoDoTeste] intValue];
    
    if(tempoMedio > 1)
    {
        lblTempoMedio.text = [NSString stringWithFormat:@"%@ Minutos", [[NSNumber numberWithFloat:tempoMedio] stringValue]];
    }
    else
    {
        lblTempoMedio.text = @"menos de 1 minuto.";
    }
    
    
    
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
