// Copyright 2015-present 650 Industries. All rights reserved.

import Foundation

class EXDevLauncherUtils {
  /**
   Swizzles implementations of given selectors.
   */
  static func swizzle(selector selectorA: Selector, withSelector selectorB: Selector, forClass: AnyClass) {
    if let methodA = class_getInstanceMethod(forClass, selectorA),
      let methodB = class_getInstanceMethod(forClass, selectorB) {
      let impA = method_getImplementation(methodA)
      let argsTypeA = method_getTypeEncoding(methodA)

      let impB = method_getImplementation(methodB)
      let argsTypeB = method_getTypeEncoding(methodB)

      if class_addMethod(forClass, selectorA, impB, argsTypeB) {
        class_replaceMethod(forClass, selectorB, impA, argsTypeA)
      } else {
        method_exchangeImplementations(methodA, methodB)
      }
    }
  }

  static func resourcesBundle() -> Bundle? {
    let frameworkBundle = Bundle(for: EXDevLauncherUtils.self)

    guard let resourcesBundleUrl = frameworkBundle.url(forResource: "EXDevLauncher", withExtension: "bundle") else {
      return nil
    }
    return Bundle(url: resourcesBundleUrl)
  }
}
