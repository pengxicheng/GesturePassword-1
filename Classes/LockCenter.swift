//
//  Copyright © 2016年 xiAo_Ju. All rights reserved.
//

public let LockManager = LockCenter.shared

open class LockCenter {
    open var options = LockOptions()

    var storage: Storagable = LockUserDefaults()

    open static let shared = LockCenter()
    // 私有化构造方法，阻止其他对象使用这个类的默认的'()'构造方法
    fileprivate init() {}

    open func hasPassword(for passwordKeySuffix: String? = nil) -> Bool {
        return storage.str(forKey: PASSWORD_KEY + (passwordKeySuffix ?? options.passwordKeySuffix)) != nil
    }

    open func removePassword(for passwordKeySuffix: String? = nil) {
        storage.removeValue(forKey: PASSWORD_KEY + (passwordKeySuffix ?? options.passwordKeySuffix))
    }

    open func showSettingLockController(in controller: UIViewController, success: controllerHandle? = nil) {
        controller.present(LockMainNav(rootViewController: SetPasswordController()), animated: true, completion: nil)
//        let lockVC = self.lockVC(SetPasswordController(), title: options.settingTittle, type: .set, success: success)
//        lockVC.success = success
    }

    open func showVerifyLockController(in controller: UIViewController, success: controllerHandle? = nil, forget: controllerHandle? = nil, overrunTimes: controllerHandle? = nil) {
        
        controller.present(LockMainNav(rootViewController: VerifyPasswordController()), animated: true, completion: nil)
        
//        let lockVC = self.lockVC(VerifyPasswordController(), title: options.verifyPassword, type: .verify, success: success)
//        lockVC.success = success
//        lockVC.forget = forget
//        lockVC.overrunTimes = overrunTimes
    }

    open func showModifyLockController(in controller: UIViewController, success: controllerHandle? = nil, forget: controllerHandle? = nil) {
//        let lockVC = self.lockVC(controller, title: options.modifyPassword, type: .modify, success: success)
//        lockVC.forget = forget
    }
}
