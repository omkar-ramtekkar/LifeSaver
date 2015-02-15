//
//  Recorder.h
//  LifeSaver
//
//  Created by Omkar on 2/14/15.
//  Copyright (c) 2015 Omkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recorder : NSObject

-(BOOL) startRecording;
-(BOOL) stopRecording;
-(BOOL) deleteRecording;

@end
