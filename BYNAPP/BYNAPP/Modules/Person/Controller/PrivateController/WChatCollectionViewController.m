//
//  WChatCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WChatCollectionViewController.h"
#import "WChatCollectionViewCell.h"
#import "SetBottomCollectionViewCell.h"

@interface WChatCollectionViewController ()

@property(nonatomic,strong)NSString * TextSting;

@end

@implementation WChatCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[WChatCollectionViewCell class] forCellWithReuseIdentifier:@"WChatCollectionViewCell"];
    
    [self.collectionView registerClass:[SetBottomCollectionViewCell class] forCellWithReuseIdentifier:@"SetBottomCollectionViewCell"];
  
    [self.collectionView reloadData];
    
   
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 2;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        WChatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WChatCollectionViewCell" forIndexPath:indexPath];
        
        [cell.MainTextField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
        
        cell.TextFieldString = self.TildType;
         
        return cell;
        
    }else{
        
        
        SetBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetBottomCollectionViewCell" forIndexPath:indexPath];
        
        cell.TitString = @"确定";
        
        cell.BottomMainBtnBlockClick = ^{
          
             [self YYShowAlertViewTitle:@"确定修改信息"];
            
        };
        
        return cell;
        
    }
    
}



#pragma mark =============监听uitextField值的变化============

- (void)textFieldWithText:(UITextField *)textField
{
    
    self.TextSting = textField.text;
    
}



#pragma mark 确定

-(void)YYShowAlertTitleClick{
    
    if (self.TextSting.length == 0) {
        
        [self YYShowMessage:@"请输入对应的信息"];
        
        return;
        
    }
   
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserUpdateInfo];
    
    NSDictionary * dict;
    
     if ([self.TildType isEqualToString:@"1"]) {
        dict = @{@"name":self.TextSting};
     }else if ([self.TildType isEqualToString:@"2"]){
        dict = @{@"area_code":@"+86",@"phone":self.TextSting};
     }else{
        dict = @{@"wx_account":self.TextSting};
     }
        
                           
    [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
        
        if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
            
            if ([self.TildType isEqualToString:@"1"]) {
            
                self.UModel.name = self.TextSting;
                
                [YYSaveTool YY_SaveModel:self.UModel key:YYUser];
                
            }else if ([self.TildType isEqualToString:@"2"]){
                
                self.UModel.phone = self.TextSting;
                
                [YYSaveTool YY_SaveModel:self.UModel key:YYUser];
               
            }else{
                
                self.UModel.wx_account = self.TextSting;
                
                [YYSaveTool YY_SaveModel:self.UModel key:YYUser];
                
            }
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            
            [self YYShowMessage:@"修改失败"];
            
        }
             
    } failure:^(NSError *error, id responseCache) {
                 
        [self YYShowMessage:@"修改失败"];

    }];
    
    
}




#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.item == 0){
          return CGSizeMake(YYScreenWidth , 80);
    }else{
          return CGSizeMake(YYScreenWidth , 65);
    }

}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
        return (CGSize){YYScreenWidth,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,0};
    
}


// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        
        if(headerView == nil){
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        headerView.backgroundColor = YYBGColor;
     
        return headerView;
    
    }
    
    return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(20, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}




@end
