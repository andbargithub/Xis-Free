//
//  PDFReaderViewController.m
//  xis
//
//  Created by Anderson Barcelos on 20/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PDFReaderViewController.h"
#import "Questao.h"

@implementation PDFReaderViewController
@synthesize conteudoPDF;

-(IBAction)vaiPraHome:(id)sender
{
    
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self dismissModalViewControllerAnimated:YES];
    
    /*
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
     */
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
    
    NSString *path = [Questao MateriaDaProva];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [conteudoPDF loadRequest:request];
    
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

@end
