//
//  ViewController.swift
//  CountryFacts
//
//  Created by Hector Salgado on 4/17/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVPlayer?
    
    @IBOutlet weak var imageCountry: UIImageView!
    
    @IBOutlet weak var addFacts: UILabel!
    
    @IBOutlet weak var countryListText: UITextField!
    
    @IBOutlet weak var videoLayer: UIView!
    
    let countries = ["Afghanistan", "Albania", "Algeria","Andorra", "Angola","Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Brazil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde",  "Central African Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Congo, the Democratic Republic of the", "Costa Rica", "Cote d'Ivoire", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France",  "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "North Korea", "South Korea", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Morocco", "Mozambique", "Myanmar","Montenegro", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Norway","Northern Ireland", "Oman", "Pakistan", "Palau","Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Saudi Arabia", "Senegal", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan","South Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "USA", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Uganda", "Ukraine", "United Arab Emirates","Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (U.S.)", "Wales", "Yemen", "Zambia", "Zimbabwe"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFacts.numberOfLines = 0
        addFacts.layer.borderWidth = 2.0
        addFacts.layer.cornerRadius = 6
        playVideo()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countryListText.inputView = pickerView
    
    }
    func playVideo() {
            guard let path = Bundle.main.path(forResource: "earth", ofType: "mp4") else {
                return
            }

            let player = AVPlayer(url: URL(fileURLWithPath: path))
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.bounds
            playerLayer.videoGravity = .resizeAspectFill
            self.videoLayer.layer.addSublayer(playerLayer)

            player.play()

        videoLayer.bringSubviewToFront(addFacts)
        videoLayer.bringSubviewToFront(countryListText)
        videoLayer.bringSubviewToFront(imageCountry)
        videoLayer.bringSubviewToFront(pickerView)

    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
               countryListText.resignFirstResponder()
               countryListText.text = countries[row]
        if countries[row] == "Afghanistan" {
            imageCountry.image = UIImage(named: "Afghan")
            addFacts.text = "Capital: Kabul\n Continent: Asia"
        }
        if countries[row] == "Algeria" {
            imageCountry.image = UIImage(named: "alg")
            addFacts.text = "Capital: Algiers\n Continent: Africa"
        }
        if countries[row] == "Albania" {
            imageCountry.image = UIImage(named: "al")
            addFacts.text = "Capital: Tirana\n Continent: Europe"

        }
        if countries[row] == "Andorra" {
            imageCountry.image = UIImage(named: "ad")
            addFacts.text = "Capital: Andorra La Vella\n Continent: Europe"

        }
        if countries[row] == "Angola" {
            imageCountry.image = UIImage(named: "ao")
            addFacts.text = "Capital: Luanda\n Continent: Africa"

        }
        if countries[row] == "Azerbaijan" {
            imageCountry.image = UIImage(named: "az")
            addFacts.text = "Capital: Baku\n Continent: Asia"

        }
        if countries[row] == "Antigua and Barbuda" {
            imageCountry.image = UIImage(named: "ag")
            addFacts.text = "Capital: Saint Johns\n Continent: North America"

        }
        if countries[row] == "Armenia" {
            imageCountry.image = UIImage(named: "am")
            addFacts.text = "Capital: Yerevan\n Continent: Europe"

        }
        if countries[row] == "Austria" {
            imageCountry.image = UIImage(named: "at")
            addFacts.text = "Capital: Vienna\n Continent: Europe"

        }
        if countries[row] == "Australia" {
            imageCountry.image = UIImage(named: "au")
            addFacts.text = "Capital: Canberra\n Continent: Australia"

        }
        if countries[row] == "Argentina" {
            imageCountry.image = UIImage(named: "ar")
            addFacts.text = "Capital: Buenos Aires\n Continent: South America"

        }
        if countries[row] == "Bosnia and Herzegowina" {
            imageCountry.image = UIImage(named: "ba")
            addFacts.text = "Capital: Sarajevo\n Continent: Europe"

        }
        if countries[row] == "Bangladesh" {
            imageCountry.image = UIImage(named: "bd")
            addFacts.text = "Capital: Dhaka\n Continent: Asia"

        }
        if countries[row] == "Barbados" {
            imageCountry.image = UIImage(named: "barbs")
            addFacts.text = "Capital: Bridgetown\n Continent: North America"

        }
        if countries[row] == "Belgium" {
            imageCountry.image = UIImage(named: "be")
            addFacts.text = "Capital: Brussels\n Continent: Europe"

        }
        if countries[row] == "Burkina Faso" {
            imageCountry.image = UIImage(named: "bf")
            addFacts.text = "Capital: Ouagadougou\n Continent: Africa"

        }
        if countries[row] == "Bulgaria" {
            imageCountry.image = UIImage(named: "bg")
            addFacts.text = "Capital: Sofia\n Continent: Europe"

        }
        if countries[row] == "Bahrain" {
            imageCountry.image = UIImage(named: "bh")
            addFacts.text = "Capital: Manama\n Continent: Asia"

        }
        if countries[row] == "Burundi" {
            imageCountry.image = UIImage(named: "bi")
            addFacts.text = "Capital: Bujumbura\n Continent: Africa"

        }
        if countries[row] == "Benin" {
            imageCountry.image = UIImage(named: "bj")
            addFacts.text = "Capital: Porto-Novo\n Continent: Africa"

        }
        if countries[row] == "Bermuda" {
            imageCountry.image = UIImage(named: "bm")
            addFacts.text = "Capital: Hamilton\n Continent: North America"

        }
        if countries[row] == "Brunei Darussalam" {
            imageCountry.image = UIImage(named: "bn")
            addFacts.text = "Capital: Bandar Seri Begawan\n Continent: Africa"

        }
        if countries[row] == "Bolivia" {
            imageCountry.image = UIImage(named: "bo")
            addFacts.text = "Capital: Sucre\n Continent: South America"

        }
        if countries[row] == "Brazil" {
            imageCountry.image = UIImage(named: "br")
            addFacts.text = "Capital: Brasília\n Continent: South America"

        }
        if countries[row] == "Bahamas" {
            imageCountry.image = UIImage(named: "bs")
            addFacts.text = "Capital: Nassau\n Continent: North America"

        }
        if countries[row] == "Bhutan" {
            imageCountry.image = UIImage(named: "bt")
            addFacts.text = "Capital: Thimphu\n Continent: Asia"

        }
        if countries[row] == "Botswana" {
            imageCountry.image = UIImage(named: "bw")
            addFacts.text = "Capital: Gaborone\n Continent: Africa"

        }
        if countries[row] == "Belarus" {
            imageCountry.image = UIImage(named: "by")
            addFacts.text = "Capital: Minsk\n Continent: Europe"

        }
        if countries[row] == "Belize" {
            imageCountry.image = UIImage(named: "bz")
            addFacts.text = "Capital: Belmopan\n Continent: North America"

        }
        if countries[row] == "Canada" {
            imageCountry.image = UIImage(named: "ca")
            addFacts.text = "Capital: Ottawa\n Continent: North America"

        }
        if countries[row] == "Cambodia" {
            imageCountry.image = UIImage(named: "cam")
            addFacts.text = "Capital: Phnom Penh\n Continent: North America"

        }
        if countries[row] == "Congo, the Democratic Republic of the" {
            imageCountry.image = UIImage(named: "cd")
            addFacts.text = "Capital: Kinshasa\n Continent: Africa"

        }
        if countries[row] == "Congo" {
            imageCountry.image = UIImage(named: "cg")
            addFacts.text = "Capital:  Brazzaville\n Continent: Africa"

        }
        if countries[row] == "Switzerland" {
            imageCountry.image = UIImage(named: "ch")
            addFacts.text = "Capital: Bern\n Continent: Europe"

        }
        if countries[row] == "Cote d'Ivoire" {
            imageCountry.image = UIImage(named: "ci")
            addFacts.text = "Capital: Yamoussoukro\n Continent: Africa"

        }
        if countries[row] == "Chile" {
            imageCountry.image = UIImage(named: "cl")
            addFacts.text = "Capital: Santiago\n Continent: South America"

        }
        if countries[row] == "Cameroon" {
            imageCountry.image = UIImage(named: "cm")
            addFacts.text = "Capital: Yaoundé\n Continent: Africa"

        }
        if countries[row] == "China" {
            imageCountry.image = UIImage(named: "cn")
            addFacts.text = "Capital: Beijing\n Continent: Asia"

        }
        if countries[row] == "Colombia" {
            imageCountry.image = UIImage(named: "co")
            addFacts.text = "Capital: Bogotá\n Continent: South America"

        }
        if countries[row] == "Costa Rica" {
            imageCountry.image = UIImage(named: "cr")
            addFacts.text = "Capital: San José\n Continent: North America"

        }
        if countries[row] == "Cuba" {
            imageCountry.image = UIImage(named: "cu")
            addFacts.text = "Capital: Havana\n Continent: North America"

        }
        if countries[row] == "Cape Verde" {
            imageCountry.image = UIImage(named: "cv")
            addFacts.text = "Capital: Praia\n Continent: Africa"

        }
        if countries[row] == "Cyprus" {
            imageCountry.image = UIImage(named: "cy")
            addFacts.text = "Capital: Nicosia\n Continent: Europe"

        }
        if countries[row] == "Czech Republic" {
            imageCountry.image = UIImage(named: "cz")
            addFacts.text = "Capital: Prague\n Continent: Europe"

        }
        if countries[row] == "Central African Republic" {
            imageCountry.image = UIImage(named: "car")
            addFacts.text = "Capital: Bangui\n Continent: Africa"

        }
        if countries[row] == "Chad" {
            imageCountry.image = UIImage(named: "td")
            addFacts.text = "Capital: N’Djamena\n Continent: Africa"

        }
        if countries[row] == "Croatia" {
            imageCountry.image = UIImage(named: "hr")
            addFacts.text = "Capital: Zagreb\n Continent: South America"

        }
        if countries[row] == "Germany" {
            imageCountry.image = UIImage(named: "de")
            addFacts.text = "Capital: Berlin\n Continent: Europe"

        }
        if countries[row] == "Djibouti" {
            imageCountry.image = UIImage(named: "dj")
            addFacts.text = "Capital: Djibouti-city\n Continent: Africa"

        }
        if countries[row] == "Denmark" {
            imageCountry.image = UIImage(named: "dk")
            addFacts.text = "Capital: Copenhagen\n Continent: Europe"

        }
        if countries[row] == "Dominica" {
            imageCountry.image = UIImage(named: "dm")
            addFacts.text = "Capital: Roseau\n Continent: North America"

        }
        if countries[row] == "Dominican Republic" {
            imageCountry.image = UIImage(named: "do")
            addFacts.text = "Capital: Santo Domingo\n Continent: North America"

        }
        if countries[row] == "Ecuador" {
            imageCountry.image = UIImage(named: "ec")
            addFacts.text = "Capital: Quito\n Continent: South America"

        }
        if countries[row] == "Estonia" {
            imageCountry.image = UIImage(named: "ee")
            addFacts.text = "Capital: Tallinn\n Continent: Europe"

        }
        if countries[row] == "Egypt" {
            imageCountry.image = UIImage(named: "eg")
            addFacts.text = "Capital: Cairo\n Continent: Africa"

        }
        if countries[row] == "Eritrea" {
            imageCountry.image = UIImage(named: "er")
            addFacts.text = "Capital: Asmara\n Continent: Africa"

        }
        if countries[row] == "Spain" {
            imageCountry.image = UIImage(named: "es")
            addFacts.text = "Capital: Madrid\n Continent: Europe"

        }
        if countries[row] == "Ethiopia" {
            imageCountry.image = UIImage(named: "et")
            addFacts.text = "Capital: Addis Ababa\n Continent: Africa"

        }
        if countries[row] == "Finland" {
            imageCountry.image = UIImage(named: "fi")
            addFacts.text = "Capital: Helsinki\n Continent: Europe"

        }
        if countries[row] == "Fiji" {
            imageCountry.image = UIImage(named: "fj")
            addFacts.text = "Capital: Suva\n Continent: Oceania"

        }
        if countries[row] == "Falkland Islands (Malvinas)" {
            imageCountry.image = UIImage(named: "fk")
            addFacts.text = "Capital: Stanley\n Continent: Oceania"

        }
        if countries[row] == "Faroe Islands" {
            imageCountry.image = UIImage(named: "fo")
            addFacts.text = "Capital: Tórshavn\n Continent: Europe"

        }
        if countries[row] == "France" {
            imageCountry.image = UIImage(named: "fr")
            addFacts.text = "Capital: Paris\n Continent: Europe"

        }
        if countries[row] == "Gambia" {
            imageCountry.image = UIImage(named: "ga")
            addFacts.text = "Capital: Banjul\n Continent: Africa"

        }
        if countries[row] == "England" {
            imageCountry.image = UIImage(named: "gb-eng")
            addFacts.text = "Capital: London\n Continent: Europe"

        }
        if countries[row] == "Northern Ireland" {
            imageCountry.image = UIImage(named: "gb-nir")
            addFacts.text = "Capital: Belfast\n Continent: Europe"

        }
        if countries[row] == "Grenada" {
            imageCountry.image = UIImage(named: "gd")
            addFacts.text = "Capital: St. George’s\n Continent: North America"

        }
        if countries[row] == "Georgia" {
            imageCountry.image = UIImage(named: "ge")
            addFacts.text = "Capital: Tbilisi\n Continent: Europe"

        }
        if countries[row] == "Ghana" {
            imageCountry.image = UIImage(named: "gh")
            addFacts.text = "Capital: Accra\n Continent: Africa"

        }
        if countries[row] == "Greenland" {
            imageCountry.image = UIImage(named: "gl")
            addFacts.text = "Capital: Nuuk\n Continent: Europe"

        }
        if countries[row] == "Greece" {
            imageCountry.image = UIImage(named: "gr")
            addFacts.text = "Capital: Athens\n Continent: Europe"

        }
        if countries[row] == "Gabon" {
            imageCountry.image = UIImage(named: "ga")
            addFacts.text = "Capital: Libreville\n Continent: Africa"

        }
        if countries[row] == "Gambia" {
            imageCountry.image = UIImage(named: "gm")
            addFacts.text = "Capital: Banjul\n Continent: Africa"

        }
        if countries[row] == "Gibraltar" {
            imageCountry.image = UIImage(named: "gi")
            addFacts.text = "Capital: Gibraltar\n Continent: Asia"

        }
        if countries[row] == "Guadeloupe" {
            imageCountry.image = UIImage(named: "gp")
            addFacts.text = "Capital: Basse-Terre\n Continent: North America"

        }
        if countries[row] == "Guam" {
            imageCountry.image = UIImage(named: "gu")
            addFacts.text = "Capital: Hagatna\n Continent: Asia"

        }
        if countries[row] == "Guatemala" {
            imageCountry.image = UIImage(named: "gt")
            addFacts.text = "Capital: Guatemala City\n Continent: North America"

        }
        if countries[row] == "Guyana" {
            imageCountry.image = UIImage(named: "gy")
            addFacts.text = "Capital: Georgetown\n Continent: South America"

        }
        if countries[row] == "Guinea" {
            imageCountry.image = UIImage(named: "gn")
            addFacts.text = "Capital: Conakry\n Continent: Africa"

        }
        if countries[row] == "Guinea-Bissau" {
            imageCountry.image = UIImage(named: "gw")
            addFacts.text = "Capital: Bissau\n Continent: Africa"

        }
        if countries[row] == "Haiti" {
            imageCountry.image = UIImage(named: "ht")
            addFacts.text = "Capital: Port-au-prince\n Continent: North America"

        }
        if countries[row] == "Honduras" {
            imageCountry.image = UIImage(named: "hn")
            addFacts.text = "Capital: Tegucigalpa\n Continent: North America"

        }
        if countries[row] == "Hong Kong" {
            imageCountry.image = UIImage(named: "hk")
            addFacts.text = "Capital: Hong Kong City\n Continent: Asia"

        }
        if countries[row] == "Hungary" {
            imageCountry.image = UIImage(named: "hu")
            addFacts.text = "Capital: Budapest\n Continent: Asia"

        }
        if countries[row] == "Iceland" {
            imageCountry.image = UIImage(named: "is")
            addFacts.text = "Capital: Reykjavík\n Continent: Europe"

        }
        if countries[row] == "India" {
            imageCountry.image = UIImage(named: "in")
            addFacts.text = "Capital: New Delhi\n Continent: Asia"

        }
        if countries[row] == "Indonesia" {
            imageCountry.image = UIImage(named: "id")
            addFacts.text = "Capital: Jakarta\n Continent: Asia"

        }
        if countries[row] == "Iran" {
            imageCountry.image = UIImage(named: "ir")
            addFacts.text = "Capital: Tehran\n Continent: Asia"

        }
        if countries[row] == "Iraq" {
            imageCountry.image = UIImage(named: "iq")
            addFacts.text = "Capital: Baghdad\n Continent: Asia"

        }
        if countries[row] == "Ireland" {
            imageCountry.image = UIImage(named: "ie")
            addFacts.text = "Capital: Dublin\n Continent: Europe"

        }
        if countries[row] == "Italy" {
            imageCountry.image = UIImage(named: "it")
            addFacts.text = "Capital: Rome\n Continent: Europe"

        }
        if countries[row] == "Jamaica" {
            imageCountry.image = UIImage(named: "jm")
            addFacts.text = "Capital: Kingston\n Continent: North America"

        }
        if countries[row] == "Japan" {
            imageCountry.image = UIImage(named: "jp")
            addFacts.text = "Capital: Tokyo\n Continent: Asia"

        }
        if countries[row] == "Jordan" {
            imageCountry.image = UIImage(named: "jo")
            addFacts.text = "Capital: Amman\n Continent: Asia"

        }
        if countries[row] == "Kazakhstan" {
            imageCountry.image = UIImage(named: "kz")
            addFacts.text = "Capital: Nur-Sultan\n Continent: Asia"

        }
        if countries[row] == "Kenya" {
            imageCountry.image = UIImage(named: "ke")
            addFacts.text = "Capital: Nairobi\n Continent: Africa"

        }
        if countries[row] == "Kyrgyzstan" {
            imageCountry.image = UIImage(named: "kg")
            addFacts.text = "Capital: Bishkek\n Continent: Asia"

        }
        if countries[row] == "North Korea" {
            imageCountry.image = UIImage(named: "kp")
            addFacts.text = "Capital: Pyongyang\n Continent: Asia"

        }
        if countries[row] == "South Korea" {
            imageCountry.image = UIImage(named: "kr")
            addFacts.text = "Capital: Seoul\n Continent: Asia"

        }
        if countries[row] == "Kuwait" {
            imageCountry.image = UIImage(named: "kw")
            addFacts.text = "Capital: Kuwait City\n Continent: Asia"

        }
        if countries[row] == "Latvia" {
            imageCountry.image = UIImage(named: "lv")
            addFacts.text = "Capital: Riga\n Continent: Europe"

        }
        if countries[row] == "Lebanon" {
            imageCountry.image = UIImage(named: "lb")
            addFacts.text = "Capital: Beirut\n Continent: Asia"

        }
        if countries[row] == "Libya" {
            imageCountry.image = UIImage(named: "ly")
            addFacts.text = "Capital: Tripoli\n Continent: Africa"

        }
        if countries[row] == "Lesotho" {
            imageCountry.image = UIImage(named: "ls")
            addFacts.text = "Capital: Maseru\n Continent: Europe"

        }
        if countries[row] == "Liberia" {
            imageCountry.image = UIImage(named: "lr")
            addFacts.text = "Capital: Monrovia\n Continent: Africa"

        }
        if countries[row] == "Liechtenstein" {
            imageCountry.image = UIImage(named: "li")
            addFacts.text = "Capital: Vaduz\n Continent: Europe"

        }
        if countries[row] == "Lithuania" {
            imageCountry.image = UIImage(named: "lt")
            addFacts.text = "Capital: Vilnius\n Continent: Europe"

        }
        if countries[row] == "Luxembourg" {
            imageCountry.image = UIImage(named: "lu")
            addFacts.text = "Capital: Luxembourg\n Continent: Europe"

        }
        if countries[row] == "Macedonia" {
            imageCountry.image = UIImage(named: "mk")
            addFacts.text = "Capital: Skopje\n Continent: Europe"

        }
        if countries[row] == "Madagascar" {
            imageCountry.image = UIImage(named: "mg")
            addFacts.text = "Capital: Antananarivo\n Continent: Africa"

        }
        if countries[row] == "Malaysia" {
            imageCountry.image = UIImage(named: "my")
            addFacts.text = "Capital:  Kuala Lumpur\n Continent: Asia"

        }
        if countries[row] == "Maldives" {
            imageCountry.image = UIImage(named: "mv")
            addFacts.text = "Capital: Malé\n Continent: Asia"

        }
        if countries[row] == "Mali" {
            imageCountry.image = UIImage(named: "ml")
            addFacts.text = "Capital: Bamako\n Continent: Africa"

        }
        if countries[row] == "Malta" {
            imageCountry.image = UIImage(named: "mt")
            addFacts.text = "Capital: Valletta\n Continent: Asia"

        }
        if countries[row] == "Martinique" {
            imageCountry.image = UIImage(named: "mq")
            addFacts.text = "Capital: Fort-de-France\n Continent: North America"

        }
        if countries[row] == "Mauritania" {
            imageCountry.image = UIImage(named: "mr")
            addFacts.text = "Capital: Nouakchott\n Continent: Asia"

        }
        if countries[row] == "Mauritius" {
            imageCountry.image = UIImage(named: "mu")
            addFacts.text = "Capital: Port Louis\n Continent: Africa"

        }
        if countries[row] == "Mexico" {
            imageCountry.image = UIImage(named: "mx")
            addFacts.text = "Capital: Mexico City\n Continent: North America"

        }
        if countries[row] == "Micronesia" {
            imageCountry.image = UIImage(named: "fm")
            addFacts.text = "Capital: Palikir\n Continent: Oceania"

        }
        if countries[row] == "Laos" {
            imageCountry.image = UIImage(named: "la")
            addFacts.text = "Capital: Vientiane\n Continent: Asia"

        }
        if countries[row] == "Morocco" {
            imageCountry.image = UIImage(named: "ma")
            addFacts.text = "Capital: Rabat\n Continent: Africa"

        }
        if countries[row] == "Monaco" {
            imageCountry.image = UIImage(named: "mc")
            addFacts.text = "Capital: Monaco\n Continent: Europe"

        }
        if countries[row] == "Moldova" {
            imageCountry.image = UIImage(named: "md")
            addFacts.text = "Capital: Chisinau\n Continent: Europe"

        }
        if countries[row] == "Montenegro" {
            imageCountry.image = UIImage(named: "me")
            addFacts.text = "Capital: Podgorica\n Continent: Europe"

        }
        if countries[row] == "Marshall Islands" {
            imageCountry.image = UIImage(named: "mh")
            addFacts.text = "Capital: Majuro\n Continent: Oceania"

        }
        if countries[row] == "Myanmar" {
            imageCountry.image = UIImage(named: "mm")
            addFacts.text = "Capital: Naypyidaw\n Continent: Asia"

        }
        if countries[row] == "Mongolia" {
            imageCountry.image = UIImage(named: "mn")
            addFacts.text = "Capital: Ulan Bator\n Continent: Asia"

        }
        if countries[row] == "Malawi" {
            imageCountry.image = UIImage(named: "mw")
            addFacts.text = "Capital: Lilongwe\n Continent: Africa"

        }
        if countries[row] == "Mozambique" {
            imageCountry.image = UIImage(named: "mz")
            addFacts.text = "Capital: Maputo\n Continent: Africa"

        }
        if countries[row] == "Namibia" {
            imageCountry.image = UIImage(named: "na")
            addFacts.text = "Capital: Windhoek\n Continent: Africa"

        }
        if countries[row] == "Nauru" {
            imageCountry.image = UIImage(named: "nr")
            addFacts.text = "Capital: Yaren\n Continent: Oceania"

        }
        if countries[row] == "Nepal" {
            imageCountry.image = UIImage(named: "np")
            addFacts.text = "Capital: Kathmandu\n Continent: Asia"

        }
        if countries[row] == "Netherlands" {
            imageCountry.image = UIImage(named: "nl")
            addFacts.text = "Capital: Amsterdam\n Continent: Europe"

        }
        if countries[row] == "New Caledonia" {
            imageCountry.image = UIImage(named: "fr")
            addFacts.text = "Capital: Nouméa\n Continent: Oceania"

        }
        if countries[row] == "New Zealand" {
            imageCountry.image = UIImage(named: "nz")
            addFacts.text = "Capital: Wellington\n Continent: Oceania"

        }
        if countries[row] == "Nicaragua" {
            imageCountry.image = UIImage(named: "ni")
            addFacts.text = "Capital: Managua\n Continent: North America"

        }
        if countries[row] == "Niger" {
            imageCountry.image = UIImage(named: "ne")
            addFacts.text = "Capital: Niamey\n Continent: Africa"

        }
        if countries[row] == "Nigeria" {
            imageCountry.image = UIImage(named: "ng")
            addFacts.text = "Capital: Abuja\n Continent: Africa"

        }
        if countries[row] == "Niue" {
            imageCountry.image = UIImage(named: "nu")
            addFacts.text = "Capital: Alofi\n Continent: Oceania"

        }
        if countries[row] == "Norfolk Island" {
            imageCountry.image = UIImage(named: "nf")
            addFacts.text = "Capital: Kingston\n Continent: Oceania"

        }
        if countries[row] == "Norway" {
            imageCountry.image = UIImage(named: "no")
            addFacts.text = "Capital: Oslo\n Continent: Europe"

        }
        if countries[row] == "Oman" {
            imageCountry.image = UIImage(named: "om")
            addFacts.text = "Capital: Muscat\n Continent: Asia"

        }
        if countries[row] == "Pakistan" {
            imageCountry.image = UIImage(named: "pk")
            addFacts.text = "Capital: Islamabad\n Continent: Asia"

        }
        if countries[row] == "Palau" {
            imageCountry.image = UIImage(named: "pw")
            addFacts.text = "Capital: Ngerulmud\n Continent: Oceania"

        }
        if countries[row] == "Panama" {
            imageCountry.image = UIImage(named: "pa")
            addFacts.text = "Capital: Panama City\n Continent: North America"

        }
        if countries[row] == "Papua New Guinea" {
            imageCountry.image = UIImage(named: "pg")
            addFacts.text = "Capital: Port Moresby\n Continent: Oceania"

        }
        if countries[row] == "Paraguay" {
            imageCountry.image = UIImage(named: "fj")
            addFacts.text = "Capital: Asunción\n Continent: South America"

        }
        if countries[row] == "Peru" {
            imageCountry.image = UIImage(named: "pe")
            addFacts.text = "Capital: Lima\n Continent: South America"

        }
        if countries[row] == "Philippines" {
            imageCountry.image = UIImage(named: "ph")
            addFacts.text = "Capital: Manila\n Continent: Asia"

        }
        if countries[row] == "Poland" {
            imageCountry.image = UIImage(named: "pl")
            addFacts.text = "Capital: Warsaw\n Continent: Europe"

        }
        if countries[row] == "Portugal" {
            imageCountry.image = UIImage(named: "pt")
            addFacts.text = "Capital: Lisbon\n Continent: Europe"

        }
        if countries[row] == "Puerto Rico" {
            imageCountry.image = UIImage(named: "pr")
            addFacts.text = "Capital: San Juan\n Continent: North America"

        }
        if countries[row] == "Qatar" {
            imageCountry.image = UIImage(named: "qa")
            addFacts.text = "Capital: Doha\n Continent: Asia"

        }
        if countries[row] == "Romania" {
            imageCountry.image = UIImage(named: "ro")
            addFacts.text = "Capital: Bucharest\n Continent: Europe"

        }
        if countries[row] == "Russia" {
            imageCountry.image = UIImage(named: "ru")
            addFacts.text = "Capital: Moscow\n Continent: Europe"

        }
        if countries[row] == "Rwanda" {
            imageCountry.image = UIImage(named: "rw")
            addFacts.text = "Capital: Kigali\n Continent: Africa"

        }
        if countries[row] == "Saint Kitts and Nevis" {
            imageCountry.image = UIImage(named: "stk")
            addFacts.text = "Capital: Basseterre\n Continent: North America"

        }
        if countries[row] == "Saint Lucia" {
            imageCountry.image = UIImage(named: "slf")
            addFacts.text = "Capital: Castries\n Continent: North America"

        }
        if countries[row] == "Saint Vincent and the Grenadines" {
            imageCountry.image = UIImage(named: "svgt")
            addFacts.text = "Capital: Kingstown\n Continent: North America"

        }
        if countries[row] == "Samoa" {
            imageCountry.image = UIImage(named: "ws")
            addFacts.text = "Capital: Apia\n Continent: Oceania"

        }
        if countries[row] == "San Marino" {
            imageCountry.image = UIImage(named: "sm")
            addFacts.text = "Capital: San Marino\n Continent: Europe"

        }
        if countries[row] == "Saudi Arabia" {
            imageCountry.image = UIImage(named: "sa")
            addFacts.text = "Capital: Riyadh\n Continent: Asia"

        }
        if countries[row] == "Senegal" {
            imageCountry.image = UIImage(named: "sn")
            addFacts.text = "Capital: Dakar\n Continent: Africa"

        }
        if countries[row] == "Serbia" {
            imageCountry.image = UIImage(named: "rs")
            addFacts.text = "Capital: Belgrade\n Continent: Europe"

        }
        if countries[row] == "Sierra Leone" {
            imageCountry.image = UIImage(named: "sl")
            addFacts.text = "Capital: Freetown\n Continent: Africa"

        }
        if countries[row] == "Singapore" {
            imageCountry.image = UIImage(named: "sg")
            addFacts.text = "Capital: Singapore\n Continent: Asia"

        }
        if countries[row] == "Slovakia" {
            imageCountry.image = UIImage(named: "sk")
            addFacts.text = "Capital: Bratislava\n Continent: Europe"

        }
        if countries[row] == "Slovenia" {
            imageCountry.image = UIImage(named: "si")
            addFacts.text = "Capital: Ljubljana\n Continent: Europe"

        }
        if countries[row] == "Solomon Islands" {
            imageCountry.image = UIImage(named: "sb")
            addFacts.text = "Capital: Honiara\n Continent: Oceania"

        }
        if countries[row] == "Somalia" {
            imageCountry.image = UIImage(named: "so")
            addFacts.text = "Capital: Mogadishu\n Continent: Africa"

        }
        if countries[row] == "South Africa" {
            imageCountry.image = UIImage(named: "za")
            addFacts.text = "Capital: Cape Town\n Continent: Africa"

        }
        if countries[row] == "Spain" {
            imageCountry.image = UIImage(named: "es")
            addFacts.text = "Capital: Madrid\n Continent: Europe"

        }
        if countries[row] == "Sri Lanka" {
            imageCountry.image = UIImage(named: "srii")
            addFacts.text = "Capital: Sri Jayawardenapura-kotte\n Continent: Asia"

        }
        if countries[row] == "Sudan" {
            imageCountry.image = UIImage(named: "sd")
            addFacts.text = "Capital: Khartoum\n Continent: Africa"

        }
        if countries[row] == "South Sudan" {
            imageCountry.image = UIImage(named: "South-Sudan")
            addFacts.text = "Capital: Juba\n Continent: Africa"

        }
        if countries[row] == "Suriname" {
            imageCountry.image = UIImage(named: "sr")
            addFacts.text = "Capital: Paramaribo\n Continent: South America"

        }
        if countries[row] == "Swaziland" {
            imageCountry.image = UIImage(named: "sz")
            addFacts.text = "Capital: Mata-utu\n Continent: Africa"

        }
        if countries[row] == "Sweden" {
            imageCountry.image = UIImage(named: "se")
            addFacts.text = "Capital: Stockholm\n Continent: Europe"

        }
        if countries[row] == "Switzerland" {
            imageCountry.image = UIImage(named: "ch")
            addFacts.text = "Capital: Bern\n Continent: Europe"

        }
        if countries[row] == "Syria" {
            imageCountry.image = UIImage(named: "sy")
            addFacts.text = "Capital: Damascus\n Continent: Asia"

        }
        if countries[row] == "Taiwan" {
            imageCountry.image = UIImage(named: "tw")
            addFacts.text = "Capital: Taipei\n Continent: Asia"

        }
        if countries[row] == "Tajikistan" {
            imageCountry.image = UIImage(named: "tj")
            addFacts.text = "Capital: Dushanbe\n Continent: Asia"

        }
        if countries[row] == "Tanzania" {
            imageCountry.image = UIImage(named: "tz")
            addFacts.text = "Capital: Dodoma\n Continent: Africa"

        }
        if countries[row] == "USA" {
            imageCountry.image = UIImage(named: "us")
            addFacts.text = "Capital: Washington D.C.\n Continent: North America"

        }
        if countries[row] == "Thailand" {
            imageCountry.image = UIImage(named: "th")
            addFacts.text = "Capital: Bangkok\n Continent: Asia"

        }
        if countries[row] == "Togo" {
            imageCountry.image = UIImage(named: "tg")
            addFacts.text = "Capital: Lomé\n Continent: Africa"

        }
        if countries[row] == "Uganda" {
            imageCountry.image = UIImage(named: "ug")
            addFacts.text = "Capital: Kampala\n Continent: Africa"

        }
        if countries[row] == "Ukraine" {
            imageCountry.image = UIImage(named: "ua")
            addFacts.text = "Capital: Kiev\n Continent: Europe"

        }
        if countries[row] == "United Arab Emirates" {
            imageCountry.image = UIImage(named: "uaee")
            addFacts.text = "Capital: Abu Dhabi\n Continent: Asia"

        }
        if countries[row] == "Uruguay" {
            imageCountry.image = UIImage(named: "uy")
            addFacts.text = "Capital: Montevideo\n Continent: South America"

        }
        if countries[row] == "Uzbekistan" {
            imageCountry.image = UIImage(named: "uz")
            addFacts.text = "Capital: Tashkent\n Continent: Asia"

        }
        if countries[row] == "Vanuatu" {
            imageCountry.image = UIImage(named: "vu")
            addFacts.text = "Capital: Port Vila\n Continent: Asia"

        }
        if countries[row] == "Venezuela" {
            imageCountry.image = UIImage(named: "ve")
            addFacts.text = "Capital: Caracas\n Continent: South America"

        }
        if countries[row] == "Vietnam" {
            imageCountry.image = UIImage(named: "vn")
            addFacts.text = "Capital: Hanoi\n Continent: Asia"

        }
        if countries[row] == "Virgin Islands (U.S.)" {
            imageCountry.image = UIImage(named: "vi")
            addFacts.text = "Capital: Charlotte Amalie\n Continent: North America"

        }
        if countries[row] == "Yemen" {
            imageCountry.image = UIImage(named: "ye")
            addFacts.text = "Capital: Sana’a\n Continent: Asia"

        }
        if countries[row] == "Palestine" {
            imageCountry.image = UIImage(named: "pales")
            addFacts.text = "Capital: Gaza\n Continent: Asia"

        }
        if countries[row] == "Zambia" {
            imageCountry.image = UIImage(named: "zm")
            addFacts.text = "Capital: Lusaka\n Continent: Africa"

        }
        if countries[row] == "Zimbabwe" {
            imageCountry.image = UIImage(named: "zw")
            addFacts.text = "Capital: Harare\n Continent: Africa"

        }
        if countries[row] == "Tokelau" {
            imageCountry.image = UIImage(named: "tk")
            addFacts.text = "Capital: Nukunonu, Atafu,Tokelau\n Continent: Oceania"

        }
        if countries[row] == "Tonga" {
            imageCountry.image = UIImage(named: "to")
            addFacts.text = "Capital: Nukuʻalofa\n Continent: Oceania"

        }
        if countries[row] == "Trinidad and Tobago" {
            imageCountry.image = UIImage(named: "tt")
            addFacts.text = "Capital: Port Of Spain\n Continent: North America"

        }
        if countries[row] == "Tunisia" {
            imageCountry.image = UIImage(named: "tn")
            addFacts.text = "Capital: Tunis\n Continent: Europe"

        }
        if countries[row] == "Turkey" {
            imageCountry.image = UIImage(named: "tr")
            addFacts.text = "Capital: Ankara\n Continent: Europe"

        }
    }
    
}

