//
//  PDFReaderViewController.h
//  xis
//
//  Created by Anderson Barcelos on 20/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFReaderViewController : UIViewController
{
    UIWebView *conteudoPDF;
}

@property(nonatomic, retain) IBOutlet UIWebView *conteudoPDF;

-(IBAction)vaiPraHome:(id)sender;

@end
