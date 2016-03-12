//
//  ViewController.m
//  CreateTableViewByProtocols
//
//  Created by Hoàng Thái on 3/12/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController {
    NSArray* arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Data *data1 = [[Data alloc] initWithPhoto:[UIImage imageNamed:@"ngoctrinh.jpg"] Name:@"Ngoc Trinh" AndBirthDay:@"01-01-1996"];
    Data *data2 = [[Data alloc] initWithPhoto:[UIImage imageNamed:@"rebecca.jpg"] Name:@"Rebecca" AndBirthDay:@"10-2-1985"];
    Data *data3 = [[Data alloc] initWithPhoto:[UIImage imageNamed:@"taylorswift.jpg"] Name:@"Taylor Swift 2.0" AndBirthDay:@"09-09-2015"];
    
    arrayData = [[NSArray alloc] initWithObjects:data1, data2, data3, nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    Data *data = arrayData[indexPath.row];
    cell.textLabel.text = data.name;
    cell.detailTextLabel.text = data.birthDay;
    cell.imageView.image = data.photo;
    
    /* Change image size */
    CGSize itemSize = CGSizeMake(140, 115);
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


@end
