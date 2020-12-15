//
//  Opcao.h
//  xis
//
//  Created by Anderson Barcelos on 03/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpcaoViewController: UITableViewCell
{
    IBOutlet UIWebView *textoPergunta;
}

@property(nonatomic, retain) IBOutlet UIWebView *textoPergunta;

-(void)setPergunta:(NSString *)pergunta;

@end
