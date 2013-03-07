//
//  MMDetailViewController.m
//  CGCACookBook
//
//  Created by Mohammad Abdurraafay on 20/02/13.
//  Copyright (c) 2013 Mohammad Abdurraafay. All rights reserved.
//

#import "MMDetailViewController.h"
#import "MMDrawingBoardViewController.h"

@interface MMDetailViewController () <MMDrawingBoardViewControllerDelegate>

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MMDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if ([self.delegate respondsToSelector:@selector(mmDetailViewController:)]) {
        [self.delegate performSelector:@selector(mmDetailViewController:) withObject:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(mmDetailViewController:didPopedOut:)]) {
        [self.delegate mmDetailViewController:self didPopedOut:YES];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 6;
        default:
            break;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    // Configure the cell...
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Linear Paths";
                    break;
                case 1:
                    cell.textLabel.text = @"Shapes";
                default:
                    break;
            }
            
            break;
        case 1:
            
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Liner Paths";
                    cell.detailTextLabel.text = @"CGContext";
                    break;
                case 1:
                    cell.textLabel.text = @"Shapes";
                    cell.detailTextLabel.text = @"CGContext";
                    break;
                case 2:
                    cell.textLabel.text = @"Patterns";
                    cell.detailTextLabel.text = @"CGPattern";
                    break;
                case 3:
                    cell.textLabel.text = @"Shadows";
                    cell.detailTextLabel.text = @"####";
                    break;
                case 4:
                    cell.textLabel.text = @"Gradients";
                    cell.detailTextLabel.text = @"#####";
                    break;
                case 5:
                    cell.textLabel.text = @"Shading";
                    cell.detailTextLabel.text = @"#####";
                    break;
                default:
                    break;
            }
            
            break;
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section; {
    
    switch (section) {
        case 0:
            return @"UIKit";
            break;
        case 1:
            return @"CoreGraphics";
            break;
            
        default:
            break;
    }
    
    return @"Paths";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    self.selectedIndexPath = indexPath;
    MMDrawingBoardViewController *detailViewController = [[MMDrawingBoardViewController alloc] initWithSelectedIndex:indexPath];
    detailViewController.delegate = self;
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(void)mmDrawingBoardViewController:(MMDrawingBoardViewController *)detailsVC didPopedOut:(BOOL)popped {
    
    [_tableView deselectRowAtIndexPath:_selectedIndexPath animated:YES];
}

@end
