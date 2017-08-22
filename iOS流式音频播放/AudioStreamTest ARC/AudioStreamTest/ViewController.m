//
//  ViewController.m
//  AudioStreamTest
//
//  Created by szhx on 13-5-22.
//  Copyright (c) 2013年 szhx. All rights reserved.
//

#import "ViewController.h"
#import "AudioStreamer.h"

@interface ViewController ()
{
    AudioStreamer *streamer;
}

@end

@implementation ViewController
@synthesize urlTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender
{
    UIButton *button = sender;
    if([button.titleLabel.text isEqual:@"play"])
    {
        [button setTitle:@"pause" forState:UIControlStateNormal];
        
        [urlTextField resignFirstResponder];
		if (!streamer) {            
            [self createStreamer];
        }
		[streamer start];
    }
    else
    {
        [button setTitle:@"play" forState:UIControlStateNormal];
        [streamer pause];
    }
    
}

- (void)createStreamer
{
	[self destroyStreamer];
	
	NSString *escapedValue =
    ( NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                         nil,
                                                         (CFStringRef)urlTextField.text,
                                                         NULL,
                                                         NULL,
                                                                  kCFStringEncodingUTF8)) ;
     ;
	NSURL *url = [NSURL URLWithString:escapedValue];
	streamer = [[AudioStreamer alloc] initWithURL:url];
	

}

- (void)destroyStreamer
{
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:streamer];
		
		[streamer stop];
		streamer = nil;
	}
}


@end
