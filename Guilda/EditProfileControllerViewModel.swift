//
//  EditProfileControllerViewModel.swift
//  Guilda
//
//  Created by rodolfo silva on 05/09/22.
//
protocol EditProfileControllerViewModelCoordinatorDelegate: AnyObject {}

protocol EditProfileControllerViewModelDelegatete: AnyObject {
    func registerCompleteDidFinishSuccess()
    func registerCompleteDidFinishError()
}

class EditProfileControllerViewModel {
    
    // MARK: - Var's
    var coordinatorDelegate: EditProfileControllerViewModelCoordinatorDelegate?
    weak var viewDelegate: EditProfileControllerViewModelDelegatete?
    
    func buttonSave() {
        debugPrint("button save here")
    }

}
