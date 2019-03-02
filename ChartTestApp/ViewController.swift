//
//  ViewController.swift
//  ChartTestApp
//
//  Created by 植田圭祐 on 2019/03/02.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    //グラフに使うやつ
    var chart: CombinedChartView!
    var lineDataSet: LineChartDataSet!
    var bubbleDataSet: BubbleChartDataSet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //combinedDataを結合グラフに設定
        let combinedData = CombinedChartData()
        
        //結合グラフに対してgenerateLineData()で線グラフのデータを読み出す
        combinedData.lineData = generateLineData()
        
        //グラフのサイズ、座標を設定
        chart = CombinedChartView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        
        //chartのデータにcombinedData（グラフデータ）を挿入する
        chart.data = combinedData
        
        //chartを出力するよ
        self.view.addSubview(chart)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //グラフを作って返す
    func generateLineData() -> LineChartData
    {
        //データ
        let values: [Double] =  [0,254,321,512,214,444,967,101,765,228,726,
                                 253,20,123,512,448,557,223,465,291,979,134,
                                 864,481,405,711,1106,411,455,761]
        
        let date: [Double] = [1,2,3,4,5,6,7,8,9,10,
                              11,12,13,14,15,16,17,18,19,20,
                              21,22,23,24,25,26,27,28,29,30]
        
        print(values.count)
        print(date.count)
        //DataSetを行うために必要なEntry変数を作成（複数必要っぽいので配列で管理）
        //for in文でEntry変数に座標データを格納
        var entries: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            entries.append(ChartDataEntry(x: date[i], y: value, icon: UIImage(named: "icon",
                                                                              in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        //データを返す為の変数をせんげん
        var lineGetData: [LineChartDataSet] = Array()
        
        //データの数値と名前を決定（リストにデータを格納する為の成形）
        lineDataSet = LineChartDataSet(values: entries, label: "Line chart TestData")
        lineDataSet.drawIconsEnabled = false
        
        //グラフに線とまるの色変更
        lineDataSet.colors = [NSUIColor.red]
        lineDataSet.circleColors = [NSUIColor.red]
        
        //作ったデータを配列にガンガン格納していく
        lineGetData.append(lineDataSet)
        
        //データお返し
        return LineChartData(dataSets: lineGetData)
    }
}

