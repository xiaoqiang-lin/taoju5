//
//  Taoju5AMapView.swift
//  Runner
//
//  Created by 林小强 on 2021/4/3.
//

import Foundation



class Taoju5AMapController: UIViewController,MAMapViewDelegate,AMapSearchDelegate{
    
    var isLocated: Bool = false
    var mapView: MAMapView!
    var search:AMapSearchAPI!
    override func viewDidLoad() {
        AMapServices.shared()?.enableHTTPS=true
        search = AMapSearchAPI()
        search.delegate=self
        mapView = MAMapView.init(frame: self.view.bounds)
        mapView.delegate=self
        mapView.zoomLevel=17
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        self.view.addSubview(mapView)
    }
    
        
    
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        if !updatingLocation {
              return
          }
          if userLocation.location.horizontalAccuracy < 0 {
              return
          }
        
        if !self.isLocated{
            self.isLocated=true
            self.mapView.centerCoordinate = userLocation.location.coordinate
            self.searchAround(at: userLocation.location.coordinate)
        }
    }
    
    func mapView(_ mapView: MAMapView!, regionDidChangeAnimated animated: Bool) {
        self.searchAround(at: self.mapView.centerCoordinate)
    }
    
    func searchAround(at coordinate: CLLocationCoordinate2D) {
        self.searchReGeocode(withCoordinate: coordinate)
        self.searchPOI(withCoordinate: coordinate)
        
    }
    
    func searchPOI(withCoordinate coord: CLLocationCoordinate2D) {
        
        let request = AMapPOIAroundSearchRequest()
               request.location = AMapGeoPoint.location(withLatitude: CGFloat(coord.latitude), longitude: CGFloat(coord.longitude))
               request.radius = 1000
        request.sortrule = 0
        request.page=1
        self.search.aMapPOIAroundSearch(request)
    }
    
    func searchReGeocode(withCoordinate coord: CLLocationCoordinate2D){
        let request = AMapReGeocodeSearchRequest()
               request.location = AMapGeoPoint.location(withLatitude: CGFloat(coord.latitude), longitude: CGFloat(coord.longitude))
               request.requireExtension = true
               self.search.aMapReGoecodeSearch(request)
    }
    
    
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        if response.count==0{
            print("暂无数据")
        }
    }
    
    
    func onReGeocodeSearchDone(_ request: AMapReGeocodeSearchRequest!, response: AMapReGeocodeSearchResponse!) {
        if response.regeocode != nil{
            print(response.regeocode.formattedAddress)
        }
    }
    
    
    
    
    
}
class Taoju5AMapViewFactory:NSObject, FlutterPlatformViewFactory{
   
  

    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        
        return Taoju5AMapView(frame,viewId: viewId,args: args)
    }
    
}


class Taoju5AMapView: NSObject, FlutterPlatformView,AMapSearchDelegate {
    let frame:CGRect
    let viewId:Int64
    
    init(_ frame:CGRect,viewId:Int64,args:Any){
        self.frame=frame
        self.viewId=viewId
    }
    func view() -> UIView {
        let amap = Taoju5AMapController()
        
//        let mapView = MAMapView.init(frame: frame)
//        mapView.delegate=self
//
//        mapView.showsUserLocation = true
//        mapView.userTrackingMode = .follow
//
//        let search = AMapSearchAPI()
//        search?.delegate = self
        return amap.view
    }
    
    
}
