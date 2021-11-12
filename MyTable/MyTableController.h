//
//  MyTableController.h
//  MyTable
//
//  Created by Toshimi Ataku on 2017/04/28.
//  Copyright (c) 2017年 Toshimi Ataku. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface MyTableController : NSObject <NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSScrollView *tableview;

-(void)awakeFromNib;

/* Protocol in DataSource */
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;

/* Protocol in Delegate */
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

- (IBAction)doLoad:(id)sender;
@end
