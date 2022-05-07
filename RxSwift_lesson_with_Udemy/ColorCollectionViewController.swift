//
//  ColorCollectionViewController.swift
//  RxSwift_lesson_with_Udemy
//
//  Created by kudo koki on 2022/05/07.
//

import UIKit
import RxSwift

class ColorCollectionViewController: UICollectionViewController {

    private let colours = [
        Colour(name: "red", color: UIColor.red),
        Colour(name: "orange", color: UIColor.orange),
        Colour(name: "yellow", color: UIColor.yellow),
        Colour(name: "green", color: UIColor.green),
        Colour(name: "blue", color: UIColor.blue),
        Colour(name: "purple", color: UIColor.purple),
        Colour(name: "systemPink", color: UIColor.systemPink),
        Colour(name: "gray", color: UIColor.gray),
        Colour(name: "brown", color: UIColor.brown),
        Colour(name: "cyan", color: UIColor.cyan),
        Colour(name: "magenta", color: UIColor.magenta),
        Colour(name: "darkGray", color: UIColor.darkGray)
    ]

    // 選択したColourクラスを購読するSubject
    let subject = PublishSubject<Colour>()
    /*
     外部からonNext/onError/onCompletedを読み込むのを防ぐために
     Obserbableに変換した変数を作る。これが外部で呼び出される。
     */
    var selectedColourObservable: Observable<Colour> {
        return subject.asObservable()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ColorCollectionViewController {
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colours.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellInfo.reuseIdentifier, for: indexPath) as? ColorCollectionViewCell else {
            fatalError("Cellの取得失敗")
        }

        cell.backgroundColor = colours[indexPath.row].color
        cell.colorName.text = colours[indexPath.row].name

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        subject.onNext(colours[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

extension ColorCollectionViewController: UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.view.bounds.width / 3 - 10
        return CGSize(width: size, height: size)
    }
}
