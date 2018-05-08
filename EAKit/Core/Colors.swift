//
//  Colors.swift
//  EAKit-iOS
//
//  Created by 李二狗 on 2018/5/8.
//

import Foundation
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if !os(watchOS)
import CoreImage
#endif

// MARK: - Social colors
public extension Color {
    
    /// EAKit: Brand identity color of popular social media platform.
    public struct Social {
        // https://www.lockedowndesign.com/social-media-colors/
        
        /// red: 59, green: 89, blue: 152
        public static let facebook = Color(red: 59, green: 89, blue: 152)!
        
        /// red: 0, green: 182, blue: 241
        public static let twitter = Color(red: 0, green: 182, blue: 241)!
        
        /// red: 223, green: 74, blue: 50
        public static let googlePlus = Color(red: 223, green: 74, blue: 50)!
        
        /// red: 0, green: 123, blue: 182
        public static let linkedIn = Color(red: 0, green: 123, blue: 182)!
        
        /// red: 69, green: 187, blue: 255
        public static let vimeo = Color(red: 69, green: 187, blue: 255)!
        
        /// red: 179, green: 18, blue: 23
        public static let youtube = Color(red: 179, green: 18, blue: 23)!
        
        /// red: 195, green: 42, blue: 163
        public static let instagram = Color(red: 195, green: 42, blue: 163)!
        
        /// red: 203, green: 32, blue: 39
        public static let pinterest = Color(red: 203, green: 32, blue: 39)!
        
        /// red: 244, green: 0, blue: 131
        public static let flickr = Color(red: 244, green: 0, blue: 131)!
        
        /// red: 67, green: 2, blue: 151
        public static let yahoo = Color(red: 67, green: 2, blue: 151)!
        
        /// red: 67, green: 2, blue: 151
        public static let soundCloud = Color(red: 67, green: 2, blue: 151)!
        
        /// red: 44, green: 71, blue: 98
        public static let tumblr = Color(red: 44, green: 71, blue: 98)!
        
        /// red: 252, green: 69, blue: 117
        public static let foursquare = Color(red: 252, green: 69, blue: 117)!
        
        /// red: 255, green: 176, blue: 0
        public static let swarm = Color(red: 255, green: 176, blue: 0)!
        
        /// red: 234, green: 76, blue: 137
        public static let dribbble = Color(red: 234, green: 76, blue: 137)!
        
        /// red: 255, green: 87, blue: 0
        public static let reddit = Color(red: 255, green: 87, blue: 0)!
        
        /// red: 74, green: 93, blue: 78
        public static let devianArt = Color(red: 74, green: 93, blue: 78)!
        
        /// red: 238, green: 64, blue: 86
        public static let pocket = Color(red: 238, green: 64, blue: 86)!
        
        /// red: 170, green: 34, blue: 182
        public static let quora = Color(red: 170, green: 34, blue: 182)!
        
        /// red: 247, green: 146, blue: 30
        public static let slideShare = Color(red: 247, green: 146, blue: 30)!
        
        /// red: 0, green: 153, blue: 229
        public static let px500 = Color(red: 0, green: 153, blue: 229)!
        
        /// red: 223, green: 109, blue: 70
        public static let listly = Color(red: 223, green: 109, blue: 70)!
        
        /// red: 0, green: 180, blue: 137
        public static let vine = Color(red: 0, green: 180, blue: 137)!
        
        /// red: 0, green: 175, blue: 240
        public static let skype = Color(red: 0, green: 175, blue: 240)!
        
        /// red: 235, green: 73, blue: 36
        public static let stumbleUpon = Color(red: 235, green: 73, blue: 36)!
        
        /// red: 255, green: 252, blue: 0
        public static let snapchat = Color(red: 255, green: 252, blue: 0)!
    }
    
}

// MARK: - Material colors
public extension Color {
    
    /// EAKit: Google Material design colors palette.
    public struct Material {
        // https://material.google.com/style/color.html
        
        /// EAKit: color red500
        public static let red                    = red500
        
        /// EAKit: hex #FFEBEE
        public static let red50                    = Color(hexValue: 0xFFEBEE)!
        
        /// EAKit: hex #FFCDD2
        public static let red100                = Color(hexValue: 0xFFCDD2)!
        
        /// EAKit: hex #EF9A9A
        public static let red200                = Color(hexValue: 0xEF9A9A)!
        
        /// EAKit: hex #E57373
        public static let red300                = Color(hexValue: 0xE57373)!
        
        /// EAKit: hex #EF5350
        public static let red400                = Color(hexValue: 0xEF5350)!
        
        /// EAKit: hex #F44336
        public static let red500                = Color(hexValue: 0xF44336)!
        
        /// EAKit: hex #E53935
        public static let red600                = Color(hexValue: 0xE53935)!
        
        /// EAKit: hex #D32F2F
        public static let red700                = Color(hexValue: 0xD32F2F)!
        
        /// EAKit: hex #C62828
        public static let red800                = Color(hexValue: 0xC62828)!
        
        /// EAKit: hex #B71C1C
        public static let red900                = Color(hexValue: 0xB71C1C)!
        
        /// EAKit: hex #FF8A80
        public static let redA100                = Color(hexValue: 0xFF8A80)!
        
        /// EAKit: hex #FF5252
        public static let redA200                = Color(hexValue: 0xFF5252)!
        
        /// EAKit: hex #FF1744
        public static let redA400                = Color(hexValue: 0xFF1744)!
        
        /// EAKit: hex #D50000
        public static let redA700                = Color(hexValue: 0xD50000)!
        
        /// EAKit: color pink500
        public static let pink                    = pink500
        
        /// EAKit: hex #FCE4EC
        public static let pink50                = Color(hexValue: 0xFCE4EC)!
        
        /// EAKit: hex #F8BBD0
        public static let pink100                = Color(hexValue: 0xF8BBD0)!
        
        /// EAKit: hex #F48FB1
        public static let pink200                = Color(hexValue: 0xF48FB1)!
        
        /// EAKit: hex #F06292
        public static let pink300                = Color(hexValue: 0xF06292)!
        
        /// EAKit: hex #EC407A
        public static let pink400                = Color(hexValue: 0xEC407A)!
        
        /// EAKit: hex #E91E63
        public static let pink500                = Color(hexValue: 0xE91E63)!
        
        /// EAKit: hex #D81B60
        public static let pink600                = Color(hexValue: 0xD81B60)!
        
        /// EAKit: hex #C2185B
        public static let pink700                = Color(hexValue: 0xC2185B)!
        
        /// EAKit: hex #AD1457
        public static let pink800                = Color(hexValue: 0xAD1457)!
        
        /// EAKit: hex #880E4F
        public static let pink900                = Color(hexValue: 0x880E4F)!
        
        /// EAKit: hex #FF80AB
        public static let pinkA100                = Color(hexValue: 0xFF80AB)!
        
        /// EAKit: hex #FF4081
        public static let pinkA200                = Color(hexValue: 0xFF4081)!
        
        /// EAKit: hex #F50057
        public static let pinkA400                = Color(hexValue: 0xF50057)!
        
        /// EAKit: hex #C51162
        public static let pinkA700                = Color(hexValue: 0xC51162)!
        
        /// EAKit: color purple500
        public static let purple                = purple500
        
        /// EAKit: hex #F3E5F5
        public static let purple50                = Color(hexValue: 0xF3E5F5)!
        
        /// EAKit: hex #E1BEE7
        public static let purple100                = Color(hexValue: 0xE1BEE7)!
        
        /// EAKit: hex #CE93D8
        public static let purple200                = Color(hexValue: 0xCE93D8)!
        
        /// EAKit: hex #BA68C8
        public static let purple300                = Color(hexValue: 0xBA68C8)!
        
        /// EAKit: hex #AB47BC
        public static let purple400                = Color(hexValue: 0xAB47BC)!
        
        /// EAKit: hex #9C27B0
        public static let purple500                = Color(hexValue: 0x9C27B0)!
        
        /// EAKit: hex #8E24AA
        public static let purple600                = Color(hexValue: 0x8E24AA)!
        
        /// EAKit: hex #7B1FA2
        public static let purple700                = Color(hexValue: 0x7B1FA2)!
        
        /// EAKit: hex #6A1B9A
        public static let purple800                = Color(hexValue: 0x6A1B9A)!
        
        /// EAKit: hex #4A148C
        public static let purple900                = Color(hexValue: 0x4A148C)!
        
        /// EAKit: hex #EA80FC
        public static let purpleA100            = Color(hexValue: 0xEA80FC)!
        
        /// EAKit: hex #E040FB
        public static let purpleA200            = Color(hexValue: 0xE040FB)!
        
        /// EAKit: hex #D500F9
        public static let purpleA400            = Color(hexValue: 0xD500F9)!
        
        /// EAKit: hex #AA00FF
        public static let purpleA700            = Color(hexValue: 0xAA00FF)!
        
        /// EAKit: color deepPurple500
        public static let deepPurple            = deepPurple500
        
        /// EAKit: hex #EDE7F6
        public static let deepPurple50            = Color(hexValue: 0xEDE7F6)!
        
        /// EAKit: hex #D1C4E9
        public static let deepPurple100            = Color(hexValue: 0xD1C4E9)!
        
        /// EAKit: hex #B39DDB
        public static let deepPurple200            = Color(hexValue: 0xB39DDB)!
        
        /// EAKit: hex #9575CD
        public static let deepPurple300            = Color(hexValue: 0x9575CD)!
        
        /// EAKit: hex #7E57C2
        public static let deepPurple400            = Color(hexValue: 0x7E57C2)!
        
        /// EAKit: hex #673AB7
        public static let deepPurple500            = Color(hexValue: 0x673AB7)!
        
        /// EAKit: hex #5E35B1
        public static let deepPurple600            = Color(hexValue: 0x5E35B1)!
        
        /// EAKit: hex #512DA8
        public static let deepPurple700            = Color(hexValue: 0x512DA8)!
        
        /// EAKit: hex #4527A0
        public static let deepPurple800            = Color(hexValue: 0x4527A0)!
        
        /// EAKit: hex #311B92
        public static let deepPurple900            = Color(hexValue: 0x311B92)!
        
        /// EAKit: hex #B388FF
        public static let deepPurpleA100        = Color(hexValue: 0xB388FF)!
        
        /// EAKit: hex #7C4DFF
        public static let deepPurpleA200        = Color(hexValue: 0x7C4DFF)!
        
        /// EAKit: hex #651FFF
        public static let deepPurpleA400        = Color(hexValue: 0x651FFF)!
        
        /// EAKit: hex #6200EA
        public static let deepPurpleA700        = Color(hexValue: 0x6200EA)!
        
        /// EAKit: color indigo500
        public static let indigo                = indigo500
        
        /// EAKit: hex #E8EAF6
        public static let indigo50                = Color(hexValue: 0xE8EAF6)!
        
        /// EAKit: hex #C5CAE9
        public static let indigo100                = Color(hexValue: 0xC5CAE9)!
        
        /// EAKit: hex #9FA8DA
        public static let indigo200                = Color(hexValue: 0x9FA8DA)!
        
        /// EAKit: hex #7986CB
        public static let indigo300                = Color(hexValue: 0x7986CB)!
        
        /// EAKit: hex #5C6BC0
        public static let indigo400                = Color(hexValue: 0x5C6BC0)!
        
        /// EAKit: hex #3F51B5
        public static let indigo500                = Color(hexValue: 0x3F51B5)!
        
        /// EAKit: hex #3949AB
        public static let indigo600                = Color(hexValue: 0x3949AB)!
        
        /// EAKit: hex #303F9F
        public static let indigo700                = Color(hexValue: 0x303F9F)!
        
        /// EAKit: hex #283593
        public static let indigo800                = Color(hexValue: 0x283593)!
        
        /// EAKit: hex #1A237E
        public static let indigo900                = Color(hexValue: 0x1A237E)!
        
        /// EAKit: hex #8C9EFF
        public static let indigoA100            = Color(hexValue: 0x8C9EFF)!
        
        /// EAKit: hex #536DFE
        public static let indigoA200            = Color(hexValue: 0x536DFE)!
        
        /// EAKit: hex #3D5AFE
        public static let indigoA400            = Color(hexValue: 0x3D5AFE)!
        
        /// EAKit: hex #304FFE
        public static let indigoA700            = Color(hexValue: 0x304FFE)!
        
        /// EAKit: color blue500
        public static let blue                    = blue500
        
        /// EAKit: hex #E3F2FD
        public static let blue50                = Color(hexValue: 0xE3F2FD)!
        
        /// EAKit: hex #BBDEFB
        public static let blue100                = Color(hexValue: 0xBBDEFB)!
        
        /// EAKit: hex #90CAF9
        public static let blue200                = Color(hexValue: 0x90CAF9)!
        
        /// EAKit: hex #64B5F6
        public static let blue300                = Color(hexValue: 0x64B5F6)!
        
        /// EAKit: hex #42A5F5
        public static let blue400                = Color(hexValue: 0x42A5F5)!
        
        /// EAKit: hex #2196F3
        public static let blue500                = Color(hexValue: 0x2196F3)!
        
        /// EAKit: hex #1E88E5
        public static let blue600                = Color(hexValue: 0x1E88E5)!
        
        /// EAKit: hex #1976D2
        public static let blue700                = Color(hexValue: 0x1976D2)!
        
        /// EAKit: hex #1565C0
        public static let blue800                = Color(hexValue: 0x1565C0)!
        
        /// EAKit: hex #0D47A1
        public static let blue900                = Color(hexValue: 0x0D47A1)!
        
        /// EAKit: hex #82B1FF
        public static let blueA100                = Color(hexValue: 0x82B1FF)!
        
        /// EAKit: hex #448AFF
        public static let blueA200                = Color(hexValue: 0x448AFF)!
        
        /// EAKit: hex #2979FF
        public static let blueA400                = Color(hexValue: 0x2979FF)!
        
        /// EAKit: hex #2962FF
        public static let blueA700                = Color(hexValue: 0x2962FF)!
        
        /// EAKit: color lightBlue500
        public static let lightBlue                = lightBlue500
        
        /// EAKit: hex #E1F5FE
        public static let lightBlue50            = Color(hexValue: 0xE1F5FE)!
        
        /// EAKit: hex #B3E5FC
        public static let lightBlue100            = Color(hexValue: 0xB3E5FC)!
        
        /// EAKit: hex #81D4FA
        public static let lightBlue200            = Color(hexValue: 0x81D4FA)!
        
        /// EAKit: hex #4FC3F7
        public static let lightBlue300            = Color(hexValue: 0x4FC3F7)!
        
        /// EAKit: hex #29B6F6
        public static let lightBlue400            = Color(hexValue: 0x29B6F6)!
        
        /// EAKit: hex #03A9F4
        public static let lightBlue500            = Color(hexValue: 0x03A9F4)!
        
        /// EAKit: hex #039BE5
        public static let lightBlue600            = Color(hexValue: 0x039BE5)!
        
        /// EAKit: hex #0288D1
        public static let lightBlue700            = Color(hexValue: 0x0288D1)!
        
        /// EAKit: hex #0277BD
        public static let lightBlue800            = Color(hexValue: 0x0277BD)!
        
        /// EAKit: hex #01579B
        public static let lightBlue900            = Color(hexValue: 0x01579B)!
        
        /// EAKit: hex #80D8FF
        public static let lightBlueA100            = Color(hexValue: 0x80D8FF)!
        
        /// EAKit: hex #40C4FF
        public static let lightBlueA200            = Color(hexValue: 0x40C4FF)!
        
        /// EAKit: hex #00B0FF
        public static let lightBlueA400            = Color(hexValue: 0x00B0FF)!
        
        /// EAKit: hex #0091EA
        public static let lightBlueA700            = Color(hexValue: 0x0091EA)!
        
        /// EAKit: color cyan500
        public static let cyan                    = cyan500
        
        /// EAKit: hex #E0F7FA
        public static let cyan50                = Color(hexValue: 0xE0F7FA)!
        
        /// EAKit: hex #B2EBF2
        public static let cyan100                = Color(hexValue: 0xB2EBF2)!
        
        /// EAKit: hex #80DEEA
        public static let cyan200                = Color(hexValue: 0x80DEEA)!
        
        /// EAKit: hex #4DD0E1
        public static let cyan300                = Color(hexValue: 0x4DD0E1)!
        
        /// EAKit: hex #26C6DA
        public static let cyan400                = Color(hexValue: 0x26C6DA)!
        
        /// EAKit: hex #00BCD4
        public static let cyan500                = Color(hexValue: 0x00BCD4)!
        
        /// EAKit: hex #00ACC1
        public static let cyan600                = Color(hexValue: 0x00ACC1)!
        
        /// EAKit: hex #0097A7
        public static let cyan700                = Color(hexValue: 0x0097A7)!
        
        /// EAKit: hex #00838F
        public static let cyan800                = Color(hexValue: 0x00838F)!
        
        /// EAKit: hex #006064
        public static let cyan900                = Color(hexValue: 0x006064)!
        
        /// EAKit: hex #84FFFF
        public static let cyanA100                = Color(hexValue: 0x84FFFF)!
        
        /// EAKit: hex #18FFFF
        public static let cyanA200                = Color(hexValue: 0x18FFFF)!
        
        /// EAKit: hex #00E5FF
        public static let cyanA400                = Color(hexValue: 0x00E5FF)!
        
        /// EAKit: hex #00B8D4
        public static let cyanA700                = Color(hexValue: 0x00B8D4)!
        
        /// EAKit: color teal500
        public static let teal                    = teal500
        
        /// EAKit: hex #E0F2F1
        public static let teal50                = Color(hexValue: 0xE0F2F1)!
        
        /// EAKit: hex #B2DFDB
        public static let teal100                = Color(hexValue: 0xB2DFDB)!
        
        /// EAKit: hex #80CBC4
        public static let teal200                = Color(hexValue: 0x80CBC4)!
        
        /// EAKit: hex #4DB6AC
        public static let teal300                = Color(hexValue: 0x4DB6AC)!
        
        /// EAKit: hex #26A69A
        public static let teal400                = Color(hexValue: 0x26A69A)!
        
        /// EAKit: hex #009688
        public static let teal500                = Color(hexValue: 0x009688)!
        
        /// EAKit: hex #00897B
        public static let teal600                = Color(hexValue: 0x00897B)!
        
        /// EAKit: hex #00796B
        public static let teal700                = Color(hexValue: 0x00796B)!
        
        /// EAKit: hex #00695C
        public static let teal800                = Color(hexValue: 0x00695C)!
        
        /// EAKit: hex #004D40
        public static let teal900                = Color(hexValue: 0x004D40)!
        
        /// EAKit: hex #A7FFEB
        public static let tealA100                = Color(hexValue: 0xA7FFEB)!
        
        /// EAKit: hex #64FFDA
        public static let tealA200                = Color(hexValue: 0x64FFDA)!
        
        /// EAKit: hex #1DE9B6
        public static let tealA400                = Color(hexValue: 0x1DE9B6)!
        
        /// EAKit: hex #00BFA5
        public static let tealA700                = Color(hexValue: 0x00BFA5)!
        
        /// EAKit: color green500
        public static let green                    = green500
        
        /// EAKit: hex #E8F5E9
        public static let green50                = Color(hexValue: 0xE8F5E9)!
        
        /// EAKit: hex #C8E6C9
        public static let green100                = Color(hexValue: 0xC8E6C9)!
        
        /// EAKit: hex #A5D6A7
        public static let green200                = Color(hexValue: 0xA5D6A7)!
        
        /// EAKit: hex #81C784
        public static let green300                = Color(hexValue: 0x81C784)!
        
        /// EAKit: hex #66BB6A
        public static let green400                = Color(hexValue: 0x66BB6A)!
        
        /// EAKit: hex #4CAF50
        public static let green500                = Color(hexValue: 0x4CAF50)!
        
        /// EAKit: hex #43A047
        public static let green600                = Color(hexValue: 0x43A047)!
        
        /// EAKit: hex #388E3C
        public static let green700                = Color(hexValue: 0x388E3C)!
        
        /// EAKit: hex #2E7D32
        public static let green800                = Color(hexValue: 0x2E7D32)!
        
        /// EAKit: hex #1B5E20
        public static let green900                = Color(hexValue: 0x1B5E20)!
        
        /// EAKit: hex #B9F6CA
        public static let greenA100                = Color(hexValue: 0xB9F6CA)!
        
        /// EAKit: hex #69F0AE
        public static let greenA200                = Color(hexValue: 0x69F0AE)!
        
        /// EAKit: hex #00E676
        public static let greenA400                = Color(hexValue: 0x00E676)!
        
        /// EAKit: hex #00C853
        public static let greenA700                = Color(hexValue: 0x00C853)!
        
        /// EAKit: color lightGreen500
        public static let lightGreen            = lightGreen500
        
        /// EAKit: hex #F1F8E9
        public static let lightGreen50            = Color(hexValue: 0xF1F8E9)!
        
        /// EAKit: hex #DCEDC8
        public static let lightGreen100            = Color(hexValue: 0xDCEDC8)!
        
        /// EAKit: hex #C5E1A5
        public static let lightGreen200            = Color(hexValue: 0xC5E1A5)!
        
        /// EAKit: hex #AED581
        public static let lightGreen300            = Color(hexValue: 0xAED581)!
        
        /// EAKit: hex #9CCC65
        public static let lightGreen400            = Color(hexValue: 0x9CCC65)!
        
        /// EAKit: hex #8BC34A
        public static let lightGreen500            = Color(hexValue: 0x8BC34A)!
        
        /// EAKit: hex #7CB342
        public static let lightGreen600            = Color(hexValue: 0x7CB342)!
        
        /// EAKit: hex #689F38
        public static let lightGreen700            = Color(hexValue: 0x689F38)!
        
        /// EAKit: hex #558B2F
        public static let lightGreen800            = Color(hexValue: 0x558B2F)!
        
        /// EAKit: hex #33691E
        public static let lightGreen900            = Color(hexValue: 0x33691E)!
        
        /// EAKit: hex #CCFF90
        public static let lightGreenA100        = Color(hexValue: 0xCCFF90)!
        
        /// EAKit: hex #B2FF59
        public static let lightGreenA200        = Color(hexValue: 0xB2FF59)!
        
        /// EAKit: hex #76FF03
        public static let lightGreenA400        = Color(hexValue: 0x76FF03)!
        
        /// EAKit: hex #64DD17
        public static let lightGreenA700        = Color(hexValue: 0x64DD17)!
        
        /// EAKit: color lime500
        public static let lime                    = lime500
        
        /// EAKit: hex #F9FBE7
        public static let lime50                = Color(hexValue: 0xF9FBE7)!
        
        /// EAKit: hex #F0F4C3
        public static let lime100                = Color(hexValue: 0xF0F4C3)!
        
        /// EAKit: hex #E6EE9C
        public static let lime200                = Color(hexValue: 0xE6EE9C)!
        
        /// EAKit: hex #DCE775
        public static let lime300                = Color(hexValue: 0xDCE775)!
        
        /// EAKit: hex #D4E157
        public static let lime400                = Color(hexValue: 0xD4E157)!
        
        /// EAKit: hex #CDDC39
        public static let lime500                = Color(hexValue: 0xCDDC39)!
        
        /// EAKit: hex #C0CA33
        public static let lime600                = Color(hexValue: 0xC0CA33)!
        
        /// EAKit: hex #AFB42B
        public static let lime700                = Color(hexValue: 0xAFB42B)!
        
        /// EAKit: hex #9E9D24
        public static let lime800                = Color(hexValue: 0x9E9D24)!
        
        /// EAKit: hex #827717
        public static let lime900                = Color(hexValue: 0x827717)!
        
        /// EAKit: hex #F4FF81
        public static let limeA100                = Color(hexValue: 0xF4FF81)!
        
        /// EAKit: hex #EEFF41
        public static let limeA200                = Color(hexValue: 0xEEFF41)!
        
        /// EAKit: hex #C6FF00
        public static let limeA400                = Color(hexValue: 0xC6FF00)!
        
        /// EAKit: hex #AEEA00
        public static let limeA700                = Color(hexValue: 0xAEEA00)!
        
        /// EAKit: color yellow500
        public static let yellow                = yellow500
        
        /// EAKit: hex #FFFDE7
        public static let yellow50                = Color(hexValue: 0xFFFDE7)!
        
        /// EAKit: hex #FFF9C4
        public static let yellow100                = Color(hexValue: 0xFFF9C4)!
        
        /// EAKit: hex #FFF59D
        public static let yellow200                = Color(hexValue: 0xFFF59D)!
        
        /// EAKit: hex #FFF176
        public static let yellow300                = Color(hexValue: 0xFFF176)!
        
        /// EAKit: hex #FFEE58
        public static let yellow400                = Color(hexValue: 0xFFEE58)!
        
        /// EAKit: hex #FFEB3B
        public static let yellow500                = Color(hexValue: 0xFFEB3B)!
        
        /// EAKit: hex #FDD835
        public static let yellow600                = Color(hexValue: 0xFDD835)!
        
        /// EAKit: hex #FBC02D
        public static let yellow700                = Color(hexValue: 0xFBC02D)!
        
        /// EAKit: hex #F9A825
        public static let yellow800                = Color(hexValue: 0xF9A825)!
        
        /// EAKit: hex #F57F17
        public static let yellow900                = Color(hexValue: 0xF57F17)!
        
        /// EAKit: hex #FFFF8D
        public static let yellowA100            = Color(hexValue: 0xFFFF8D)!
        
        /// EAKit: hex #FFFF00
        public static let yellowA200            = Color(hexValue: 0xFFFF00)!
        
        /// EAKit: hex #FFEA00
        public static let yellowA400            = Color(hexValue: 0xFFEA00)!
        
        /// EAKit: hex #FFD600
        public static let yellowA700            = Color(hexValue: 0xFFD600)!
        
        /// EAKit: color amber500
        public static let amber                    = amber500
        
        /// EAKit: hex #FFF8E1
        public static let amber50                = Color(hexValue: 0xFFF8E1)!
        
        /// EAKit: hex #FFECB3
        public static let amber100                = Color(hexValue: 0xFFECB3)!
        
        /// EAKit: hex #FFE082
        public static let amber200                = Color(hexValue: 0xFFE082)!
        
        /// EAKit: hex #FFD54F
        public static let amber300                = Color(hexValue: 0xFFD54F)!
        
        /// EAKit: hex #FFCA28
        public static let amber400                = Color(hexValue: 0xFFCA28)!
        
        /// EAKit: hex #FFC107
        public static let amber500                = Color(hexValue: 0xFFC107)!
        
        /// EAKit: hex #FFB300
        public static let amber600                = Color(hexValue: 0xFFB300)!
        
        /// EAKit: hex #FFA000
        public static let amber700                = Color(hexValue: 0xFFA000)!
        
        /// EAKit: hex #FF8F00
        public static let amber800                = Color(hexValue: 0xFF8F00)!
        
        /// EAKit: hex #FF6F00
        public static let amber900                = Color(hexValue: 0xFF6F00)!
        
        /// EAKit: hex #FFE57F
        public static let amberA100                = Color(hexValue: 0xFFE57F)!
        
        /// EAKit: hex #FFD740
        public static let amberA200                = Color(hexValue: 0xFFD740)!
        
        /// EAKit: hex #FFC400
        public static let amberA400                = Color(hexValue: 0xFFC400)!
        
        /// EAKit: hex #FFAB00
        public static let amberA700                = Color(hexValue: 0xFFAB00)!
        
        /// EAKit: color orange500
        public static let orange                = orange500
        
        /// EAKit: hex #FFF3E0
        public static let orange50                = Color(hexValue: 0xFFF3E0)!
        
        /// EAKit: hex #FFE0B2
        public static let orange100                = Color(hexValue: 0xFFE0B2)!
        
        /// EAKit: hex #FFCC80
        public static let orange200                = Color(hexValue: 0xFFCC80)!
        
        /// EAKit: hex #FFB74D
        public static let orange300                = Color(hexValue: 0xFFB74D)!
        
        /// EAKit: hex #FFA726
        public static let orange400                = Color(hexValue: 0xFFA726)!
        
        /// EAKit: hex #FF9800
        public static let orange500                = Color(hexValue: 0xFF9800)!
        
        /// EAKit: hex #FB8C00
        public static let orange600                = Color(hexValue: 0xFB8C00)!
        
        /// EAKit: hex #F57C00
        public static let orange700                = Color(hexValue: 0xF57C00)!
        
        /// EAKit: hex #EF6C00
        public static let orange800                = Color(hexValue: 0xEF6C00)!
        
        /// EAKit: hex #E65100
        public static let orange900                = Color(hexValue: 0xE65100)!
        
        /// EAKit: hex #FFD180
        public static let orangeA100            = Color(hexValue: 0xFFD180)!
        
        /// EAKit: hex #FFAB40
        public static let orangeA200            = Color(hexValue: 0xFFAB40)!
        
        /// EAKit: hex #FF9100
        public static let orangeA400            = Color(hexValue: 0xFF9100)!
        
        /// EAKit: hex #FF6D00
        public static let orangeA700            = Color(hexValue: 0xFF6D00)!
        
        /// EAKit: color deepOrange500
        public static let deepOrange            = deepOrange500
        
        /// EAKit: hex #FBE9E7
        public static let deepOrange50            = Color(hexValue: 0xFBE9E7)!
        
        /// EAKit: hex #FFCCBC
        public static let deepOrange100            = Color(hexValue: 0xFFCCBC)!
        
        /// EAKit: hex #FFAB91
        public static let deepOrange200            = Color(hexValue: 0xFFAB91)!
        
        /// EAKit: hex #FF8A65
        public static let deepOrange300            = Color(hexValue: 0xFF8A65)!
        
        /// EAKit: hex #FF7043
        public static let deepOrange400            = Color(hexValue: 0xFF7043)!
        
        /// EAKit: hex #FF5722
        public static let deepOrange500            = Color(hexValue: 0xFF5722)!
        
        /// EAKit: hex #F4511E
        public static let deepOrange600            = Color(hexValue: 0xF4511E)!
        
        /// EAKit: hex #E64A19
        public static let deepOrange700            = Color(hexValue: 0xE64A19)!
        
        /// EAKit: hex #D84315
        public static let deepOrange800            = Color(hexValue: 0xD84315)!
        
        /// EAKit: hex #BF360C
        public static let deepOrange900            = Color(hexValue: 0xBF360C)!
        
        /// EAKit: hex #FF9E80
        public static let deepOrangeA100        = Color(hexValue: 0xFF9E80)!
        
        /// EAKit: hex #FF6E40
        public static let deepOrangeA200        = Color(hexValue: 0xFF6E40)!
        
        /// EAKit: hex #FF3D00
        public static let deepOrangeA400        = Color(hexValue: 0xFF3D00)!
        
        /// EAKit: hex #DD2C00
        public static let deepOrangeA700        = Color(hexValue: 0xDD2C00)!
        
        /// EAKit: color brown500
        public static let brown                    = brown500
        
        /// EAKit: hex #EFEBE9
        public static let brown50                = Color(hexValue: 0xEFEBE9)!
        
        /// EAKit: hex #D7CCC8
        public static let brown100                = Color(hexValue: 0xD7CCC8)!
        
        /// EAKit: hex #BCAAA4
        public static let brown200                = Color(hexValue: 0xBCAAA4)!
        
        /// EAKit: hex #A1887F
        public static let brown300                = Color(hexValue: 0xA1887F)!
        
        /// EAKit: hex #8D6E63
        public static let brown400                = Color(hexValue: 0x8D6E63)!
        
        /// EAKit: hex #795548
        public static let brown500                = Color(hexValue: 0x795548)!
        
        /// EAKit: hex #6D4C41
        public static let brown600                = Color(hexValue: 0x6D4C41)!
        
        /// EAKit: hex #5D4037
        public static let brown700                = Color(hexValue: 0x5D4037)!
        
        /// EAKit: hex #4E342E
        public static let brown800                = Color(hexValue: 0x4E342E)!
        
        /// EAKit: hex #3E2723
        public static let brown900                = Color(hexValue: 0x3E2723)!
        
        /// EAKit: color grey500
        public static let grey                    = grey500
        
        /// EAKit: hex #FAFAFA
        public static let grey50                = Color(hexValue: 0xFAFAFA)!
        
        /// EAKit: hex #F5F5F5
        public static let grey100                = Color(hexValue: 0xF5F5F5)!
        
        /// EAKit: hex #EEEEEE
        public static let grey200                = Color(hexValue: 0xEEEEEE)!
        
        /// EAKit: hex #E0E0E0
        public static let grey300                = Color(hexValue: 0xE0E0E0)!
        
        /// EAKit: hex #BDBDBD
        public static let grey400                = Color(hexValue: 0xBDBDBD)!
        
        /// EAKit: hex #9E9E9E
        public static let grey500                = Color(hexValue: 0x9E9E9E)!
        
        /// EAKit: hex #757575
        public static let grey600                = Color(hexValue: 0x757575)!
        
        /// EAKit: hex #616161
        public static let grey700                = Color(hexValue: 0x616161)!
        
        /// EAKit: hex #424242
        public static let grey800                = Color(hexValue: 0x424242)!
        
        /// EAKit: hex #212121
        public static let grey900                = Color(hexValue: 0x212121)!
        
        /// EAKit: color blueGrey500
        public static let blueGrey                = blueGrey500
        
        /// EAKit: hex #ECEFF1
        public static let blueGrey50            = Color(hexValue: 0xECEFF1)!
        
        /// EAKit: hex #CFD8DC
        public static let blueGrey100            = Color(hexValue: 0xCFD8DC)!
        
        /// EAKit: hex #B0BEC5
        public static let blueGrey200            = Color(hexValue: 0xB0BEC5)!
        
        /// EAKit: hex #90A4AE
        public static let blueGrey300            = Color(hexValue: 0x90A4AE)!
        
        /// EAKit: hex #78909C
        public static let blueGrey400            = Color(hexValue: 0x78909C)!
        
        /// EAKit: hex #607D8B
        public static let blueGrey500            = Color(hexValue: 0x607D8B)!
        
        /// EAKit: hex #546E7A
        public static let blueGrey600            = Color(hexValue: 0x546E7A)!
        
        /// EAKit: hex #455A64
        public static let blueGrey700            = Color(hexValue: 0x455A64)!
        
        /// EAKit: hex #37474F
        public static let blueGrey800            = Color(hexValue: 0x37474F)!
        
        /// EAKit: hex #263238
        public static let blueGrey900            = Color(hexValue: 0x263238)!
        
        /// EAKit: hex #000000
        public static let black                    = Color(hexValue: 0x000000)!
        
        /// EAKit: hex #FFFFFF
        public static let white                    = Color(hexValue: 0xFFFFFF)!
    }
    
}

// MARK: - CSS colors
public extension Color {
    
    /// EAKit: CSS colors.
    public struct CSS {
        // http://www.w3schools.com/colors/colors_names.asp
        
        /// EAKit: hex #F0F8FF
        public static let aliceBlue                = Color(hexValue: 0xF0F8FF)!
        
        /// EAKit: hex #FAEBD7
        public static let antiqueWhite            = Color(hexValue: 0xFAEBD7)!
        
        /// EAKit: hex #00FFFF
        public static let aqua                    = Color(hexValue: 0x00FFFF)!
        
        /// EAKit: hex #7FFFD4
        public static let aquamarine            = Color(hexValue: 0x7FFFD4)!
        
        /// EAKit: hex #F0FFFF
        public static let azure                    = Color(hexValue: 0xF0FFFF)!
        
        /// EAKit: hex #F5F5DC
        public static let beige                    = Color(hexValue: 0xF5F5DC)!
        
        /// EAKit: hex #FFE4C4
        public static let bisque                = Color(hexValue: 0xFFE4C4)!
        
        /// EAKit: hex #000000
        public static let black                    = Color(hexValue: 0x000000)!
        
        /// EAKit: hex #FFEBCD
        public static let blanchedAlmond        = Color(hexValue: 0xFFEBCD)!
        
        /// EAKit: hex #0000FF
        public static let blue                    = Color(hexValue: 0x0000FF)!
        
        /// EAKit: hex #8A2BE2
        public static let blueViolet            = Color(hexValue: 0x8A2BE2)!
        
        /// EAKit: hex #A52A2A
        public static let brown                    = Color(hexValue: 0xA52A2A)!
        
        /// EAKit: hex #DEB887
        public static let burlyWood                = Color(hexValue: 0xDEB887)!
        
        /// EAKit: hex #5F9EA0
        public static let cadetBlue                = Color(hexValue: 0x5F9EA0)!
        
        /// EAKit: hex #7FFF00
        public static let chartreuse            = Color(hexValue: 0x7FFF00)!
        
        /// EAKit: hex #D2691E
        public static let chocolate                = Color(hexValue: 0xD2691E)!
        
        /// EAKit: hex #FF7F50
        public static let coral                    = Color(hexValue: 0xFF7F50)!
        
        /// EAKit: hex #6495ED
        public static let cornflowerBlue        = Color(hexValue: 0x6495ED)!
        
        /// EAKit: hex #FFF8DC
        public static let cornsilk                = Color(hexValue: 0xFFF8DC)!
        
        /// EAKit: hex #DC143C
        public static let crimson                = Color(hexValue: 0xDC143C)!
        
        /// EAKit: hex #00FFFF
        public static let cyan                    = Color(hexValue: 0x00FFFF)!
        
        /// EAKit: hex #00008B
        public static let darkBlue                = Color(hexValue: 0x00008B)!
        
        /// EAKit: hex #008B8B
        public static let darkCyan                = Color(hexValue: 0x008B8B)!
        
        /// EAKit: hex #B8860B
        public static let darkGoldenRod            = Color(hexValue: 0xB8860B)!
        
        /// EAKit: hex #A9A9A9
        public static let darkGray                = Color(hexValue: 0xA9A9A9)!
        
        /// EAKit: hex #A9A9A9
        public static let darkGrey                = Color(hexValue: 0xA9A9A9)!
        
        /// EAKit: hex #006400
        public static let darkGreen                = Color(hexValue: 0x006400)!
        
        /// EAKit: hex #BDB76B
        public static let darkKhaki                = Color(hexValue: 0xBDB76B)!
        
        /// EAKit: hex #8B008B
        public static let darkMagenta            = Color(hexValue: 0x8B008B)!
        
        /// EAKit: hex #556B2F
        public static let darkOliveGreen        = Color(hexValue: 0x556B2F)!
        
        /// EAKit: hex #FF8C00
        public static let darkOrange            = Color(hexValue: 0xFF8C00)!
        
        /// EAKit: hex #9932CC
        public static let darkOrchid            = Color(hexValue: 0x9932CC)!
        
        /// EAKit: hex #8B0000
        public static let darkRed                = Color(hexValue: 0x8B0000)!
        
        /// EAKit: hex #E9967A
        public static let darkSalmon            = Color(hexValue: 0xE9967A)!
        
        /// EAKit: hex #8FBC8F
        public static let darkSeaGreen            = Color(hexValue: 0x8FBC8F)!
        
        /// EAKit: hex #483D8B
        public static let darkSlateBlue            = Color(hexValue: 0x483D8B)!
        
        /// EAKit: hex #2F4F4F
        public static let darkSlateGray            = Color(hexValue: 0x2F4F4F)!
        
        /// EAKit: hex #2F4F4F
        public static let darkSlateGrey            = Color(hexValue: 0x2F4F4F)!
        
        /// EAKit: hex #00CED1
        public static let darkTurquoise            = Color(hexValue: 0x00CED1)!
        
        /// EAKit: hex #9400D3
        public static let darkViolet            = Color(hexValue: 0x9400D3)!
        
        /// EAKit: hex #FF1493
        public static let deepPink                = Color(hexValue: 0xFF1493)!
        
        /// EAKit: hex #00BFFF
        public static let deepSkyBlue            = Color(hexValue: 0x00BFFF)!
        
        /// EAKit: hex #696969
        public static let dimGray                = Color(hexValue: 0x696969)!
        
        /// EAKit: hex #696969
        public static let dimGrey                = Color(hexValue: 0x696969)!
        
        /// EAKit: hex #1E90FF
        public static let dodgerBlue            = Color(hexValue: 0x1E90FF)!
        
        /// EAKit: hex #B22222
        public static let fireBrick                = Color(hexValue: 0xB22222)!
        
        /// EAKit: hex #FFFAF0
        public static let floralWhite            = Color(hexValue: 0xFFFAF0)!
        
        /// EAKit: hex #228B22
        public static let forestGreen            = Color(hexValue: 0x228B22)!
        
        /// EAKit: hex #FF00FF
        public static let fuchsia                = Color(hexValue: 0xFF00FF)!
        
        /// EAKit: hex #DCDCDC
        public static let gainsboro                = Color(hexValue: 0xDCDCDC)!
        
        /// EAKit: hex #F8F8FF
        public static let ghostWhite            = Color(hexValue: 0xF8F8FF)!
        
        /// EAKit: hex #FFD700
        public static let gold                    = Color(hexValue: 0xFFD700)!
        
        /// EAKit: hex #DAA520
        public static let goldenRod                = Color(hexValue: 0xDAA520)!
        
        /// EAKit: hex #808080
        public static let gray                    = Color(hexValue: 0x808080)!
        
        /// EAKit: hex #808080
        public static let grey                    = Color(hexValue: 0x808080)!
        
        /// EAKit: hex #008000
        public static let green                    = Color(hexValue: 0x008000)!
        
        /// EAKit: hex #ADFF2F
        public static let greenYellow            = Color(hexValue: 0xADFF2F)!
        
        /// EAKit: hex #F0FFF0
        public static let honeyDew                = Color(hexValue: 0xF0FFF0)!
        
        /// EAKit: hex #FF69B4
        public static let hotPink                = Color(hexValue: 0xFF69B4)!
        
        /// EAKit: hex #CD5C5C
        public static let indianRed                = Color(hexValue: 0xCD5C5C)!
        
        /// EAKit: hex #4B0082
        public static let indigo                = Color(hexValue: 0x4B0082)!
        
        /// EAKit: hex #FFFFF0
        public static let ivory                    = Color(hexValue: 0xFFFFF0)!
        
        /// EAKit: hex #F0E68C
        public static let khaki                    = Color(hexValue: 0xF0E68C)!
        
        /// EAKit: hex #E6E6FA
        public static let lavender                = Color(hexValue: 0xE6E6FA)!
        
        /// EAKit: hex #FFF0F5
        public static let lavenderBlush            = Color(hexValue: 0xFFF0F5)!
        
        /// EAKit: hex #7CFC00
        public static let lawnGreen                = Color(hexValue: 0x7CFC00)!
        
        /// EAKit: hex #FFFACD
        public static let lemonChiffon            = Color(hexValue: 0xFFFACD)!
        
        /// EAKit: hex #ADD8E6
        public static let lightBlue                = Color(hexValue: 0xADD8E6)!
        
        /// EAKit: hex #F08080
        public static let lightCoral            = Color(hexValue: 0xF08080)!
        
        /// EAKit: hex #E0FFFF
        public static let lightCyan                = Color(hexValue: 0xE0FFFF)!
        
        /// EAKit: hex #FAFAD2
        public static let lightGoldenRodYellow    = Color(hexValue: 0xFAFAD2)!
        
        /// EAKit: hex #D3D3D3
        public static let lightGray                = Color(hexValue: 0xD3D3D3)!
        
        /// EAKit: hex #D3D3D3
        public static let lightGrey                = Color(hexValue: 0xD3D3D3)!
        
        /// EAKit: hex #90EE90
        public static let lightGreen            = Color(hexValue: 0x90EE90)!
        
        /// EAKit: hex #FFB6C1
        public static let lightPink                = Color(hexValue: 0xFFB6C1)!
        
        /// EAKit: hex #FFA07A
        public static let lightSalmon            = Color(hexValue: 0xFFA07A)!
        
        /// EAKit: hex #20B2AA
        public static let lightSeaGreen            = Color(hexValue: 0x20B2AA)!
        
        /// EAKit: hex #87CEFA
        public static let lightSkyBlue            = Color(hexValue: 0x87CEFA)!
        
        /// EAKit: hex #778899
        public static let lightSlateGray        = Color(hexValue: 0x778899)!
        
        /// EAKit: hex #778899
        public static let lightSlateGrey        = Color(hexValue: 0x778899)!
        
        /// EAKit: hex #B0C4DE
        public static let lightSteelBlue        = Color(hexValue: 0xB0C4DE)!
        
        /// EAKit: hex #FFFFE0
        public static let lightYellow            = Color(hexValue: 0xFFFFE0)!
        
        /// EAKit: hex #00FF00
        public static let lime                    = Color(hexValue: 0x00FF00)!
        
        /// EAKit: hex #32CD32
        public static let limeGreen                = Color(hexValue: 0x32CD32)!
        
        /// EAKit: hex #FAF0E6
        public static let linen                    = Color(hexValue: 0xFAF0E6)!
        
        /// EAKit: hex #FF00FF
        public static let magenta                = Color(hexValue: 0xFF00FF)!
        
        /// EAKit: hex #800000
        public static let maroon                = Color(hexValue: 0x800000)!
        
        /// EAKit: hex #66CDAA
        public static let mediumAquaMarine        = Color(hexValue: 0x66CDAA)!
        
        /// EAKit: hex #0000CD
        public static let mediumBlue            = Color(hexValue: 0x0000CD)!
        
        /// EAKit: hex #BA55D3
        public static let mediumOrchid            = Color(hexValue: 0xBA55D3)!
        
        /// EAKit: hex #9370DB
        public static let mediumPurple            = Color(hexValue: 0x9370DB)!
        
        /// EAKit: hex #3CB371
        public static let mediumSeaGreen        = Color(hexValue: 0x3CB371)!
        
        /// EAKit: hex #7B68EE
        public static let mediumSlateBlue        = Color(hexValue: 0x7B68EE)!
        
        /// EAKit: hex #00FA9A
        public static let mediumSpringGreen        = Color(hexValue: 0x00FA9A)!
        
        /// EAKit: hex #48D1CC
        public static let mediumTurquoise        = Color(hexValue: 0x48D1CC)!
        
        /// EAKit: hex #C71585
        public static let mediumVioletRed        = Color(hexValue: 0xC71585)!
        
        /// EAKit: hex #191970
        public static let midnightBlue            = Color(hexValue: 0x191970)!
        
        /// EAKit: hex #F5FFFA
        public static let mintCream                = Color(hexValue: 0xF5FFFA)!
        
        /// EAKit: hex #FFE4E1
        public static let mistyRose                = Color(hexValue: 0xFFE4E1)!
        
        /// EAKit: hex #FFE4B5
        public static let moccasin                = Color(hexValue: 0xFFE4B5)!
        
        /// EAKit: hex #FFDEAD
        public static let navajoWhite            = Color(hexValue: 0xFFDEAD)!
        
        /// EAKit: hex #000080
        public static let navy                    = Color(hexValue: 0x000080)!
        
        /// EAKit: hex #FDF5E6
        public static let oldLace                = Color(hexValue: 0xFDF5E6)!
        
        /// EAKit: hex #808000
        public static let olive                    = Color(hexValue: 0x808000)!
        
        /// EAKit: hex #6B8E23
        public static let oliveDrab                = Color(hexValue: 0x6B8E23)!
        
        /// EAKit: hex #FFA500
        public static let orange                = Color(hexValue: 0xFFA500)!
        
        /// EAKit: hex #FF4500
        public static let orangeRed                = Color(hexValue: 0xFF4500)!
        
        /// EAKit: hex #DA70D6
        public static let orchid                = Color(hexValue: 0xDA70D6)!
        
        /// EAKit: hex #EEE8AA
        public static let paleGoldenRod            = Color(hexValue: 0xEEE8AA)!
        
        /// EAKit: hex #98FB98
        public static let paleGreen                = Color(hexValue: 0x98FB98)!
        
        /// EAKit: hex #AFEEEE
        public static let paleTurquoise            = Color(hexValue: 0xAFEEEE)!
        
        /// EAKit: hex #DB7093
        public static let paleVioletRed            = Color(hexValue: 0xDB7093)!
        
        /// EAKit: hex #FFEFD5
        public static let papayaWhip            = Color(hexValue: 0xFFEFD5)!
        
        /// EAKit: hex #FFDAB9
        public static let peachPuff                = Color(hexValue: 0xFFDAB9)!
        
        /// EAKit: hex #CD853F
        public static let peru                    = Color(hexValue: 0xCD853F)!
        
        /// EAKit: hex #FFC0CB
        public static let pink                    = Color(hexValue: 0xFFC0CB)!
        
        /// EAKit: hex #DDA0DD
        public static let plum                    = Color(hexValue: 0xDDA0DD)!
        
        /// EAKit: hex #B0E0E6
        public static let powderBlue            = Color(hexValue: 0xB0E0E6)!
        
        /// EAKit: hex #800080
        public static let purple                = Color(hexValue: 0x800080)!
        
        /// EAKit: hex #663399
        public static let rebeccaPurple            = Color(hexValue: 0x663399)!
        
        /// EAKit: hex #FF0000
        public static let red                    = Color(hexValue: 0xFF0000)!
        
        /// EAKit: hex #BC8F8F
        public static let rosyBrown                = Color(hexValue: 0xBC8F8F)!
        
        /// EAKit: hex #4169E1
        public static let royalBlue                = Color(hexValue: 0x4169E1)!
        
        /// EAKit: hex #8B4513
        public static let saddleBrown            = Color(hexValue: 0x8B4513)!
        
        /// EAKit: hex #FA8072
        public static let salmon                = Color(hexValue: 0xFA8072)!
        
        /// EAKit: hex #F4A460
        public static let sandyBrown            = Color(hexValue: 0xF4A460)!
        
        /// EAKit: hex #2E8B57
        public static let seaGreen                = Color(hexValue: 0x2E8B57)!
        
        /// EAKit: hex #FFF5EE
        public static let seaShell                = Color(hexValue: 0xFFF5EE)!
        
        /// EAKit: hex #A0522D
        public static let sienna                = Color(hexValue: 0xA0522D)!
        
        /// EAKit: hex #C0C0C0
        public static let silver                = Color(hexValue: 0xC0C0C0)!
        
        /// EAKit: hex #87CEEB
        public static let skyBlue                = Color(hexValue: 0x87CEEB)!
        
        /// EAKit: hex #6A5ACD
        public static let slateBlue                = Color(hexValue: 0x6A5ACD)!
        
        /// EAKit: hex #708090
        public static let slateGray                = Color(hexValue: 0x708090)!
        
        /// EAKit: hex #708090
        public static let slateGrey                = Color(hexValue: 0x708090)!
        
        /// EAKit: hex #FFFAFA
        public static let snow                    = Color(hexValue: 0xFFFAFA)!
        
        /// EAKit: hex #00FF7F
        public static let springGreen            = Color(hexValue: 0x00FF7F)!
        
        /// EAKit: hex #4682B4
        public static let steelBlue                = Color(hexValue: 0x4682B4)!
        
        /// EAKit: hex #D2B48C
        public static let tan                    = Color(hexValue: 0xD2B48C)!
        
        /// EAKit: hex #008080
        public static let teal                    = Color(hexValue: 0x008080)!
        
        /// EAKit: hex #D8BFD8
        public static let thistle                = Color(hexValue: 0xD8BFD8)!
        
        /// EAKit: hex #FF6347
        public static let tomato                = Color(hexValue: 0xFF6347)!
        
        /// EAKit: hex #40E0D0
        public static let turquoise                = Color(hexValue: 0x40E0D0)!
        
        /// EAKit: hex #EE82EE
        public static let violet                = Color(hexValue: 0xEE82EE)!
        
        /// EAKit: hex #F5DEB3
        public static let wheat                    = Color(hexValue: 0xF5DEB3)!
        
        /// EAKit: hex #FFFFFF
        public static let white                    = Color(hexValue: 0xFFFFFF)!
        
        /// EAKit: hex #F5F5F5
        public static let whiteSmoke            = Color(hexValue: 0xF5F5F5)!
        
        /// EAKit: hex #FFFF00
        public static let yellow                = Color(hexValue: 0xFFFF00)!
        
        /// EAKit: hex #9ACD32
        public static let yellowGreen            = Color(hexValue: 0x9ACD32)!
    }
    
}

// MARK: - Flat UI colors
public extension Color {
    
    /// EAKit: Flat UI colors
    public struct FlatUI {
        // http://flatuicolors.com.
        
        /// EAKit: hex #1ABC9C
        public static let turquoise             = Color(hexValue: 0x1abc9c)!
        
        /// EAKit: hex #16A085
        public static let greenSea              = Color(hexValue: 0x16a085)!
        
        /// EAKit: hex #2ECC71
        public static let emerald               = Color(hexValue: 0x2ecc71)!
        
        /// EAKit: hex #27AE60
        public static let nephritis             = Color(hexValue: 0x27ae60)!
        
        /// EAKit: hex #3498DB
        public static let peterRiver            = Color(hexValue: 0x3498db)!
        
        /// EAKit: hex #2980B9
        public static let belizeHole            = Color(hexValue: 0x2980b9)!
        
        /// EAKit: hex #9B59B6
        public static let amethyst              = Color(hexValue: 0x9b59b6)!
        
        /// EAKit: hex #8E44AD
        public static let wisteria              = Color(hexValue: 0x8e44ad)!
        
        /// EAKit: hex #34495E
        public static let wetAsphalt            = Color(hexValue: 0x34495e)!
        
        /// EAKit: hex #2C3E50
        public static let midnightBlue          = Color(hexValue: 0x2c3e50)!
        
        /// EAKit: hex #F1C40F
        public static let sunFlower             = Color(hexValue: 0xf1c40f)!
        
        /// EAKit: hex #F39C12
        public static let flatOrange            = Color(hexValue: 0xf39c12)!
        
        /// EAKit: hex #E67E22
        public static let carrot                = Color(hexValue: 0xe67e22)!
        
        /// EAKit: hex #D35400
        public static let pumkin                = Color(hexValue: 0xd35400)!
        
        /// EAKit: hex #E74C3C
        public static let alizarin              = Color(hexValue: 0xe74c3c)!
        
        /// EAKit: hex #C0392B
        public static let pomegranate           = Color(hexValue: 0xc0392b)!
        
        /// EAKit: hex #ECF0F1
        public static let clouds                = Color(hexValue: 0xecf0f1)!
        
        /// EAKit: hex #BDC3C7
        public static let silver                = Color(hexValue: 0xbdc3c7)!
        
        /// EAKit: hex #7F8C8D
        public static let asbestos              = Color(hexValue: 0x7f8c8d)!
        
        /// EAKit: hex #95A5A6
        public static let concerte              = Color(hexValue: 0x95a5a6)!
    }
    
}

public enum CSSColor: Int {
    case aliceblue = 0xF0F8FF
    case antiquewhite = 0xFAEBD7
    case aqua = 0x00FFFF
    case aquamarine = 0x7FFFD4
    case azure = 0xF0FFFF
    case beige = 0xF5F5DC
    case bisque = 0xFFE4C4
    case black = 0x000000
    case blanchedalmond = 0xFFEBCD
    case blue = 0x0000FF
    case blueviolet = 0x8A2BE2
    case brown = 0xA52A2A
    case burlywood = 0xDEB887
    case cadetblue = 0x5F9EA0
    case chartreuse = 0x7FFF00
    case chocolate = 0xD2691E
    case coral = 0xFF7F50
    case cornflowerblue = 0x6495ED
    case cornsilk = 0xFFF8DC
    case crimson = 0xDC143C
    case darkblue = 0x00008B
    case darkcyan = 0x008B8B
    case darkgoldenrod = 0xB8860B
    case darkgray = 0xA9A9A9
    case darkgreen = 0x006400
    case darkkhaki = 0xBDB76B
    case darkmagenta = 0x8B008B
    case darkolivegreen = 0x556B2F
    case darkorange = 0xFF8C00
    case darkorchid = 0x9932CC
    case darkred = 0x8B0000
    case darksalmon = 0xE9967A
    case darkseagreen = 0x8FBC8F
    case darkslateblue = 0x483D8B
    case darkslategray = 0x2F4F4F
    case darkturquoise = 0x00CED1
    case darkviolet = 0x9400D3
    case deeppink = 0xFF1493
    case deepskyblue = 0x00BFFF
    case dimgray = 0x696969
    case dodgerblue = 0x1E90FF
    case firebrick = 0xB22222
    case floralwhite = 0xFFFAF0
    case forestgreen = 0x228B22
    case fuchsia = 0xFF00FF
    case gainsboro = 0xDCDCDC
    case ghostwhite = 0xF8F8FF
    case gold = 0xFFD700
    case goldenrod = 0xDAA520
    case gray = 0x808080
    case green = 0x008000
    case greenyellow = 0xADFF2F
    case honeydew = 0xF0FFF0
    case hotpink = 0xFF69B4
    case indianred = 0xCD5C5C
    case indigo = 0x4B0082
    case ivory = 0xFFFFF0
    case khaki = 0xF0E68C
    case lavender = 0xE6E6FA
    case lavenderblush = 0xFFF0F5
    case lawngreen = 0x7CFC00
    case lemonchiffon = 0xFFFACD
    case lightblue = 0xADD8E6
    case lightcoral = 0xF08080
    case lightcyan = 0xE0FFFF
    case lightgoldenrodyellow = 0xFAFAD2
    case lightgray = 0xD3D3D3
    case lightgreen = 0x90EE90
    case lightpink = 0xFFB6C1
    case lightsalmon = 0xFFA07A
    case lightseagreen = 0x20B2AA
    case lightskyblue = 0x87CEFA
    case lightslategray = 0x778899
    case lightsteelblue = 0xB0C4DE
    case lightyellow = 0xFFFFE0
    case lime = 0x00FF00
    case limegreen = 0x32CD32
    case linen = 0xFAF0E6
    case maroon = 0x800000
    case mediumaquamarine = 0x66CDAA
    case mediumblue = 0x0000CD
    case mediumorchid = 0xBA55D3
    case mediumpurple = 0x9370DB
    case mediumseagreen = 0x3CB371
    case mediumslateblue = 0x7B68EE
    case mediumspringgreen = 0x00FA9A
    case mediumturquoise = 0x48D1CC
    case mediumvioletred = 0xC71585
    case midnightblue = 0x191970
    case mintcream = 0xF5FFFA
    case mistyrose = 0xFFE4E1
    case moccasin = 0xFFE4B5
    case navajowhite = 0xFFDEAD
    case navy = 0x000080
    case oldlace = 0xFDF5E6
    case olive = 0x808000
    case olivedrab = 0x6B8E23
    case orange = 0xFFA500
    case orangered = 0xFF4500
    case orchid = 0xDA70D6
    case palegoldenrod = 0xEEE8AA
    case palegreen = 0x98FB98
    case paleturquoise = 0xAFEEEE
    case palevioletred = 0xDB7093
    case papayawhip = 0xFFEFD5
    case peachpuff = 0xFFDAB9
    case peru = 0xCD853F
    case pink = 0xFFC0CB
    case plum = 0xDDA0DD
    case powderblue = 0xB0E0E6
    case purple = 0x800080
    case rebeccapurple = 0x663399
    case red = 0xFF0000
    case rosybrown = 0xBC8F8F
    case royalblue = 0x4169E1
    case saddlebrown = 0x8B4513
    case salmon = 0xFA8072
    case sandybrown = 0xF4A460
    case seagreen = 0x2E8B57
    case seashell = 0xFFF5EE
    case sienna = 0xA0522D
    case silver = 0xC0C0C0
    case skyblue = 0x87CEEB
    case slateblue = 0x6A5ACD
    case slategray = 0x708090
    case snow = 0xFFFAFA
    case springgreen = 0x00FF7F
    case steelblue = 0x4682B4
    case tan = 0xD2B48C
    case teal = 0x008080
    case thistle = 0xD8BFD8
    case tomato = 0xFF6347
    case turquoise = 0x40E0D0
    case violet = 0xEE82EE
    case wheat = 0xF5DEB3
    case white = 0xFFFFFF
    case whitesmoke = 0xF5F5F5
    case yellow = 0xFFFF00
    case yellowgreen = 0x9ACD32
    // iOS extend
    case iosred = 0xFF3B30
    case iosorange = 0xFF9500
    case iosyellow = 0xFFCC00
    case iosgreen = 0x4CD964
    case iostealblue = 0x5AC8FA
    case iosblue = 0x007AFF
    case iospurple = 0x5856D6
    case iospink = 0xFF2D55
    
    public static let magenta: CSSColor = CSSColor.fuchsia
    public static let cyan: CSSColor = CSSColor.aqua
    public static let slategrey: CSSColor = CSSColor.slategray
    public static let darkgrey: CSSColor = CSSColor.darkgray
    public static let darkslategrey: CSSColor = CSSColor.darkslategray
    public static let dimgrey: CSSColor = CSSColor.dimgray
    public static let grey: CSSColor = CSSColor.gray
    public static let lightslategrey: CSSColor = CSSColor.lightslategray
    public static let lightgrey: CSSColor = CSSColor.lightgray
    
    public var color: Color {
        return Color(hexValue: self.rawValue)!
    }
}
