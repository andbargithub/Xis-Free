//
//  PlanoEstudosViewController.h
//  xis
//
//  Created by Anderson Barcelos on 03/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionarioViewController.h"
#import <iAd/iAd.h>

@interface PlanoEstudosViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ADBannerViewDelegate>
{
    IBOutlet UITableView *Assuntos;
    NSMutableArray *AssuntosSelecionados;
    NSArray *TodosAssuntos;
    
    ADBannerView *Propaganda;

}

@property(nonatomic, retain) IBOutlet UITableView *Assuntos;
@property(nonatomic, retain) NSMutableArray *AssuntosSelecionados;
@property(nonatomic, retain) NSArray *TodosAssuntos;
@property(nonatomic, retain) IBOutlet ADBannerView *Propaganda;


-(IBAction)voltar;
-(IBAction)iniciarTeste;

@end
