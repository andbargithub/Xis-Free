//
//  PrincipalViewController.h
//  xis
//
//  Created by Anderson Barcelos on 30/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionarioViewController.h"
#import "PlanoEstudosViewController.h"
#import "AboutVIewController.h"
#import <iAd/iAd.h>

@interface PrincipalViewController : UIViewController<ADBannerViewDelegate>
{
    IBOutlet UIView *vwEspera;
    IBOutlet UIActivityIndicatorView *aiEspera;
    
    ADBannerView *Propaganda;
}

@property(nonatomic, retain) IBOutlet UIView *vwEspera;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *aiEspera;
@property(nonatomic, retain) IBOutlet ADBannerView *Propaganda;

-(IBAction)abreQuestionario;
-(IBAction)abreAssuntos;
-(IBAction)abreOrganizadoras;
-(IBAction)abreCargos;
-(IBAction)abreMaterialDidatico;
-(IBAction)abreAbout:(id)sender;

@end
