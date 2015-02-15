//
//  Recorder.m
//  LifeSaver
//
//  Created by Omkar on 2/14/15.
//  Copyright (c) 2015 Omkar. All rights reserved.
//

#import "Recorder.h"
#import <AVFoundation/AVFoundation.h>
#import "AgentSystemInfo.h"

@interface Recorder()
@property (nonatomic, strong) AVAudioRecorder *recorder;
@end

@implementation Recorder

-(id) init
{
    self = [super init];
    
    if (self)
    {
        self.recorder = nil;
    }
    
    return self;
}

-(BOOL) startRecording
{
    if (!self.recorder)
    {
        NSString *sampleSoundRecordingPath = [[AgentSystemInfo documentDirectoryPath] stringByAppendingPathComponent:@"sample.caf"];
        
        NSError *error = nil;
        self.recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:sampleSoundRecordingPath] settings:[self basicSettings] error:&error];
        
        if (error)
        {
            NSAssert(error, @"Failed to create recorder. Error - %@", error);
            return FALSE;
        }
    }
    
    if (self.recorder.recording)
    {
        NSAssert(self.recorder.recording == FALSE, @"Recording is in progress. Stop and again start recording");
        return FALSE;
    }
    
    BOOL bPrepareToRecord = [self.recorder prepareToRecord];
    
    NSAssert(bPrepareToRecord, @"Prepare to record failed");
    
    BOOL bRecordingStarted = [self.recorder record];
    
    NSAssert(bRecordingStarted, @"Failed to start recording. record method failed");
    
    return bRecordingStarted;
}

-(NSDictionary*) basicSettings
{
    return [NSDictionary
               dictionaryWithObjectsAndKeys:
               [NSNumber numberWithInt:AVAudioQualityMin], AVEncoderAudioQualityKey,
               [NSNumber numberWithInt:16], AVEncoderBitRateKey,
               [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
               [NSNumber numberWithFloat:44100.0], AVSampleRateKey,
               nil];
}

-(BOOL) stopRecording
{
    if (!self.recorder)
    {
        NSAssert(self.recorder, @"Failed to stop recorder. Recorder object is nil");
        return NO;
    }
    
    if (!self.recorder.recording)
    {
        NSAssert(self.recorder.recording, @"Failed to stop recorder. Recording is not in progress");
        return NO;
    }
    
    [self.recorder stop];
    
    return YES;
}

-(BOOL) deleteRecording
{
    if (!self.recorder)
    {
        NSAssert(self.recorder, @"Failed to delete recording. Recorder object is nil");
        return NO;
    }
    
    if (self.recorder.isRecording)
    {
        NSAssert(self.recorder.isRecording, @"Failed to delete recording. Recorder is in progress. Stop recording before deleting recording file");
        return NO;
    }
    
    BOOL bDeletedRecording = [self.recorder deleteRecording];
    
    if (!bDeletedRecording)
    {
        NSAssert(bDeletedRecording, @"Failed to delete recording. Delete recording method returned failure");
    }

    return bDeletedRecording;
}

@end
