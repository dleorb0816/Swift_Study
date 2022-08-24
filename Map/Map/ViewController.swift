//
//  ViewController.swift
//  Map
//
//  Created by 이대규 on 2022/08/16.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""  // 위치정보를 표시할 레이블에는 아직 특별히 표시할 필요가 없으므로 공백으로 둔다
        lblLocationInfo2.text = ""  // 위치정보를 표시할 레이블에는 아직 특별히 표시할 필요가 없으므로 공백으로 둔다
        locationManager.delegate = self // 상수 locationManager의 델리게이트를 self로 설정한다
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도를 최고로 설정한다.
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구한다.
        locationManager.startUpdatingLocation() //  위치 업데이트를 시작한다.
        myMap.showsUserLocation = true  // 위치 보기값을 true로 한다.
        
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)   //  위도 값과 경도 값을 매개변수로 하여 CLLocationCoordinate2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받습니다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //  범의 값을 매개변수로 하여 MKCoordinatepanMake 함수를 호출하고, 리턴 값을 spanValue로 받는다
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)    // pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴값을 pRegion으로 받는다
        myMap.setRegion(pRegion, animated: true)    // pRegion값을 매개변수로 하여 myMap.setRegion함수를 호출한다
        return pLocation
    }
    
    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudValue: CLLocationDegrees,
       longitudeValue : CLLocationDegrees, delta span :Double, title strTitle:
                       String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last  // 위치가 업데이트 되면 먼저 마지막 위치 값을 찾아낸다
       _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)    //  마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출한다. 이때 delta 값은 지도의 크기를 정하는데, 값이 작을스록 확대되는 효과가 있습니다. delta를 0.01로 하였으니 1의 값보다 지도를 100배로 확대해서 보여줄 것입니다.
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks,error) -> Void in
            let pm = placemarks!.first  // placemarks 값의 첫 부분만 pm 살수로 대입한다.
            let country = pm!.country   // pm상수에서 나라 값을 country 상수에 대입한다.
            var address:String = country!   // 문자열 address에 country 상수의 값을 대입한다.
            if pm!.locality != nil {    // pm 상수에서 지역 값이 존재하면 address 문자열에 추가합니다.
                address += " "
                address += pm!.thoroughfare!
            }
            if pm!.thoroughfare != nil {    // pm 상수에서 도로 값이 존재하면 address 문자열에 추가한다.
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"    //  레이블에 "현재 위치" 텍스트를 표시한다.
            self.lblLocationInfo2.text = address    //  레이블에 address 문자열의 값을 표시한다.
            
        })
        
        locationManager.stopUpdatingLocation()  //  마지막으로 위치가 업데이트 되는것을 멈추게 한다.
    }
    
    @IBAction func sgChageLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            // 폴리텍대학 표시
            setAnnotation(latitudValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉 캠퍼스", subtitle: "강원도 강릉 남초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            // 이지스퍼블리싱 표시
            setAnnotation(latitudValue: 37.751853, longitudeValue: 126.914066, delta: 0.1, title: "한국폴리텍대학 강릉 캠퍼스", subtitle: "강원도 강릉 남초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        }
    }
    
}

