//
//  EstatisticasViewController.h
//  xis
//
//  Created by Anderson Barcelos on 10/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Avaliacao.h"
#import "PrincipalViewController.h"
#import <iAd/iAd.h>

@interface EstatisticasViewController : UIViewController<ADBannerViewDelegate>
{
    IBOutlet UILabel *lblTotalPerguntas;
    IBOutlet UILabel *lblTotalCertas;
    IBOutlet UILabel *lblTotalErradas;
    IBOutlet UILabel *lblTempoTotal;
    IBOutlet UILabel *lblPercentualCertas;
    IBOutlet UILabel *lblTempoMedio;
    
    ADBannerView *Propaganda;
}

@property(nonatomic, retain) IBOutlet UILabel *lblTotalPerguntas;
@property(nonatomic, retain) IBOutlet UILabel *lblTotalCertas;
@property(nonatomic, retain) IBOutlet UILabel *lblTotalErradas;
@property(nonatomic, retain) IBOutlet UILabel *lblTempoTotal;
@property(nonatomic, retain) IBOutlet UILabel *lblPercentualCertas;
@property(nonatomic, retain) IBOutlet UILabel *lblTempoMedio;
@property(nonatomic, retain) IBOutlet ADBannerView *Propaganda;

-(IBAction)vaiPraHome:(id)sender;

@end
