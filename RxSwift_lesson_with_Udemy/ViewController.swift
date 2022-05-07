//
//  ViewController.swift
//  RxSwift_lesson_with_Udemy
//
//  Created by kudo koki on 2022/05/07.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var colorNameLabel: UILabel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nc = segue.destination as? UINavigationController,
              let ccvc = nc.viewControllers.first as? ColorCollectionViewController else {
                  fatalError("遷移失敗") }

        ccvc.selectedColourObservable.subscribe(onNext: { [weak self] colour in
            self?.view.backgroundColor = colour.color
            self?.colorNameLabel.text = colour.name
        }).disposed(by: disposeBag)
    }
}

