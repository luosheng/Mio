//
//  Themes.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

let themeBuiltinDark = """
#define Ansi_0_Color #000000
#define Ansi_1_Color #bb0000
#define Ansi_10_Color #55ff55
#define Ansi_11_Color #ffff55
#define Ansi_12_Color #5555ff
#define Ansi_13_Color #ff55ff
#define Ansi_14_Color #55ffff
#define Ansi_15_Color #ffffff
#define Ansi_2_Color #00bb00
#define Ansi_3_Color #bbbb00
#define Ansi_4_Color #0000bb
#define Ansi_5_Color #bb00bb
#define Ansi_6_Color #00bbbb
#define Ansi_7_Color #bbbbbb
#define Ansi_8_Color #555555
#define Ansi_9_Color #ff5555
#define Background_Color #000000
#define Badge_Color #ff0000
#define Bold_Color #ffffff
#define Cursor_Color #bbbbbb
#define Cursor_Guide_Color #a6e8ff
#define Cursor_Text_Color #ffffff
#define Foreground_Color #bbbbbb
#define Link_Color #0645ad
#define Selected_Text_Color #000000
#define Selection_Color #b5d5ff
"""

let themeBuiltinLight = """
#define Ansi_0_Color #000000
#define Ansi_1_Color #bb0000
#define Ansi_10_Color #55ff55
#define Ansi_11_Color #ffff55
#define Ansi_12_Color #5555ff
#define Ansi_13_Color #ff55ff
#define Ansi_14_Color #55ffff
#define Ansi_15_Color #ffffff
#define Ansi_2_Color #00bb00
#define Ansi_3_Color #bbbb00
#define Ansi_4_Color #0000bb
#define Ansi_5_Color #bb00bb
#define Ansi_6_Color #00bbbb
#define Ansi_7_Color #bbbbbb
#define Ansi_8_Color #555555
#define Ansi_9_Color #ff5555
#define Background_Color #ffffff
#define Badge_Color #ff0000
#define Bold_Color #000000
#define Cursor_Color #000000
#define Cursor_Guide_Color #a6e8ff
#define Cursor_Text_Color #ffffff
#define Foreground_Color #000000
#define Link_Color #0645ad
#define Selected_Text_Color #000000
#define Selection_Color #b5d5ff
"""

struct Themes {
  static let light: ThemeColor = ThemeColor.fromXrdb(title: "Light", xrdb: themeBuiltinLight)!
  static let dark: ThemeColor = ThemeColor.fromXrdb(title: "Dark", xrdb: themeBuiltinDark)!
}