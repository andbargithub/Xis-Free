//
//  OpcaoTableCellViewController.h
//  xis
//
//  Created by Anderson Barcelos on 08/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpcaoTableCellViewController : UITableViewCell
{
    IBOutlet UIWebView *webOpcao;
    IBOutlet UILabel *txtOpcao;
}

@property(nonatomic, retain) IBOutlet UIWebView *webOpcao;
@property(nonatomic, retain) IBOutlet UILabel *txtOpcao;

-(void)setOpcao:(NSString *)textoOpcao;

@end
