//
//  ViewController.swift
//  FsCalendar01
//
//  Created by SooHoon on 2021/07/28.
//

import UIKit
import FSCalendar

let formatter = DateFormatter()
var selectDate01 = ""
//var events: Array<Date> = []

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var lblSchedule: UILabel!
    
    var selectDateType = formatter.date(from: selectDate01)
    var events: Array<Date> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
//        // 스와이프 스크롤 작동 여부 ( 활성화하면 좌측 우측 상단에 다음달 살짝 보임, 비활성화하면 사라짐 )
//        calendar.scrollEnabled = true
//        // 스와이프 스크롤 방향 ( 버티칼로 스와이프 설정하면 좌측 우측 상단 다음달 표시 없어짐, 호리젠탈은 보임 )
//        calendar.scrollDirection = .vertical
//
        calendarTextcolor()
        encoadingMonth()
        
        
        /*
         필요에 따라서 사용하기
         초기 세팅 >> 0.2 >> 1은 가장 선명하게
        // 년월에 흐릿하게 보이는 애들 없애기
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        */
        
        // extension
        calendar.delegate = self
        calendar.dataSource = self
        
    }// ViewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
       
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
//        events.append(selectDateType!)
        print("Reload")
        if events.contains(selectDateType!){
            print(events[0])
        }else{
            print("No Data")
        }
    }
    
    // 선택한 날짜 보내기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let detail = segue.destination as! AddViewController
            detail.receiveDay(selectDate01)
            events.append(selectDateType!)
           
            print(events[0])
            
        }
    }
    
    // 달력 색상 속성
    func calendarTextcolor(){
        // 달력의 평일 날짜 색깔
        calendar.appearance.titleDefaultColor = .black
        // 달력의 토,일 날짜 색깔
        calendar.appearance.titleWeekendColor = .red
        // 달력의 맨 위의 년도, 월의 색깔
        calendar.appearance.headerTitleColor = .systemPink
        // 달력의 요일 글자 색깔
        calendar.appearance.weekdayTextColor = .orange
    }

    // 달력의 초기 세팅
    func encoadingMonth(){
        // 달력의 년월 글자 바꾸기
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        // 달력의 요일 글자 바꾸는 방법 1
        calendar.locale = Locale(identifier: "ko_KR")
//        // 달력의 요일 글자 바꾸는 방법 2
//        calendar.calendarWeekdayView.weekdayLabels[0].text = "일"
//        calendar.calendarWeekdayView.weekdayLabels[1].text = "월"
//        calendar.calendarWeekdayView.weekdayLabels[2].text = "화"
//        calendar.calendarWeekdayView.weekdayLabels[3].text = "수"
//        calendar.calendarWeekdayView.weekdayLabels[4].text = "목"
//        calendar.calendarWeekdayView.weekdayLabels[5].text = "금"
//        calendar.calendarWeekdayView.weekdayLabels[6].text = "토"
    }
    
    func setUpEvents() {
        
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd"
    
    }

    
} //ViewController

extension ViewController: FSCalendarDelegate, FSCalendarDataSource{
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(formatter.string(from: date) + " 선택됨")
        selectDate01 = formatter.string(from: date)
        selectDateType = formatter.date(from: selectDate01)
        lblSchedule.text = selectDate01
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if events.contains(date) {
            return 1
        } else {
            return 0
        }
    }
    
    /* 특정 날짜에 텍스트 표시하기
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
            
            switch formatter.string(from: date) {
            case formatter.string(from: Date()):
                return "오늘"
            case "2021-07-22":
                return "출근"
            case "2021-08-23":
                return "지각"
            case "2021-08-24":
                return "결근"
            default:
                return nil
            }
        }
    */

    
}

