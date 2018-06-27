//
//  TaxViewController.m
//  TaxCaculater
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import "TaxViewController.h"
#import "PdTaxMoneyCell.h"
#import "PdTaxInsuranceCell.h"
#import "TaxModel.h"
#import "PersonInsuranceModel.h"
#import "CompanyInsuranceModel.h"
#import "PdTaxTitleCell.h"
//#import "TaxtitleHeadie.xib"
static NSString *const kTaxTitleItemCellId = @"kTaxTitleItemCellId";
static NSString *const kTaxInsuranceItemCellId = @"kTaxInsuranceItemCellId";
@interface TaxViewController ()
<
UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UICollectionView *taxCollectionView;

@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *insureArray;
@property (nonatomic,strong)UITableView *mainTableView;
@property (nonatomic,strong)UIView      *incomeView;
@property (nonatomic,strong)UIView      *cityView;
@end

@implementation TaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"个税计算器";
    [self initData];
    [self initViews];

    // Do any additional setup after loading the view.
}

- (void)initData {

    if (!_insureArray) {
        _insureArray = [[NSMutableArray alloc] init];
    }
    NSArray *yanglaoArray = @[@"养老",@"0.08",@"0",@"0.22",@"0"];
    NSArray *yiliaoArray = @[@"医疗",@"0.02",@"0",@"0.11",@"0"];
    NSArray *shiyeArray = @[@"失业",@"0.005",@"0",@"0.015",@"0"];
    NSArray *shengyuArray = @[@"生育",@"0.08",@"0",@"0.22",@"0"];
    NSArray *gongshangArray = @[@"工伤",@"0.08",@"0",@"0.22",@"0"];

    
    NSArray *array = @[yanglaoArray,yiliaoArray,shiyeArray,shengyuArray,gongshangArray];
    for (int i=0; i<array.count; i++) {
        PersonInsuranceModel *model =[[PersonInsuranceModel alloc]init];
        NSArray *subArr = [array objectAtIndex:i];
        model.insuranceName = [subArr objectAtIndex:0];
        model.personRate = [subArr objectAtIndex:1];
        model.personFund = [subArr objectAtIndex:2];
        model.companyRate = [subArr objectAtIndex:3];
        model.companyFund = [subArr objectAtIndex:4];
        [self.insureArray addObject:model];
    }
    
}

- (void)initViews {
    [self initIncomeView];
    [self initTableView];
}

- (void)initIncomeView {
    UIView *incomeView = [[UIView alloc] initWithFrame:CGRectMake(0, Pd_Top_Bar_Height, Pd_Screen_width, 44)];
    [self.view addSubview:incomeView];
    self.incomeView = incomeView;
    UILabel *incomeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 44)];
    incomeNameLabel.text = @"税前工资";
    [incomeView addSubview:incomeNameLabel];
    UITextField *incomeTextField = [[UITextField alloc] init];
    incomeTextField.placeholder = @"(元)";
    [incomeView addSubview:incomeTextField];
    
    [incomeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(incomeView.mas_left).offset(15);
        make.height.equalTo(incomeView.mas_height);
        make.width.equalTo(@80);
        make.top.equalTo(incomeView.mas_top);
    }];
    
    [incomeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(incomeNameLabel.mas_right).offset(0);
        make.height.equalTo(incomeView.mas_height);
        make.width.equalTo(@180);
        make.top.equalTo(incomeView.mas_top);
    }];
    
    
    UIView *cityView = [[UIView alloc] initWithFrame:CGRectMake(0, incomeView.bottom, Pd_Screen_width, 44)];
    [self.view addSubview:cityView];
    self.cityView = cityView;
    UILabel *cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 44)];
    cityNameLabel.text = @"所在城市";
    [cityView addSubview:cityNameLabel];
    UITextField *cityTextField = [[UITextField alloc] init];
    cityTextField.placeholder = @"深圳(点此更换城市)";
    [cityView addSubview:cityTextField];
    
    [cityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cityView.mas_left).offset(15);
        make.height.equalTo(cityView.mas_height);
        make.width.equalTo(@80);
        make.top.equalTo(cityView.mas_top);
    }];
    
    [cityTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cityNameLabel.mas_right);
        make.width.equalTo(@240);
        make.height.equalTo(cityView.mas_height);
        make.top.equalTo(cityView.mas_top);
    }];
}


- (void)initTableView {

    if (!_mainTableView) {
        self.mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        self.mainTableView.backgroundColor = [UIColor clearColor];
        self.mainTableView.delegate = self;
        self.mainTableView.dataSource = self;
        [self.mainTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        [self.mainTableView registerNib:[UINib nibWithNibName:@"PdTaxInsuranceCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kTaxInsuranceItemCellId];
        UINib *titleNib = [UINib nibWithNibName:@"PdTaxTitleCell" bundle:[NSBundle mainBundle]];
        [_mainTableView registerNib:titleNib forCellReuseIdentifier:kTaxTitleItemCellId];
        [self.view addSubview:self.mainTableView];
        [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(0);
            make.right.equalTo(self.view.mas_right).offset(0);
            make.top.equalTo(self.cityView.mas_bottom).offset(0);
            make.bottom.equalTo(self.view.mas_bottom).offset(0);
        }];
    }


}

- (void)initTaxCategoryView {
    UIView *categoryView = [[UIView alloc] init];
    [self.view addSubview:categoryView];
    [categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@44);
    }];
    
    UILabel *personCatView = [[UILabel alloc] init];
    personCatView.text = @"个人";
    [self.view addSubview:personCatView];
    [personCatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(-Pd_Screen_width/5);
        make.width.equalTo(@(Pd_Screen_width*2/5));
        make.top.equalTo(categoryView.mas_top);
        make.bottom.equalTo(categoryView.mas_bottom);
    }];
    
    UILabel *companyCatView = [[UILabel alloc] init];
    companyCatView.text = @"单位";
    [self.view addSubview:companyCatView];
    [companyCatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(personCatView.mas_right).offset(0);
        make.right.equalTo(categoryView.mas_right);
        make.top.equalTo(categoryView.mas_top);
        make.bottom.equalTo(categoryView.mas_bottom);
    }];
    
    
}


#pragma mark - TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.insureArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        PdTaxTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:kTaxTitleItemCellId ];
        if (!titleCell) {
            titleCell = [[PdTaxTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTaxTitleItemCellId];
        }
        return titleCell;
        
    }
    if (indexPath.section ==1 && indexPath.row < 5) {
        PdTaxInsuranceCell *insuranceCell = [tableView dequeueReusableCellWithIdentifier:kTaxInsuranceItemCellId ];
        if (!insuranceCell) {
            insuranceCell = [[PdTaxInsuranceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTaxInsuranceItemCellId];
            insuranceCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        PersonInsuranceModel *personInsuranceModel = [self.insureArray objectAtIndex:indexPath.row];
        insuranceCell.cellModel = personInsuranceModel;
        return insuranceCell;
    }
    return [[UITableViewCell alloc] init];
}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    PdGamePostModel* postModel = self.gamePostArray[indexPath.section];
//    postModel.gameName = self.gameInfo[@"name"];
//    postModel.gameId = self.gameInfo[@"id"];
//    PdPostDetailsViewController* poseDetailsVc = [[PdPostDetailsViewController alloc] initWithPostInfo:postModel];
//    [self.navigationController pushViewController:poseDetailsVc animated:YES];
//}

//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 44;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[[NSBundle mainBundle] loadNibNamed:@"TaxTitleHeadView" owner:self options:nil] firstObject];
    
    return headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
