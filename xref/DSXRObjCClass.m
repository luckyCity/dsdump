//
//  DSXRObjCClass.m
//  xref
//
//  Created by Derek Selander on 4/22/19.
//  Copyright © 2019 Selander. All rights reserved.
//

#import "DSXRObjCClass.h"
#import "DSXRLibrary+SymbolDumper.h"

@implementation DSXRObjCClass

- (instancetype)initWithAddress:(NSNumber *)address symbol:(NSString *)symbol {
    if (![symbol hasPrefix:@"_OBJC_CLASS_$_"]) {
        return nil;
    }
    if (self = [super init]) {
        self.name = symbol;
        self.address = address;
    }
    return self;
}

- (NSString *)shortName {
    return self.name.length > 14 ? [self.name substringFromIndex:14] : nil;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%p %@: <%p>", self.address.pointerValue, self.shortName, self];
}

@end



const char * ClassRefGetName(dsclass_ref_t ref) {
    const char * ptr = ref->name;
//    if (strlen(ref->name) > OBJC_CLASS_LENGTH) {
//        ptr = &ref->name[OBJC_CLASS_LENGTH];
//    }
    return ptr;
}

void hash_add_objcref_addr(dsclass_ref_t ref) {
//    HASH_ADD_PTR(objc_class_references_addr, address, ref);
}

void hash_add_objcref_str(dsclass_ref_t ref) {
//    HASH_ADD_PTR(objc_class_references_s, address, ref);
//    HASH_ADD_STR(objc_class_references_str, name, ref);
//    HASH_ADD_KEYPTR(hh, objc_class_references_str, ref->name, strlen(ref->name), ref);
}


dsclass_ref_t hash_get_objcref_addr(uintptr_t address) {
    dsclass_ref_t ref = NULL;
//    HASH_FIND_PTR(objc_class_references_addr, &address, ref);
    return ref;
}


dsclass_ref_t hash_get_objcref_str(char* str) {
    dsclass_ref_t ref = NULL;
//    HASH_FIND_STR(objc_class_references_str, str, ref);
    return ref;
}