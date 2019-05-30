//
//  BookModel.h
//  AFNetworking
//
//  Created by Civet on 2019/5/27.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

@property(nonatomic,retain) NSString *mBookName;
@property(nonatomic,retain) NSString *mBookPrice;
@property(nonatomic,retain) NSString *mBookPublisher;
@property(nonatomic,retain) NSMutableArray *mAuthor;

@property(nonatomic,retain) NSString *mScore;

@end
