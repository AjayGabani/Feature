//
//  VehicleDetailsPagesVC.swift
//  Vehicles
//
//  Created by Ajay Gabani on 19/11/22.
//

import UIKit

class VehicleDetailsPagesVC: UIPageViewController, UIPageViewControllerDataSource {
    
    private var objCommonFunctions = CommonFunctions()
    var objVehicle: Vehicle!
    var arrPageViewControllersList = [UIViewController]()
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        objCommonFunctions.setNavigationControllerApperance(title: objVehicle.makeAndModel!, forViewController: self)
        
        self.view.backgroundColor = objCommonFunctions.getViewBackGroundColor()
        let objDetail = storyboard?.instantiateViewController(withIdentifier: "VehicleDetailsVC") as! VehicleDetailsVC
        objDetail.objVehicle = self.objVehicle
        let objEmissionDetail = storyboard?.instantiateViewController(withIdentifier: "VehicleCarbonEmissionDetailsVC") as! VehicleCarbonEmissionDetailsVC
        objEmissionDetail.objVehicle = self.objVehicle
        
        arrPageViewControllersList = [objDetail,
                                    objEmissionDetail]
        setViewControllers([arrPageViewControllersList[0]], direction: .forward, animated: true)
        dataSource = self
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
    }
    
    //MARK: Pageview controller datasource methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = arrPageViewControllersList.firstIndex(of: viewController)!
        if indexOfCurrentPageViewController == 0 {
            return nil
        } else {
            return arrPageViewControllersList[indexOfCurrentPageViewController - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = arrPageViewControllersList.firstIndex(of: viewController)!
        if indexOfCurrentPageViewController == arrPageViewControllersList.count - 1 {
            return nil
        } else {
            return arrPageViewControllersList[indexOfCurrentPageViewController + 1]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrPageViewControllersList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let currentVC = self.viewControllers!.first {
            let currentIndex = arrPageViewControllersList.firstIndex(of: currentVC)
            return currentIndex!
        }else{
            return 0
        }
    }
}
