#encoding:utf-8
#绩效excel导出
require 'win32ole'
module Redmine
  module Export
    module Excel
        #创建excel
        def create_performance_excel(filepath)
         # initialize
          @excel = WIN32OLE::new("EXCEL.APPLICATION")
          @excel.visible = false
          @workbook = @excel.Workbooks.Add()
          @objSheet =  @excel.Sheets.Item(1)
          @row = 1
          @filepath = filepath
          if File.exist? filepath then
            File.delete filepath
          end
        end

        #主题
        def set_main_row_title(project_name)
          @objSheet.Range("A1").Value = "#{project_name}月度考核表"
          range = "A1:N1"
          #合并单元格
          @objSheet.Range(range).Merge
          #水平居中 -4108
          @objSheet.Range(range).HorizontalAlignment = -4108
          #@objSheet.Range(range).Interior.ColorIndex = 53
          #@objSheet.Range(range).Font.ColorIndex = 5
          @objSheet.Range(range).Font.Bold = true
          @objSheet.Range(range).Font.Size =14
          @row = @row + 1
        end

        #绩效概要行
        def set_performance_info(dep,user_name,month,leader_mark,rate)
          @objSheet.Range("A2").Value = "部门"
          @objSheet.Range("B2").Value = "#{dep}"
          @objSheet.Range("D2").Value = "姓名"
          @objSheet.Range("E2").Value = "#{user_name}"
          @objSheet.Range("F2").Value = "考核月份"
          @objSheet.Range("G2").Value = "#{month}"
          @objSheet.Range("H2:I2").Merge
          @objSheet.Range("J2").Value = "主管评分"
          @objSheet.Range("K2").Value = "#{leader_mark}"
          @objSheet.Range("L2").Value = "月度评级"
          @objSheet.Range("N2").Value = "#{rate}"
          @objSheet.Range("A3:N3").Merge

          @objSheet.Range("A2:N2").Font.Bold = true
          #@objSheet.Range("A2:N2").HorizontalAlignment = -4108
          @row = @row + 2
        end
        #绩效项目说明行
        def set_key_subject_title()
          @objSheet.Range("A4:N5").HorizontalAlignment = -4108
          @objSheet.Range("A4:A5").Merge
          @objSheet.Range("A4").Value = "序号"

          @objSheet.Range("B4:B5").Merge
          @objSheet.Range("B4").Value = "优先级"

          @objSheet.Range("C4:E5").Merge
          @objSheet.Range("C4").Value = "主题"
          @objSheet.Columns("C:C").ColumnWidth = 15

          @objSheet.Range("F4:H5").Merge
          @objSheet.Range("F4").Value = "目标"
          @objSheet.Columns("F:F").ColumnWidth = 15

          @objSheet.Range("I4:J5").Merge
          @objSheet.Range("I4").Value = "任务说明"
          @objSheet.Columns("I:I").ColumnWidth = 15

          @objSheet.Range("K4:L5").Merge
          @objSheet.Range("K4").Value = "综合评价"
          @objSheet.Columns("K:K").ColumnWidth = 15

          @objSheet.Range("M4:M5").Merge
          @objSheet.Range("M4").Value = "配分"

          @objSheet.Range("N4:N5").Merge
          @objSheet.Range("N4").Value = "主管评分"

          @objSheet.Range("A6:L6").Merge
          @objSheet.Range("A6").Value = "关键绩效"
          @objSheet.Range("M6").Value = "80"
          @objSheet.Range("A6:N6").HorizontalAlignment = -4108
          @objSheet.Range("A6:N6").Interior.ColorIndex = 50
          @row = @row + 3
        end
       #附加项目说明行
        def set_add_subject_title
          @objSheet.Range("A#{@row}:L#{@row}").Merge
          @objSheet.Range("A#{@row}").Value = "团队精神"
          @objSheet.Range("M#{@row}").Value = "20"
          @objSheet.Range("A#{@row}:N#{@row}").HorizontalAlignment = -4108
          @objSheet.Range("A#{@row}:N#{@row}").Interior.ColorIndex = 50
          @row = @row + 1
        end

        #增加评价
        def add_assessment(self_assessment,leader_assessment)
          @objSheet.Range("A#{@row}:N#{@row}").Merge
          @objSheet.Range("A#{@row}").Value = "自我评价"
          @objSheet.Range("A#{@row}:N#{@row}").HorizontalAlignment = -4108
          @objSheet.Range("A#{@row}:N#{@row}").Interior.ColorIndex = 50
          @row = @row + 1
          @objSheet.Range("A#{@row}:N#{@row+3}").Merge
          @objSheet.Range("A#{@row}").Value = "#{self_assessment}"
          @row = @row + 4

          @objSheet.Range("A#{@row}:N#{@row}").Merge
          @objSheet.Range("A#{@row}").Value = "主管评价"
          @objSheet.Range("A#{@row}:N#{@row}").HorizontalAlignment = -4108
          @objSheet.Range("A#{@row}:N#{@row}").Interior.ColorIndex = 50
          @row = @row + 1
          @objSheet.Range("A#{@row}:N#{@row+3}").Merge
          @objSheet.Range("A#{@row}").Value = "#{leader_assessment}"
          @row = @row + 4
        end

        #增加关键绩效项
        def add_subject_item(index,priority,subject,aim,comment,assessment,score,mark)
          aupcase = 65
          range = "#{aupcase.chr}#{@row}"

          @objSheet.Range("A#{@row}").Value = "#{index}"

          @objSheet.Range("B#{@row}").Value = "#{priority}"
          @objSheet.Range("B#{@row}").HorizontalAlignment = -4108

          @objSheet.Range("C#{@row}:E#{@row}").Merge
          @objSheet.Range("C#{@row}").Value = "#{subject}"

          @objSheet.Range("F#{@row}:H#{@row}").Merge
          @objSheet.Range("F#{@row}").Value = "#{aim}"

          @objSheet.Range("I#{@row}:J#{@row}").Merge
          @objSheet.Range("I#{@row}").Value = "#{comment}"

          @objSheet.Range("K#{@row}:L#{@row}").Merge
          @objSheet.Range("K#{@row}").Value = "#{assessment}"

          @objSheet.Range("M#{@row}").Value = "#{score}"
          @objSheet.Range("M#{@row}").HorizontalAlignment = -4108

          @objSheet.Range("N#{@row}").Value = "#{mark}"
          @objSheet.Range("N#{@row}").HorizontalAlignment = -4108
          @row = @row + 1
        end

        def close_excel
          @objSheet.Range("A1:N#{@row-1}").Borders(1).LineStyle = 1
          @objSheet.Range("A1:N#{@row-1}").Borders(2).LineStyle = 1
          @objSheet.Range("A1:N#{@row-1}").Borders(3).LineStyle = 1
          @objSheet.Range("A1:N#{@row-1}").Borders(4).LineStyle = 1
          @objSheet.Range("A2:N#{@row-1}").Font.Size =10

          @excel.ActiveWorkbook.saveas "#{@filepath}"
          @workbook.close
          @excel.quit
      end
    end
    end
end
#创建文件
# def test_performance_excel(filepath)
#   excel= Excel.new
#   excel.create_performance_excel filepath
#
#   excel.set_main_row_title("Ogame")
#   excel.set_performance_info("Ogame","Leo","5","82","良好")
#   excel.set_key_subject_title
#   5.times do|i|
#     excel.add_subject_item(i+1,"高","增加一个主题"*10,"目标版本7.25"*10,"","",30,25)
#   end
#
#   excel.set_add_subject_title
#   5.times do|i|
#     excel.add_subject_item(@row,"高","增加一个主题"*10,"目标版本7.25"*10,"","",30,25)
#   end
#   excel.close_excel
# end
# test_performance_excel("D:\\test_xx.xls")