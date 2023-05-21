//
//  ViewController.m
//  ObjcProject
//
//  Created by David on 26.04.23.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Test *test = [[Test alloc] init];
    
    [test sayHello];
    [Test sayGoodBye];
    
    
    self.tasksArray = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.bounds.size.width - 20, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 50, 50, 40)];
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    addButton.backgroundColor = [UIColor greenColor];
    [addButton addTarget:self action:@selector(addTask) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    NSLog(@"bbb");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.tasksArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasksArray removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

- (void)addTask {
    [self.tasksArray addObject:self.textField.text];
    self.textField.text = @"";
    [self.tableView reloadData];
}

@end
