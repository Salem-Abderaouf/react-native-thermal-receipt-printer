//
//  RNBLEPrinter.m
//
//  Created by MTT on 06/10/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RNBLEPrinter.h"
#import "PrinterSDK.h"

@implementation RNBLEPrinter

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
NSMutableArray* _printerArray;

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(init,
                 init_resolver:(RCTPromiseResolveBlock)resolve
                 init_rejecter:(RCTPromiseRejectBlock)reject) {
    resolve(@"Init successful");
}

RCT_REMAP_METHOD(getDeviceList,
                 get_device_list_resolver:(RCTPromiseResolveBlock)resolve
                 get_device_list_rejecter:(RCTPromiseRejectBlock)reject) {
    _printerArray = [NSMutableArray new];
    
    [[PrinterSDK defaultPrinterSDK] scanPrintersWithCompletion:^(Printer* printer){
        [_printerArray addObject:printer];
    }];
    
    resolve(@[_printerArray]);
    
}

RCT_EXPORT_METHOD(connectPrinter:(NSString *)innerAddress
                  connect_printer_resolver:(RCTPromiseResolveBlock)resolve
                  connect_printer_rejecter:(RCTPromiseRejectBlock)reject) {
    // TODO
    resolve(@"TODO");
}

RCT_EXPORT_METHOD(printRawData:(NSString *)base64
                  print_data_resolver:(RCTPromiseResolveBlock)resolve
                  print_data_rejecter:(RCTPromiseRejectBlock)reject) {
    // TODO
    resolve(@"TODO");
}

RCT_REMAP_METHOD(closeConn,
                 close_connect_resolver:(RCTPromiseResolveBlock)resolve
                 close_connect_rejecter:(RCTPromiseRejectBlock)reject) {
    [[PrinterSDK defaultPrinterSDK] disconnect];
    resolve(@"Successful");
}

@end
