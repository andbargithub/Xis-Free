//
//  Opcao.m
//  xis
//
//  Created by Anderson Barcelos on 03/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "OpcaoViewController.h"

@implementation OpcaoViewController
@synthesize textoPergunta;

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

-(void)setPergunta:(NSString *)pergunta
{
    
    textoPergunta.opaque = NO;
    textoPergunta.backgroundColor = [UIColor clearColor];
    
    NSMutableString *conteudo = [[NSMutableString alloc]init];
    
    [conteudo appendString:@"<html><body style=\"background-color:transparent\">"];
    //[conteudo appendString:@"<html><body>"];
    [conteudo appendString:@"<font face=\"Noteworthy\" size = 4 color=\"white\">"];
    [conteudo appendString:pergunta];
    [conteudo appendString:@"</font>"];
    [conteudo appendString:@"</body></html>"];
    
    [textoPergunta loadHTMLString:conteudo baseURL:nil];
}


@end
