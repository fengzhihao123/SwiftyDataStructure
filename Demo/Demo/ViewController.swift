//
//  ViewController.swift
//  Demo
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alertVC = Alert(title: "删除", message: "确认删除？") { () -> [Action] in
            ForIn(["删除", "取消"]) { string in
                Action.default(string) { print(string) }
            }
        }
        present(alertVC, animated: true, completion: nil)
    }
}

struct Action {
    let title: String
    let style: UIAlertAction.Style
    let action: () -> Void
}

extension Action {
    static func `default`(_ title: String, action: @escaping () -> Void) -> [Action] {
        return [Action(title: title, style: .default, action: action)]
    }

    static func destructive(_ title: String, action: @escaping () -> Void) -> [Action] {
        return [Action(title: title, style: .destructive, action: action)]
    }

    static func cancel(_ title: String, action: @escaping () -> Void = {}) -> [Action] {
        return [Action(title: title, style: .cancel, action: action)]
    }
}

@_functionBuilder
struct ActionBuilder {
    typealias Component = [Action]
    
    static func buildBlock(_ children: Component...) -> Component {
        return children.flatMap { $0 }
    }
    
//    static func buildIf(_ component: Component?) -> Component {
//        return component ?? []
//    }
    
    static func buildEither(first component: Component) -> Component {
        return component
    }

    static func buildEither(second component: Component) -> Component {
        return component
    }
}

extension ViewController {
    func makeAlertController(title: String,
                             message: String,
                             style: UIAlertController.Style,
                             actions: [Action]) -> UIAlertController {
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        for action in actions {
            let uiAction = UIAlertAction(title: action.title, style: action.style) { _ in
                action.action()
            }
            controller.addAction(uiAction)
        }
        return controller
    }
    
    func Alert(title: String,
               message: String,
               @ActionBuilder _ makeActions: () -> [Action]) -> UIAlertController {
        makeAlertController(title: title,
                            message: message,
                            style: .alert,
                            actions: makeActions())
    }
    
    func ForIn<S: Sequence>(
        _ sequence: S,
        @ActionBuilder makeActions: (S.Element) -> [Action]
    ) -> [Action] {

        return sequence
            .map(makeActions) // of type [[Action]]
            .flatMap { $0 }   // of type [Action]
    }
}
