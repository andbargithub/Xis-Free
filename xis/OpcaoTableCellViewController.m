//
//  OpcaoTableCellViewController.m
//  xis
//
//  Created by Anderson Barcelos on 08/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "OpcaoTableCellViewController.h"

@implementation OpcaoTableCellViewController

@synthesize webOpcao;
@synthesize txtOpcao;

-(void)setOpcao:(NSString *)textoOpcao
{
    
    webOpcao.opaque = NO;
    webOpcao.backgroundColor = [UIColor clearColor];
    
    NSMutableString *conteudo = [[NSMutableString alloc]init];
    
    [conteudo appendString:@"<html><body style=\"background-color:transparent\">"];
    [conteudo appendString:@"<font face=\"Noteworthy\" size = 4 color=\"white\">"];
    [conteudo appendString:textoOpcao];
    [conteudo appendString:@"</font>"];
    [conteudo appendString:@"</body></html>"];
    
    [webOpcao loadHTMLString:conteudo baseURL:nil];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
