
import UIKit
class WeatherViewController: UIViewController {

   var weather = Data()
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var WeatherIcon: UIImageView!
    @IBOutlet weak var WeatherStatus: UILabel!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
       weather.downloadData {
           self.UpdateData()
       }

   }
   
   func UpdateData() {
       Date.text = weather.date
       Temperature.text = "\(weather.temp)"
       Location.text = weather.location
       WeatherStatus.text = weather.weather
       WeatherIcon.image = UIImage(named: weather.weather)
   }
}
