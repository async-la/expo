import Quick
import Nimble

@testable import EXDevLauncher

class EXDevLauncherRCTBridgeTest: QuickSpec {
  @objc(RCTAllowModule)
  class RCTAllowModule: NSObject {}
  @objc(NotAllowModule)
  class NotAllowModule: NSObject {}
  @objc(DevMenuModule)
  class DevMenuModule: NSObject {}

  override func spec() {
    it("should be connected with EXDevLauncherRCTCxxBridge") {
      let bridge = EXDevLauncherRCTBridge(delegate: nil, launchOptions: nil)!

      expect(bridge.bridgeClass()).to(be(EXDevLauncherRCTCxxBridge.self))
    }

    it("should be able to filter non essential modules") {
      let cxxBridge = EXDevLauncherRCTBridge(delegate: nil, launchOptions: nil)!.batched as! EXDevLauncherRCTCxxBridge

      let filteredModules = cxxBridge.filterModuleList([RCTAllowModule.self, NotAllowModule.self, DevMenuModule.self])

      expect(filteredModules.count).to(equal(2))
      expect(filteredModules[0]).to(be(RCTAllowModule.self))
      expect(filteredModules[1]).to(be(DevMenuModule.self))
    }
  }
}
