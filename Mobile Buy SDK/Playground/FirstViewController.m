//
//  FirstViewController.m
//  Mobile Buy SDK
//
//  Created by Shopify.
//  Copyright (c) 2015 Shopify Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FirstViewController.h"

@import Buy;

@interface FirstViewController ()

@property (nonatomic, strong) BUYClient *client;

@end

@implementation FirstViewController

- (IBAction)buttonAction:(id)sender {
	self.client = [[BUYClient alloc] initWithShopDomain:@"the-app-boutique.myshopify.com"
												 apiKey:@"506ede8b60f86fbf86109a762fe8093d"
											  channelId:@"9060547"];
	self.client.urlScheme = @"sampleapp://";
	
	BUYProductViewController *productViewController = [[BUYProductViewController alloc] initWithClient:self.client];
	[productViewController loadProduct:@"" completion:^(BOOL success, NSError *error) {
		if (!error) {
			[self presentViewController:productViewController animated:YES completion:NULL];
		}
	}];
}

@end
