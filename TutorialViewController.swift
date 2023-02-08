//
//  FaqTutorialViewController.swift
//  Guilda
//
//  Created by rodolfo silva on 25/08/22.
//

import UIKit

class TutorialViewController: GuildaUIViewController {
    
    private let bannerWelcomeCell = String(describing: TutorialWelcomeCollectionViewCell.self)
    private let bannerContentCell = String(describing: TutorialContentCollectionViewCell.self)
    
    @IBOutlet weak var firstButton: UIButton! {
        didSet {
            firstButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    
    @IBOutlet weak var secondButton: UIButton! {
        didSet {
            secondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    
    @IBOutlet weak var arrowReturnImage: UIImageView!
    @IBOutlet weak var navBarTitle: UILabel! {
        didSet {
            navBarTitle.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    var tabBarToSend: UITabBarController?
    
    var screenNumber = 0
    
    @IBOutlet weak var headerBackgroundView: UIView!
    
    @IBOutlet weak var shadowTopView: UIView!
    
    @IBOutlet weak var tutorialCollectionView: UICollectionView!{
        didSet {
            tutorialCollectionView.register(UINib(nibName: bannerWelcomeCell, bundle: nil), forCellWithReuseIdentifier: bannerWelcomeCell)
            tutorialCollectionView.register(UINib(nibName: bannerContentCell, bundle: nil), forCellWithReuseIdentifier: bannerContentCell)
            tutorialCollectionView.backgroundColor = .clear
            tutorialCollectionView.delegate = self
            tutorialCollectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var tutorialPageView: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tutorialPageView.numberOfPages = 6
        self.showAndHideNavigationBar(hide: true, headerColor: "#A1BDCA")
        
        self.shadowTopView.layer.shadowOpacity = 0.5
        self.shadowTopView.layer.shadowColor = UIColor.black.cgColor
        self.shadowTopView.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
    }
    
    @IBAction func clicksampeclose(_ sender: UIButton) {
        if self.screenNumber == 5 {
            self.tabBarToSend?.selectedIndex = 2
        }
        self.dismiss(animated: false, completion: nil)
    }
    
    private func showAndHideNavigationBar(hide: Bool, titleNavBar: String = "", headerColor: String = "#FFFFFF") {
        self.arrowReturnImage.isHidden = hide
        self.navBarTitle.text = titleNavBar
        self.headerBackgroundView.backgroundColor = .white
    }
    
    @IBAction func returnButtonClick(_ sender: UIButton) {
        self.returnOnePage()
    }
    
    private func returnOnePage() {
        if self.screenNumber != 0 {
            self.screenNumber -= 1
            
            self.tutorialPageView.currentPage = screenNumber
            
            let visibleCell = tutorialCollectionView.visibleCells
            let indexPath: IndexPath? = tutorialCollectionView.indexPath(for: visibleCell[0])
            let indexPath1: IndexPath?
            indexPath1 = IndexPath.init(row: (indexPath?.row)! - 1, section: (indexPath?.section)!)
            
            tutorialCollectionView.scrollToItem(at: indexPath1!, at: .left, animated: true)
            self.pageToLayout(pageNumber: self.screenNumber)
        }
    }
    
    private func goToNextPage() {
        if self.screenNumber != 5 {
            self.screenNumber += 1
            
            self.tutorialPageView.currentPage = screenNumber
            
            let visibleCell = tutorialCollectionView.visibleCells
            let indexPath: IndexPath? = tutorialCollectionView.indexPath(for: visibleCell[0])
            let indexPath1: IndexPath?
            indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
            
            tutorialCollectionView.scrollToItem(at: indexPath1!, at: .right, animated: true)
            self.pageToLayout(pageNumber: self.screenNumber)
        } else {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    private func pageToLayout(pageNumber: Int) {
        switch pageNumber {
        case 0:
            //"welcome page"
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: true, titleNavBar: "", headerColor: "#A1BDCA")
            self.screenNumber = 0
        case 1:
            //"Page 1"
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: false, titleNavBar: "TITLE 1")
            self.screenNumber = 1
        case 2:
            //"Page 2""
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: false, titleNavBar: "TITLE 2")
            self.screenNumber = 2
        case 3:
            //"Page 3"
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: false, titleNavBar: "TITLE 3")
            self.screenNumber = 3
        case 4:
            //"Page 4"
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: false, titleNavBar: "TITLE 4")
            self.screenNumber = 4
        case 5:
            //"Page 5"
            self.firstButton.setTitleWithoutAnimation(title: "NEXT")
            self.secondButton.setTitleWithoutAnimation(title: "SKIP")
            self.showAndHideNavigationBar(hide: false, titleNavBar: "TITLE 5")
            self.screenNumber = 5
        default:
            print("teste")
        }
    }
    
    @IBAction func clickOnGoNextButton(_ sender: UIButton) {
        self.goToNextPage()
    }
}

extension TutorialViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == tutorialCollectionView {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            tutorialPageView.currentPage = Int(pageNumber)
            self.pageToLayout(pageNumber: Int(pageNumber))
        }
    }
}

extension TutorialViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerWelcomeCell, for: indexPath) as? TutorialWelcomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            
            switch indexPath.row {
            case 1:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.backgroundImage.image = UIImage(named: "background")
                cell.cellImage.image = UIImage(named: "bg_router")
                cell.contentText.text = "Description of the first image"
                
                return cell
            case 2:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.backgroundImage.image = UIImage(named: "background")
                cell.cellImage.image = UIImage(named: "bg_intro")
                cell.contentText.text = "Description of the second image"
                return cell
            case 3:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.backgroundImage.image = UIImage(named: "background")
                cell.cellImage.image = UIImage(named: "bg_direct")
                cell.contentText.text = "Description of the third image"
                return cell
            case 4:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.backgroundImage.image = UIImage(named: "background")
                cell.cellImage.image = UIImage(named: "bg_recharge")
                cell.contentText.text = "Description of the fourth image"
                return cell
            case 5:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.backgroundImage.image = UIImage(named: "background")
                cell.cellImage.image = UIImage(named: "bg_router")
                cell.contentText.text = "Description of the fifth image"
                return cell
            default:
                guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? TutorialContentCollectionViewCell else {
                    return UICollectionViewCell()
                }
                return cell
            }
            
            /*if indexPath.row == 1 {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             cell.backgroundImage.image = .appImage(.tutorial_orangewhite_background, bundle: Bundle.driverFaqBundle())
             cell.cellImage.image = .appImage(.tutorial_cell_home, bundle: Bundle.driverFaqBundle())
             cell.contentText.text = LocalizableStrings.onboardingPayBill.localize()
             
             
             return cell
             } else if indexPath.row == 2 {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             
             
             cell.backgroundImage.image = .appImage(.tutorial_yellowwhite_background, bundle: Bundle.driverFaqBundle())
             cell.cellImage.image = .appImage(.tutorial_cell_gains, bundle: Bundle.driverFaqBundle())
             cell.contentText.text = LocalizableStrings.onboardingExtract.localize()
             return cell
             } else if indexPath.row == 3 {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             
             
             cell.backgroundImage.image = .appImage(.tutorial_purplewhite_background, bundle: Bundle.driverFaqBundle())
             cell.cellImage.image = .appImage(.tutorial_cell_where, bundle: Bundle.driverFaqBundle())
             cell.contentText.text = LocalizableStrings.onboardingAccessCardArea.localize()
             return cell
             } else if indexPath.row == 4 {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             
             
             cell.backgroundImage.image = .appImage(.tutorial_greenwhite_background, bundle: Bundle.driverFaqBundle())
             cell.cellImage.image = .appImage(.tutorial_cell_virtualcard, bundle: Bundle.driverFaqBundle())
             cell.contentText.text = LocalizableStrings.onboardingGenerateVirtualCard.localize()
             return cell
             } else if indexPath.row == 5 {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             
             
             cell.backgroundImage.image = .appImage(.tutorial_bluewhite_background, bundle: Bundle.driverFaqBundle())
             cell.cellImage.image = .appImage(.tutorial_cell_digitalwithdraw, bundle: Bundle.driverFaqBundle())
             cell.contentText.text = LocalizableStrings.onboardingWithdrawUberAccount.localize()
             return cell
             } else {
             guard let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: bannerContentCell, for: indexPath) as? FaqTutorialContentCollectionViewCell else {
             return UICollectionViewCell()
             }
             return cell
             }*/
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case tutorialCollectionView:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
}

extension UIButton {
    func setTitleWithoutAnimation(title: String?) {
        UIView.setAnimationsEnabled(false)
        
        setTitle(title, for: .normal)
        
        layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
    
}
