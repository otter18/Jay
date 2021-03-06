//
//  GetVC.swift
//  Jay
//
//  Created by Vova on 18.07.2020.
//  Copyright © 2020 Fetch Development. All rights reserved.
//

import UIKit

func getDetailsVC(id: String) -> UIViewController {
    let data = DataProvider.id2cell(id: id)
    
    switch data.type {
    case .habit:
        let detailsVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "TodayHabitCardView")
                as? TodayHabitCardView
        
        detailsVC!.update(idCell: id, data: data.obj as! JayData.HabitLocal)
        return detailsVC!
    case .reminder:
        let detailsVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ReminderDetailsViewController")
                as? ReminderDetailsViewController
        
        detailsVC?.reminder = data.obj as? JayData.Reminder
        return detailsVC!
    }
}
