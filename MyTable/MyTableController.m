//
//  MyTableController.m
//  MyTable
//
//  Created by Toshimi Ataku on 2017/04/28.
//  Copyright (c) 2017年 Toshimi Ataku. All rights reserved.
//

#import "MyTableController.h"

@implementation MyTableController
{
    NSMutableArray *rows;
    NSImage *image;
}

-(instancetype)init
{
    NSString *imagefile;
    
    rows = [[NSMutableArray arrayWithCapacity: 10] init];
    NSLog(@"# of rows: %lu", (unsigned long)rows.count);
    imagefile = [NSString stringWithCString:"MyTable.app/Contents/Resources/DSC_0106.jpg" encoding:NSASCIIStringEncoding];
    image = [[NSImage alloc] initWithContentsOfFile: imagefile];
    return self;
}

-(void)awakeFromNib
{
    ;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return rows.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell;
    int col;

    for (col = 0; col < tableView.tableColumns.count; col++) {
        if (tableView.tableColumns[col] == tableColumn)
            break;
    }
    if (tableView.tableColumns[col] != tableColumn)
        return nil;
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if (cell == nil) {
        NSRect rect;
        rect.origin.x = rect.origin.y = 0;
        rect.size.width = rect.size.height = 10;
        cell = [[NSTableCellView alloc] initWithFrame:rect];
    }

    if (col < 2) {
        cell.textField.stringValue = rows[row][col];
    } else {
        cell.imageView.image = image;
    }

    return cell;
}

- (IBAction)doLoad:(id)sender {
    NSArray *cols;
    int i;
    
    cols = [NSArray arrayWithObjects:@"name1", @"value1", image, nil];
    [rows addObject: cols];
    
    cols = [NSArray arrayWithObjects:@"name2", @"value2", image, nil];
    [rows addObject: cols];
    
    cols = [NSArray arrayWithObjects:@"name3", @"value3", image, nil];
    [rows addObject: cols];
    
    cols = [NSArray arrayWithObjects:@"name4", @"value4", image, nil];
    [rows addObject: cols];
    
    cols = [NSArray arrayWithObjects:@"name5", @"value5", image, nil];
    [rows addObject: cols];
    
    for (i = 0; i < rows.count; i++) {
        NSLog(@"%d:%@\t%@", i, rows[i][0], rows[i][1]);
    }
    
    [_tableview.documentView reloadData];
}
@end
