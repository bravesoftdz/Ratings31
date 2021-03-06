object ValueReportForm: TValueReportForm
  Left = 175
  Top = 223
  Width = 699
  Height = 310
  Caption = '-'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object pnlPrgBar: TPanel
    Left = 6
    Top = 17
    Width = 842
    Height = 51
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 12
      Top = 14
      Width = 816
      Height = 19
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 230
    Width = 823
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = -19
    Top = 87
    Width = 842
    Height = 50
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbValueReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbValueReport'
    Directory = 'd:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    BeforeConnect = dbValueReportBeforeConnect
    Left = 368
    Top = 168
  end
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbValueReport'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByEstTimeOfRace'
    TableName = 'Race'
    Left = 34
    Top = 112
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 32
    Top = 208
  end
  object tblEntries: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 
      '(((IsValueWagerSelected=True and MorningLineTo1Rank>1) or (IsSpe' +
      'edSheetSelected=True and MorningLineTo1Rank>1))and (IsPrintedOnV' +
      'alueSheet = True)) or (IsTrainerSheetSelected = True)'
    DatabaseName = 'dbValueReport'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'ENTRY.DAT'
    Left = 134
    Top = 103
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 126
    Top = 158
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    UserName = 'plEntries'
    OnTraversal = plEntriesTraversal
    Left = 118
    Top = 210
    MasterDataPipelineName = 'plRacesReport'
  end
  object ppValueReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1323
    PrinterSetup.mmMarginLeft = 1323
    PrinterSetup.mmMarginRight = 1323
    PrinterSetup.mmMarginTop = 1323
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Ratings31\ValueSheet.rtm'
    Template.Format = ftASCII
    Units = utScreenPixels
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'PDFFile'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 344
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5080
      mmPrintPosition = 0
      object RaceDate: TppDBText
        UserName = 'RaceDate'
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 4657
        mmLeft = 118322
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblTitle: TppLabel
        UserName = 'lblTitle'
        Caption = 'VALUE SHEETS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25929
        mmTop = 0
        mmWidth = 27252
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5045
        mmLeft = 177536
        mmTop = 0
        mmWidth = 13653
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Of'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5045
        mmLeft = 197380
        mmTop = 0
        mmWidth = 4692
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5045
        mmLeft = 206658
        mmTop = 0
        mmWidth = 2364
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'TotalRatingReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = False
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'plEntries'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 213254
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport12: TppChildReport
          AutoStop = False
          DataPipeline = plEntries
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 635
          PrinterSetup.mmMarginLeft = 635
          PrinterSetup.mmMarginRight = 635
          PrinterSetup.mmMarginTop = 635
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\Ratings31\HospitalSheetSub.rtm'
          Template.Format = ftASCII
          Units = utPrinterPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 214630
          DataPipelineName = 'plEntries'
          object aTitleBand: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 37465
            mmPrintPosition = 0
            object RaceDesc: TppDBText
              UserName = 'RaceDesc'
              AutoSize = True
              DataField = 'RaceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 89112
              mmTop = 0
              mmWidth = 13885
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'P#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3387
              mmLeft = 3598
              mmTop = 21590
              mmWidth = 2540
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'HORSE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 8043
              mmTop = 23072
              mmWidth = 5292
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'JOCKEY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 44238
              mmTop = 23072
              mmWidth = 5927
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'M/L'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4657
              mmLeft = 127635
              mmTop = 22860
              mmWidth = 2328
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'TRAINER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 25188
              mmTop = 23072
              mmWidth = 6562
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              AutoSize = False
              Caption = '------PACE-----'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 54187
              mmTop = 26882
              mmWidth = 11430
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              AutoSize = False
              Caption = 'T/J'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 31538
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              AutoSize = False
              Caption = 'ALL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 48472
              mmTop = 26247
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              AutoSize = False
              Caption = 'DAYS LAST RACE-TRN LAY%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 3387
              mmTop = 27728
              mmWidth = 19473
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              AutoSize = False
              Caption = 'BRED SEX AGE COLOR MED'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 2963
              mmTop = 25612
              mmWidth = 20532
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = '--------TRAINER--------'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 67733
              mmTop = 24977
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'lblERL'
              AutoSize = False
              Caption = 'ERL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 54610
              mmTop = 29845
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'lblSTR'
              AutoSize = False
              Caption = 'STR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 62442
              mmTop = 29845
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              AutoSize = False
              Caption = 'ALL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 40640
              mmTop = 26247
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              AutoSize = False
              Caption = 'MT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 27093
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'lblMID'
              AutoSize = False
              Caption = 'MID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 58208
              mmTop = 29845
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'TRF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 78740
              mmTop = 27940
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              AutoSize = False
              Caption = 'CLM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 82973
              mmTop = 27940
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              AutoSize = False
              Caption = '2ND'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 71543
              mmTop = 27940
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              AutoSize = False
              Caption = '1ST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 68157
              mmTop = 27940
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'SC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 74930
              mmTop = 27940
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              AutoSize = False
              Caption = 'DC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 74930
              mmTop = 31115
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              AutoSize = False
              Caption = 'MT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 44027
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              AutoSize = False
              Caption = '2YO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 71543
              mmTop = 33655
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              AutoSize = False
              Caption = 'ON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 83185
              mmTop = 30692
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              AutoSize = False
              Caption = 'OFF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 83185
              mmTop = 33867
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel57: TppLabel
              UserName = 'Label57'
              AutoSize = False
              Caption = 'OWNER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 24553
              mmTop = 30268
              mmWidth = 5292
              BandType = 1
            end
            object RaceCondition: TppDBMemo
              UserName = 'RaceConditions'
              CharWrap = True
              DataField = 'RaceCondition'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 6138
              mmLeft = 0
              mmTop = 4022
              mmWidth = 214419
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLabel61: TppLabel
              UserName = 'Label503'
              AutoSize = False
              Caption = 'DAM SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 86995
              mmTop = 27517
              mmWidth = 6562
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              AutoSize = False
              Caption = 'RT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 74930
              mmTop = 33655
              mmWidth = 1905
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              AutoSize = False
              Caption = 'POWER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 17992
              mmTop = 31115
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText6: TppDBText
              UserName = 'RaceDesc1'
              AutoSize = True
              DataField = 'RaceNbr'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 22490
              mmTop = 0
              mmWidth = 1736
              BandType = 1
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              AutoSize = True
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4064
              mmLeft = 4931
              mmTop = 0
              mmWidth = 4657
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label3'
              Caption = 'RACE#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3725
              mmLeft = 11906
              mmTop = 0
              mmWidth = 8678
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'lblTURF'
              Caption = 'All Weather'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3725
              mmLeft = 27940
              mmTop = 0
              mmWidth = 19092
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 86995
              mmTop = 24765
              mmWidth = 2963
              BandType = 1
            end
            object lblSireTurf: TppLabel
              UserName = 'lblSireTurf'
              Caption = 'Turf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 102870
              mmTop = 29422
              mmWidth = 2752
              BandType = 1
            end
            object lblSire2yo: TppLabel
              UserName = 'lblSire2yo'
              Caption = 'Dist'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 113030
              mmTop = 29422
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'HORSE RECORDS   -   STARTS  /  WINS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 94192
              mmTop = 32808
              mmWidth = 27728
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label7'
              Caption = 'PEDIGREE RATINGS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 106892
              mmTop = 25823
              mmWidth = 14605
              BandType = 1
            end
            object ppDBText11: TppDBText
              UserName = 'RaceDesc3'
              AutoSize = True
              DataField = 'Purse'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 122302
              mmTop = 0
              mmWidth = 8678
              BandType = 1
            end
            object ppDBText16: TppDBText
              UserName = 'RaceDesc4'
              AutoSize = True
              DataField = 'DistanceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 51858
              mmTop = 0
              mmWidth = 6943
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label501'
              AutoSize = False
              Caption = 'POWER ADVANTAGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 7832
              mmTop = 34290
              mmWidth = 15240
              BandType = 1
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 'LS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124502
              mmTop = 22860
              mmWidth = 1863
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              AutoSize = False
              Caption = 'LAY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2752
              mmLeft = 67945
              mmTop = 33655
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              AutoSize = False
              Caption = 'T/O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2752
              mmLeft = 36407
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3810
              mmLeft = 203200
              mmTop = 0
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'lblSireTurf1'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 106892
              mmTop = 29422
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel63: TppLabel
              UserName = 'lblSire2yo1'
              Caption = 'All'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 118957
              mmTop = 29210
              mmWidth = 1905
              BandType = 1
            end
            object lblPowerOrder: TppLabel
              UserName = 'lblPowerOrder'
              Caption = 'Power:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 847
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object WagerSheetOrder: TppDBText
              UserName = 'WagerSheetOrder'
              AutoSize = True
              DataField = 'WagerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 11642
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 20320
              mmWidth = 214630
              BandType = 1
            end
            object lblErlPace: TppLabel
              UserName = 'lblPowerOrder2'
              Caption = 'Early:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 35348
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object lblMidPace: TppLabel
              UserName = 'lblMidPace'
              Caption = 'Middle:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 91440
              mmTop = 11642
              mmWidth = 11007
              BandType = 1
            end
            object lblLatePace: TppLabel
              UserName = 'lblLatePace'
              Caption = 'Late:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 154729
              mmTop = 11642
              mmWidth = 7832
              BandType = 1
            end
            object ErlPaceSheetOrder: TppDBText
              UserName = 'ErlPaceSheetOrder'
              AutoSize = True
              DataField = 'ErlPaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 46143
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object MidPaceSheetOrder: TppDBText
              UserName = 'MidPaceSheetOrder'
              AutoSize = True
              DataField = 'MidPaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 105622
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object LatePaceSheetOrder: TppDBText
              UserName = 'LatePaceSheetOrder'
              AutoSize = True
              DataField = 'LatePaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 164042
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 423
              mmLeft = 0
              mmTop = 37042
              mmWidth = 214630
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label11'
              AutoSize = False
              Caption = '365'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2752
              mmLeft = 43815
              mmTop = 28998
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label13'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3302
              mmLeft = 35348
              mmTop = 15875
              mmWidth = 4445
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label16'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3302
              mmLeft = 847
              mmTop = 15875
              mmWidth = 4445
              BandType = 1
            end
            object ppDBText25: TppDBText
              UserName = 'WagerSheetOrder2'
              AutoSize = True
              DataField = 'PowerGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 11642
              mmTop = 15875
              mmWidth = 17103
              BandType = 1
            end
            object ppDBText26: TppDBText
              UserName = 'ErlPaceSheetOrder1'
              AutoSize = True
              DataField = 'ErlPaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 46143
              mmTop = 15875
              mmWidth = 17103
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label17'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3302
              mmLeft = 91440
              mmTop = 15875
              mmWidth = 4445
              BandType = 1
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              AutoSize = True
              DataField = 'MidPaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 105622
              mmTop = 15875
              mmWidth = 18415
              BandType = 1
            end
            object TrainerJockeySheetOrder: TppDBText
              UserName = 'TrainerJockeySheetOrder'
              AutoSize = True
              DataField = 'TrainerJockeySheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 157269
              mmTop = 21590
              mmWidth = 7535
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label23'
              Caption = 'T/J'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3810
              mmLeft = 149225
              mmTop = 21167
              mmWidth = 3598
              BandType = 1
            end
            object ppDBText29: TppDBText
              UserName = 'DBText10'
              AutoSize = True
              DataField = 'TrainerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 157269
              mmTop = 26247
              mmWidth = 7535
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'lblT'
              Caption = 'Trn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3810
              mmLeft = 149225
              mmTop = 25612
              mmWidth = 3810
              BandType = 1
            end
            object ppLabel42: TppLabel
              UserName = 'lblMaidenSheetOrder'
              Caption = 'MDN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              Visible = False
              mmHeight = 3810
              mmLeft = 173144
              mmTop = 21167
              mmWidth = 5927
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'lblTurfSheetOrder'
              Caption = 'Turf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              Visible = False
              mmHeight = 3810
              mmLeft = 173144
              mmTop = 26035
              mmWidth = 4657
              BandType = 1
            end
            object MaidenSheetOrder: TppDBText
              UserName = 'MaidenSheetOrder'
              AutoSize = True
              DataField = 'MaidenSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 185844
              mmTop = 21590
              mmWidth = 7535
              BandType = 1
            end
            object TurfSheetOrder: TppDBText
              UserName = 'TurfSheetOrder'
              AutoSize = True
              DataField = 'TurfSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 186055
              mmTop = 25823
              mmWidth = 7535
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label21'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3302
              mmLeft = 154729
              mmTop = 15875
              mmWidth = 4445
              BandType = 1
            end
            object ppDBText32: TppDBText
              UserName = 'EarlyPace1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'EarlyPacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 53891
              mmTop = 33443
              mmWidth = 2201
              BandType = 1
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MiddlePacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 58548
              mmTop = 33443
              mmWidth = 2201
              BandType = 1
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 63628
              mmTop = 33443
              mmWidth = 2201
              BandType = 1
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SpeedPacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 123530
              mmTop = 33443
              mmWidth = 2201
              BandType = 1
            end
            object ppDBText36: TppDBText
              UserName = 'MidPaceSheetOrder1'
              AutoSize = True
              DataField = 'MidPacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 134832
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppDBText37: TppDBText
              UserName = 'LatePaceSheetOrder1'
              AutoSize = True
              DataField = 'LatePacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 189865
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppDBText38: TppDBText
              UserName = 'ErlPaceSheetOrder2'
              AutoSize = True
              DataField = 'ErlPacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 72178
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label401'
              Caption = 'BS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2540
              mmLeft = 124291
              mmTop = 25400
              mmWidth = 2032
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              Caption = 'AC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 124460
              mmTop = 28363
              mmWidth = 1905
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'BC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124248
              mmTop = 30903
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'lblLatePace1'
              Caption = 'L Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3344
              mmLeft = 179494
              mmTop = 11642
              mmWidth = 9398
              BandType = 1
            end
            object ppDBText10: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'LatePaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 164042
              mmTop = 15875
              mmWidth = 17103
              BandType = 1
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              DataField = 'LatePacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 189865
              mmTop = 15875
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'E Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 62018
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = 'M Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 123402
              mmTop = 11642
              mmWidth = 9313
              BandType = 1
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              AutoSize = True
              DataField = 'MidPacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 134832
              mmTop = 15875
              mmWidth = 14817
              BandType = 1
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              AutoSize = True
              DataField = 'ErlPacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 72178
              mmTop = 15875
              mmWidth = 14817
              BandType = 1
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 7620
              mmLeft = 32173
              mmTop = 11853
              mmWidth = 212
              BandType = 1
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 7620
              mmLeft = 88900
              mmTop = 11853
              mmWidth = 212
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'lblT1'
              Caption = 'Own'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3810
              mmLeft = 149225
              mmTop = 30692
              mmWidth = 5292
              BandType = 1
            end
            object ppDBText40: TppDBText
              UserName = 'DBText101'
              AutoSize = True
              DataField = 'OwnerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 157269
              mmTop = 30692
              mmWidth = 7535
              BandType = 1
            end
            object ppDBText42: TppDBText
              UserName = 'TurfSheetOrder1'
              AutoSize = True
              DataField = 'DistanceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3302
              mmLeft = 186267
              mmTop = 30903
              mmWidth = 7535
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'lblTurfSheetOrder1'
              Caption = 'Distance'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3810
              mmLeft = 173144
              mmTop = 30692
              mmWidth = 10160
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 64982
              mmTop = 16087
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel58: TppLabel
              UserName = 'Label58'
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 126365
              mmTop = 16087
              mmWidth = 6350
              BandType = 1
            end
            object ppLine34: TppLine
              UserName = 'Line34'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 7620
              mmLeft = 151977
              mmTop = 11218
              mmWidth = 212
              BandType = 1
            end
            object ppLabel62: TppLabel
              UserName = 'Label62'
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3387
              mmLeft = 182457
              mmTop = 15663
              mmWidth = 6350
              BandType = 1
            end
            object ppLine33: TppLine
              UserName = 'Line33'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 10372
              mmWidth = 214630
              BandType = 1
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 3810
              mmWidth = 214630
              BandType = 1
            end
          end
          object ppHeaderBand2: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object aDetailBand: TppDetailBand
            PrintCount = 12
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 15240
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 66411
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 51065
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 21167
              mmTop = 0
              mmWidth = 794
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 86254
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 121285
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ProgramNbr: TppDBText
              UserName = 'ProgramNbr'
              ShiftWithParent = True
              DataField = 'ProgramNbr'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3246
              mmLeft = 265
              mmTop = 0
              mmWidth = 3969
              BandType = 4
            end
            object Trainer: TppDBText
              UserName = 'Trainer'
              ShiftWithParent = True
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 22490
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object Jockey: TppDBText
              UserName = 'Jockey'
              ShiftWithParent = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 41275
              mmTop = 0
              mmWidth = 9102
              BandType = 4
            end
            object Med: TppDBText
              UserName = 'Med'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Med'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 18785
              mmTop = 0
              mmWidth = 2836
              BandType = 4
            end
            object Pace: TppDBText
              UserName = 'EarlyPace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'EarlyPace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2836
              mmLeft = 46525
              mmTop = 0
              mmWidth = 9567
              BandType = 4
            end
            object TotalTrnWinPct: TppDBText
              UserName = 'TotalTrnWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrnOddsWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 23622
              mmTop = 2540
              mmWidth = 16171
              BandType = 4
            end
            object TotalTrnJkyWinPct: TppDBText
              UserName = 'TotalTrnJkyWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TJMeetWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 19389
              mmTop = 2540
              mmWidth = 11303
              BandType = 4
            end
            object TotalJky30WinPct: TppDBText
              UserName = 'TotalJky30WinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalJky30WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2455
              mmLeft = 30184
              mmTop = 2540
              mmWidth = 14901
              BandType = 4
            end
            object Sex: TppDBText
              UserName = 'Sex'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Sex'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 3704
              mmTop = 3704
              mmWidth = 3006
              BandType = 4
            end
            object Age: TppDBText
              UserName = 'Age'
              ShiftWithParent = True
              DataField = 'Age'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 5821
              mmTop = 3704
              mmWidth = 2646
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'LatePace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 57447
              mmTop = 0
              mmWidth = 8424
              BandType = 4
            end
            object BredIn: TppDBText
              UserName = 'BredIn'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'BredIn'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 265
              mmTop = 3704
              mmWidth = 5122
              BandType = 4
            end
            object TotalTrnDebutWinPct: TppDBText
              UserName = 'TotalTrnDebutWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnDebutWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 67469
              mmTop = 0
              mmWidth = 3440
              BandType = 4
            end
            object MidPace: TppDBText
              UserName = 'MiddlePace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MiddlePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 50345
              mmTop = 0
              mmWidth = 10499
              BandType = 4
            end
            object TotalJkyWinPct: TppDBText
              UserName = 'TotalJkyWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJkyOddsWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 45932
              mmTop = 2540
              mmWidth = 5080
              BandType = 4
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8731
              mmLeft = 40481
              mmTop = 265
              mmWidth = 265
              BandType = 4
            end
            object TotalTrnTurfWinPct: TppDBText
              UserName = 'TotalTrnTurfWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnTurfWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 78952
              mmTop = 0
              mmWidth = 3810
              BandType = 4
            end
            object TotalTrnAftClmWinPct: TppDBText
              UserName = 'TotalTrnAftClmWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnAftClmWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 82973
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnDebutTwoWinPct: TppDBText
              UserName = 'TotalTrnDebutTwoWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnDebutTwoWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 71173
              mmTop = 0
              mmWidth = 3440
              BandType = 4
            end
            object SurfaceChange: TppVariable
              UserName = 'varSc'
              AutoSize = False
              CalcOrder = 0
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 74877
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object DistanceChange: TppVariable
              UserName = 'varDC'
              AutoSize = False
              CalcOrder = 1
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 74877
              mmTop = 4233
              mmWidth = 3175
              BandType = 4
            end
            object lblErlPos: TppLabel
              UserName = 'lblErlPos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3387
              mmLeft = 54214
              mmTop = 3704
              mmWidth = 847
              BandType = 4
            end
            object lblMidPos: TppLabel
              UserName = 'lblMidPos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 59002
              mmTop = 3704
              mmWidth = 794
              BandType = 4
            end
            object LastComment2: TppDBText
              UserName = 'LastComment2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LastComment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 2117
              mmWidth = 12700
              BandType = 4
            end
            object TotalTrn2yoWinPct: TppDBText
              UserName = 'TotalTrn2yoWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn2yoWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 71173
              mmTop = 8202
              mmWidth = 3440
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 130175
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object Equip: TppDBText
              UserName = 'Equip'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Equip'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2455
              mmLeft = 16594
              mmTop = 3598
              mmWidth = 4784
              BandType = 4
            end
            object Weight: TppDBText
              UserName = 'Weight'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Weight'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 11779
              mmTop = 3704
              mmWidth = 5419
              BandType = 4
            end
            object TotalTrnFirstJuiceWinPct: TppDBText
              UserName = 'TotalTrnFirstJuiceWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnFirstJuiceWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 67469
              mmTop = 4233
              mmWidth = 3440
              BandType = 4
            end
            object TotalTrnBlinkersOnWinPct: TppDBText
              UserName = 'TotalTrnBlinkersOnWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnBlinkersOnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 82815
              mmTop = 4233
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnBlinkersOffWinPct: TppDBText
              UserName = 'TotalTrnBlinkersOffWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnBlinkersOffWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 82815
              mmTop = 8202
              mmWidth = 3175
              BandType = 4
            end
            object TurfIndicator: TppDBText
              UserName = 'TurfIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TurfIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 78581
              mmTop = 8202
              mmWidth = 3704
              BandType = 4
            end
            object DebutIndicator: TppDBText
              UserName = 'DebutIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'DebutIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 67469
              mmTop = 8202
              mmWidth = 3440
              BandType = 4
            end
            object RouteIndicator: TppDBText
              UserName = 'RouteIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'RouteIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 74877
              mmTop = 8202
              mmWidth = 3175
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 66940
              mmTop = 3440
              mmWidth = 19315
              BandType = 4
            end
            object TurfRating: TppDBText
              UserName = 'TurfRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TurfRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 98849
              mmTop = 0
              mmWidth = 6816
              BandType = 4
            end
            object Last2Comment2: TppDBText
              UserName = 'Last2Comment2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last2Comment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 7673
              mmWidth = 13758
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 51594
              mmTop = 11377
              mmWidth = 14552
              BandType = 4
            end
            object layoffline1: TppLine
              UserName = 'layoffline1'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 529
              mmLeft = 131234
              mmTop = 4233
              mmWidth = 82550
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Pen.Style = psInsideFrame
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 15028
              mmWidth = 214630
              BandType = 4
            end
            object LastRaceDesc: TppDBText
              UserName = 'LastRaceDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LastRaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object Last2RaceDesc: TppDBText
              UserName = 'Last2RaceDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last2RaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 5080
              mmWidth = 13758
              BandType = 4
            end
            object TurfWins: TppDBText
              UserName = 'TurfWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TurfWins'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 114342
              mmTop = 9260
              mmWidth = 5842
              BandType = 4
            end
            object MudStarts: TppDBText
              UserName = 'MudStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MudStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 100246
              mmTop = 9260
              mmWidth = 6646
              BandType = 4
            end
            object MudWins: TppDBText
              UserName = 'MudWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MudWins'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 103442
              mmTop = 9260
              mmWidth = 6096
              BandType = 4
            end
            object TrkStarts: TppDBText
              UserName = 'TrkStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TrkStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 88044
              mmTop = 9260
              mmWidth = 5884
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'TrkWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TrkWins'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 91239
              mmTop = 9260
              mmWidth = 5334
              BandType = 4
            end
            object lblTrack: TppLabel
              UserName = 'Label203'
              Caption = 'Track'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2709
              mmLeft = 87048
              mmTop = 9260
              mmWidth = 4572
              BandType = 4
            end
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2381
              mmLeft = 99484
              mmTop = 9260
              mmWidth = 3440
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 87048
              mmTop = 5556
              mmWidth = 34713
              BandType = 4
            end
            object DaysLast: TppDBText
              UserName = 'DaysLast'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'DaysLast'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 4889
              mmTop = 6085
              mmWidth = 8340
              BandType = 4
            end
            object lblOnTurf: TppLabel
              UserName = 'lblOnTurf'
              Caption = 'Turf '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 112184
              mmTop = 9525
              mmWidth = 2963
              BandType = 4
            end
            object Power: TppDBText
              UserName = 'Power'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'Power'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 15070
              mmTop = 6773
              mmWidth = 5673
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'SireName1'
              ShiftWithParent = True
              DataField = 'DamSire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 86995
              mmTop = 2910
              mmWidth = 13123
              BandType = 4
            end
            object SireName: TppDBText
              UserName = 'SireName'
              ShiftWithParent = True
              DataField = 'Sire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 86995
              mmTop = 0
              mmWidth = 13123
              BandType = 4
            end
            object ML: TppDBText
              UserName = 'MorningLineDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 114385
              mmTop = 0
              mmWidth = 15579
              BandType = 4
            end
            object lblRoute: TppLabel
              UserName = 'lblRoute'
              Caption = 'Route'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2646
              mmLeft = 99484
              mmTop = 6085
              mmWidth = 4763
              BandType = 4
            end
            object RouteStarts: TppDBText
              UserName = 'RouteStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RouteStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 99187
              mmTop = 6350
              mmWidth = 7705
              BandType = 4
            end
            object RouteWins: TppDBText
              UserName = 'RouteWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RouteWins'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 102384
              mmTop = 6350
              mmWidth = 7154
              BandType = 4
            end
            object QSP1stCallRunStyle: TppDBText
              UserName = 'QSP1stCallRunStyle'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP1stCallRunStyle'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 52070
              mmTop = 11853
              mmWidth = 18542
              BandType = 4
            end
            object lblSprint: TppLabel
              UserName = 'Label4'
              Caption = 'Sprint'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2646
              mmLeft = 111125
              mmTop = 6085
              mmWidth = 4498
              BandType = 4
            end
            object SprintStarts: TppDBText
              UserName = 'SprintStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SprintStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 110448
              mmTop = 6350
              mmWidth = 7620
              BandType = 4
            end
            object SprintWins: TppDBText
              UserName = 'SprintWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SprintWins'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 113114
              mmTop = 6350
              mmWidth = 7070
              BandType = 4
            end
            object lblLife: TppLabel
              UserName = 'Label5'
              Caption = 'Life'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2709
              mmLeft = 87048
              mmTop = 6085
              mmWidth = 2709
              BandType = 4
            end
            object LifeStarts: TppDBText
              UserName = 'LifeStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LifeStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 87747
              mmTop = 6350
              mmWidth = 6181
              BandType = 4
            end
            object LifeWins: TppDBText
              UserName = 'LifeWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LifeWins'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 90943
              mmTop = 6350
              mmWidth = 5630
              BandType = 4
            end
            object HorseName: TppDBText
              UserName = 'HorseName'
              ShiftWithParent = True
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 5556
              mmTop = 0
              mmWidth = 11906
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 105834
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 97631
              mmTop = 5556
              mmWidth = 265
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 110596
              mmTop = 5556
              mmWidth = 265
              BandType = 4
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 101177
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object TotalTrnOwnWinPct: TppDBText
              UserName = 'TotalTrnOwnWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrnOwnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 19770
              mmTop = 2540
              mmWidth = 15579
              BandType = 4
            end
            object TurfStarts: TppDBText
              UserName = 'TurfStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TurfStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 111676
              mmTop = 9260
              mmWidth = 6392
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WorkLine1'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 10372
              mmWidth = 9525
              BandType = 4
            end
            object OwnerName: TppDBText
              UserName = 'OwnerName'
              ShiftWithParent = True
              DataField = 'Owner'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 22860
              mmTop = 9313
              mmWidth = 27252
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 130704
              mmTop = 10054
              mmWidth = 82550
              BandType = 4
            end
            object PowerAdvantage: TppDBText
              UserName = 'Power1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PowerAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 5546
              mmTop = 10372
              mmWidth = 15198
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 0
              mmTop = 0
              mmWidth = 214630
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WorkLine2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 131234
              mmTop = 12700
              mmWidth = 9525
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 125148
              mmTop = 3175
              mmWidth = 4498
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 66887
              mmTop = 7408
              mmWidth = 19050
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 21960
              mmTop = 8890
              mmWidth = 28840
              BandType = 4
            end
            object LatePaceAdvantageWinPct: TppDBText
              UserName = 'LatePaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LatePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 50175
              mmTop = 8202
              mmWidth = 15706
              BandType = 4
            end
            object ppLine24: TppLine
              UserName = 'Line24'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 423
              mmLeft = 52282
              mmTop = 7408
              mmWidth = 13547
              BandType = 4
            end
            object MiddlePaceAdvantageWinPct: TppDBText
              UserName = 'MiddlePaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MiddlePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 43413
              mmTop = 8202
              mmWidth = 17441
              BandType = 4
            end
            object EarlyPaceAdvantageWinPct: TppDBText
              UserName = 'EarlyPaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'EarlyPaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 39794
              mmTop = 8255
              mmWidth = 16298
              BandType = 4
            end
            object TotalTrn46To120WinPct: TppDBText
              UserName = 'TotalTrn46To120WinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn46To120WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 67098
              mmTop = 11853
              mmWidth = 3810
              BandType = 4
            end
            object ppLabel24: TppLabel
              UserName = 'Label22'
              Caption = 'PP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2328
              mmLeft = 1270
              mmTop = 9525
              mmWidth = 2328
              BandType = 4
            end
            object PostPos: TppDBText
              UserName = 'PostPos'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'PostPos'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 212
              mmTop = 12065
              mmWidth = 3387
              BandType = 4
            end
            object TotalTrn30WinPct: TppDBText
              UserName = 'TotalTrn30WinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrn30WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 12107
              mmTop = 2540
              mmWidth = 13928
              BandType = 4
            end
            object ppLine25: TppLine
              UserName = 'Line25'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 26458
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 30480
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 35560
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 45297
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 22860
              mmTop = 5292
              mmWidth = 27728
              BandType = 4
            end
            object ClassRating: TppDBText
              UserName = 'ClassRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'ClassRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 112861
              mmTop = 0
              mmWidth = 7874
              BandType = 4
            end
            object DistanceRating: TppDBText
              UserName = 'DistanceRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'DistanceRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 105876
              mmTop = 0
              mmWidth = 9906
              BandType = 4
            end
            object MudRating: TppDBText
              UserName = 'MudRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MudRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 102870
              mmTop = 0
              mmWidth = 7070
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 110279
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line31'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 116417
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object TodaysWagerWinPct: TppDBText
              UserName = 'TodaysWagerWinPct'
              AutoSize = True
              DataField = 'LastSpeed'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 117221
              mmTop = 3387
              mmWidth = 8340
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'TodaysWagerWinPct1'
              AutoSize = True
              DataField = 'BackSpeed'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 116587
              mmTop = 6350
              mmWidth = 8932
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'TodaysWagerWinPct2'
              AutoSize = True
              DataField = 'LastSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 117306
              mmTop = 3387
              mmWidth = 12446
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              AutoSize = True
              DataField = 'BackSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 116713
              mmTop = 6350
              mmWidth = 13039
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'TotalJky30WinPct1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TJ365WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 20319
              mmTop = 5927
              mmWidth = 10372
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'AvgClass'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 120016
              mmTop = 9313
              mmWidth = 7408
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'BackClass'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 119126
              mmTop = 12277
              mmWidth = 8297
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              AutoSize = True
              DataField = 'AvgClassRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 118237
              mmTop = 9313
              mmWidth = 11515
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              AutoSize = True
              DataField = 'BackClassRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 117348
              mmTop = 12277
              mmWidth = 12404
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'OwnerName1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TodaysWagerOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 86572
              mmTop = 12277
              mmWidth = 18415
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              ShiftWithParent = True
              DataField = 'TodaysWagerWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 114512
              mmTop = 12277
              mmWidth = 5503
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              ShiftWithParent = True
              DataField = 'TodaysWagerStarts'
              DataPipeline = plEntries
              DisplayFormat = '#####'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 108162
              mmTop = 12277
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'TotalTrn30WinPct1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PostPosWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 0
              mmTop = 12065
              mmWidth = 11980
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryWagerTypeBand: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3598
            mmPrintPosition = 0
            object dbWagerType: TppDBMemo
              UserName = 'dbWagerType'
              CharWrap = False
              DataField = 'BetLine'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 0
              mmTop = 0
              mmWidth = 212990
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
              4561726C79506163654F6E5072696E740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C3E02000070726F6365647572652045
              61726C79506163654F6E5072696E743B0D0A626567696E0D0A0D0A2020202020
              204561726C79506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A
              2020202020204561726C79506163652E466F6E742E556E6465726C696E65203A
              3D2046616C73653B0D0A2020202020200D0A09696620706C456E74726965735B
              274561726C795061636552616E6B275D203D2031207468656E20626567696E0D
              0A092020204561726C79506163652E466F6E742E426F6C64203A3D2054727565
              3B0D0A202020202020202020696620706C456E74726965735B27497346726F6E
              74446F75626C654C696E6572275D207468656E20626567696E0D0A0920202020
              20204561726C79506163652E466F6E742E556E6465726C696E65203A3D205472
              75653B0D0A202020202020202020656E643B200D0A202020202020656E643B20
              0D0A0D0A09696620706C456E74726965735B274561726C795061636552616E6B
              275D203D2031207468656E20626567696E0D0A092020204561726C7950616365
              2E466F6E742E426F6C64203A3D20547275653B0D0A2020202020202020206966
              20706C456E74726965735B274973547269706C654C696E6572275D207468656E
              20626567696E0D0A092020202020204561726C79506163652E466F6E742E556E
              6465726C696E65203A3D20547275653B0D0A202020202020202020656E643B20
              0D0A202020202020656E643B200D0A0920202020202020202020202020202020
              2020202020202020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              6506094561726C7950616365094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D650617546F74616C4A6B79333057696E5063744F6E5072696E
              740B50726F6772616D54797065070B747450726F63656475726506536F757263
              650C1901000070726F63656475726520546F74616C4A6B79333057696E506374
              4F6E5072696E743B0D0A626567696E0D0A0D0A20202020200D0A202020202020
              0D0A202020202020696620706C456E74726965735B27546F74616C4A6B793330
              57696E506374275D203E20706C456E74726965735B27546F74616C4A6B795769
              6E506374275D207468656E20626567696E0D0A20202020202009546F74616C4A
              6B79333057696E5063742E466F6E742E426F6C64203A3D20547275653B0D0A20
              2020202020656E6420656C73652020626567696E0D0A0909546F74616C4A6B79
              333057696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              20202020656E643B2020200D0A2020202020200D0A0D0A0D0A656E643B0D0A0D
              436F6D706F6E656E744E616D650610546F74616C4A6B79333057696E50637409
              4576656E744E616D6506074F6E5072696E74074576656E74494402200001060F
              5472614576656E7448616E646C65720B50726F6772616D4E616D650615546F74
              616C54726E57696E5063744F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F7572636506D570726F63656475726520546F
              74616C54726E57696E5063744F6E5072696E743B0D0A626567696E0D0A096966
              20706C456E74726965735B27546F74616C54726E57696E50637452616E6B275D
              203D2031207468656E20626567696E0D0A09202020546F74616C54726E57696E
              5063742E466F6E742E426F6C64203A3D20547275653B0D0A202020202020656E
              6420656C736520626567696E0D0A09202020546F74616C54726E57696E506374
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A202020202020656E643B
              200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E546F74616C5472
              6E57696E506374094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D650618546F74616C54726E4A6B7957696E5063744F6E5072696E740B5072
              6F6772616D54797065070B747450726F63656475726506536F757263650C4D01
              000070726F63656475726520546F74616C54726E4A6B7957696E5063744F6E50
              72696E743B0D0A626567696E0D0A0D0A20202020202020546F74616C54726E4A
              6B7957696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              20202020546F74616C54726E4A6B7957696E5063742E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020200D0A2020202020200D0A
              202020696620706C456E74726965735B27546F74616C54726E4A6B7957696E50
              6374275D203E203234207468656E20626567696E0D0A202020202020546F7461
              6C54726E4A6B7957696E5063742E466F6E742E426F6C64203A3D20547275653B
              0D0A202020202020546F74616C54726E4A6B7957696E5063742E466F6E742E55
              6E6465726C696E65203A3D20547275653B0D0A2020202020200D0A202020656E
              643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061154
              6F74616C54726E4A6B7957696E506374094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D65061D546F74616C54726E446562757454776F5769
              6E5063744F6E5072696E740B50726F6772616D54797065070B747450726F6365
              6475726506536F7572636506E970726F63656475726520546F74616C54726E44
              6562757454776F57696E5063744F6E5072696E743B0D0A626567696E0D0A0D0A
              202020202020696620706C456E74726965735B274465627574496E6469636174
              6F72275D203D20272A2A27207468656E20626567696E0D0A0909546F74616C54
              726E446562757454776F57696E5063742E56697369626C65203A3D2054727565
              3B0D0A09656E6420656C736520626567696E0D0A0909546F74616C54726E4465
              62757454776F57696E5063742E56697369626C65203A3D2046616C73653B0D0A
              09656E643B0D0A0D0A20202020200D0A656E643B0D0A0D436F6D706F6E656E74
              4E616D650616546F74616C54726E446562757454776F57696E50637409457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65061A546F74616C54
              726E446562757457696E5063744F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F7572636506E970726F63656475726520
              546F74616C54726E446562757457696E5063744F6E5072696E743B0D0A626567
              696E0D0A0D0A202020202020696620706C456E74726965735B27446562757449
              6E64696361746F72275D203D20272A27207468656E20626567696E0D0A092020
              20546F74616C54726E446562757457696E5063742E56697369626C65203A3D20
              547275653B0D0A09656E6420656C736520626567696E0D0A09202020546F7461
              6C54726E446562757457696E5063742E56697369626C65203A3D2046616C7365
              3B0D0A09656E643B0D0A0D0A2020200D0A2020202020200D0A656E643B0D0A0D
              436F6D706F6E656E744E616D650613546F74616C54726E446562757457696E50
              6374094576656E744E616D6506074F6E5072696E74074576656E744944022000
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650619
              546F74616C54726E5475726657696E5063744F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506E370726F6365
              6475726520546F74616C54726E5475726657696E5063744F6E5072696E743B0D
              0A626567696E0D0A20202020696620706C52616365735265706F72745B275375
              7266616365275D203D20275427207468656E20626567696E0D0A20202009546F
              74616C54726E5475726657696E5063742E56697369626C65203A3D2054727565
              3B0D0A202020656E6420656C736520626567696E0D0A20202009546F74616C54
              726E5475726657696E5063742E56697369626C65203A3D2046616C73653B0D0A
              202020656E643B0D0A2020200D0A2020202020200D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D650612546F74616C54726E5475726657696E506374
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E7661
              7253634F6E476574546578740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650CA302000070726F636564757265207661725363
              4F6E476574546578742876617220546578743A20537472696E67293B0D0A7661
              72200D0A73506374203A20737472696E673B0D0A626567696E0D0A2020207350
              6374203A3D202730273B0D0A20202076617253632E466F6E742E426F6C64203A
              3D2046616C73653B0D0A2020202020202020202020200D0A2020206966202028
              28706C456E74726965735B27497354757266546F44697274275D203D20547275
              6529207468656E20626567696E0D0A2020202020696620706C456E7472696573
              5B2754726E54757266546F4469727457696E506374275D207468656E20626567
              696E0D0A2020200920202073506374203A3D20496E74546F53747228706C456E
              74726965735B2754726E54757266546F4469727457696E506374275D293B0D0A
              2020202020656E643B2020202020202020200D0A202020656E643B0D0A202020
              0D0A202020696620202828706C456E74726965735B27497344697274546F5475
              7266275D203D205472756529207468656E20626567696E0D0A20202020206966
              20706C456E74726965735B2754726E44697274546F5475726657696E50637427
              5D203E2030207468656E20626567696E0D0A2020200920202073506374203A3D
              20496E74546F53747228706C456E74726965735B2754726E44697274546F5475
              726657696E506374275D293B0D0A2020202020656E643B202020202020202020
              0D0A202020656E643B0D0A2020200D0A2020200D0A20202020200D0A20202020
              20200D0A2020202020696620537472546F496E74287350637429203E20302074
              68656E20626567696E0D0A200954657874203A3D20735063743B0D0A20202065
              6E6420656C736520626567696E0D0A20200954657874203A3D2027273B0D0A20
              2020656E643B0D0A0D0A0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E61
              6D6506057661725363094576656E744E616D6506094F6E476574546578740745
              76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D65060E76617244434F6E476574546578740B50726F6772616D54
              797065070B747450726F63656475726506536F757263650C8402000070726F63
              65647572652076617244434F6E476574546578742876617220546578743A2053
              7472696E67293B0D0A766172200D0A73506374203A20737472696E673B0D0A62
              6567696E0D0A20202073506374203A3D202730273B0D0A20202076617244632E
              466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020202020202020
              200D0A202020696620202828706C456E74726965735B274973527465546F5370
              72275D203D205472756529207468656E20626567696E0D0A2020202020206966
              20706C456E74726965735B2754726E527465546F53707257696E506374275D20
              3E2030207468656E20626567696E0D0A20202020202020202073506374203A3D
              20496E74546F53747228706C456E74726965735B2754726E527465546F537072
              57696E506374275D293B0D0A202020202020656E643B200D0A202020656E643B
              0D0A2020200D0A2020206966202828706C456E74726965735B27497353707254
              6F527465275D203D205472756529207468656E20626567696E0D0A2020202020
              20696620706C456E74726965735B2754726E537072546F52746557696E506374
              275D203E2030207468656E20626567696E0D0A20202020202020202073506374
              203A3D20496E74546F53747228706C456E74726965735B2754726E537072546F
              52746557696E506374275D293B0D0A202020202020656E643B2020200D0A2020
              20656E643B0D0A2020200D0A20200D0A2020202020696620537472546F496E74
              287350637429203E2030207468656E20626567696E0D0A200954657874203A3D
              20735063743B0D0A202020656E6420656C736520626567696E0D0A2020095465
              7874203A3D2027273B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D0A
              0D436F6D706F6E656E744E616D6506057661724443094576656E744E616D6506
              094F6E47657454657874074576656E74494402350001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D6506114D6964646C65506163654F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F757263650C0003000070726F636564757265204D6964646C65506163654F
              6E5072696E743B0D0A626567696E0D0A0D0A094D6964646C65506163652E466F
              6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020202020204D69
              64646C65506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              202020200D0A09696620706C456E74726965735B274D6964646C655061636552
              616E6B275D203D2031207468656E20626567696E0D0A092020204D6964646C65
              506163652E466F6E742E426F6C64203A3D20547275653B0D0A20202020202020
              2020696620706C456E74726965735B27497346726F6E74446F75626C654C696E
              6572275D207468656E20626567696E0D0A092020202020204D6964646C655061
              63652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20202020
              2020202020656E643B200D0A202020202020656E643B200D0A0D0A0969662070
              6C456E74726965735B274D6964646C655061636552616E6B275D203D20312074
              68656E20626567696E0D0A092020204D6964646C65506163652E466F6E742E42
              6F6C64203A3D20547275653B0D0A202020202020202020696620706C456E7472
              6965735B2749734261636B446F75626C654C696E6572275D207468656E206265
              67696E0D0A092020202020204D6964646C65506163652E466F6E742E556E6465
              726C696E65203A3D20547275653B0D0A202020202020202020656E643B200D0A
              202020202020656E643B200D0A0D0A09696620706C456E74726965735B274D69
              64646C655061636552616E6B275D203D2031207468656E20626567696E0D0A09
              2020204D6964646C65506163652E466F6E742E426F6C64203A3D20547275653B
              0D0A202020202020202020696620706C456E74726965735B274973547269706C
              654C696E6572275D207468656E20626567696E0D0A092020202020204D696464
              6C65506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
              202020202020202020656E643B200D0A202020202020656E643B200D0A202020
              2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A4D6964646C
              6550616365094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060F4C617465506163654F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F757263650C2102000070726F636564757265
              204C617465506163654F6E5072696E743B0D0A626567696E0D0A094C61746550
              6163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020204C
              617465506163652E466F6E742E556E6465726C696E65203A3D2046616C73653B
              0D0A2020202020200D0A09696620706C456E74726965735B274C617465506163
              6552616E6B275D203D2031207468656E20626567696E0D0A2020200920204C61
              7465506163652E466F6E742E426F6C64203A3D20547275653B0D0A2020202020
              202020696620706C456E74726965735B2749734261636B446F75626C654C696E
              6572275D207468656E20626567696E0D0A092020202020204C61746550616365
              2E466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020202020
              202020656E643B200D0A202020202020656E643B200D0A2020202020200D0A09
              696620706C456E74726965735B274C6174655061636552616E6B275D203D2031
              207468656E20626567696E0D0A2020200920204C617465506163652E466F6E74
              2E426F6C64203A3D20547275653B0D0A2020202020202020696620706C456E74
              726965735B274973547269706C654C696E6572275D207468656E20626567696E
              0D0A092020202020204C617465506163652E466F6E742E556E6465726C696E65
              203A3D20547275653B0D0A202020202020202020656E643B200D0A2020202020
              20656E643B200D0A2020202020200D0A0D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D6506084C61746550616365094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D650615546F74616C4A6B7957696E5063744F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              72636506DE70726F63656475726520546F74616C4A6B7957696E5063744F6E50
              72696E743B0D0A626567696E0D0A0D0A202020696620706C456E74726965735B
              27546F74616C4A6B7957696E50637452616E6B275D203D2031207468656E2062
              6567696E0D0A202020202020546F74616C4A6B7957696E5063742E466F6E742E
              426F6C64203A3D20547275653B0D0A202020656E6420656C736520626567696E
              0D0A202020202020546F74616C4A6B7957696E5063742E466F6E742E426F6C64
              203A3D2046616C73653B0D0A20202020656E643B200D0A202020200D0A656E64
              3B0D0A0D436F6D706F6E656E744E616D65060E546F74616C4A6B7957696E5063
              74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506126C
              626C45726C506F734F6E476574546578740B50726F6772616D54797065070B74
              7450726F63656475726506536F757263650C0C02000070726F63656475726520
              6C626C45726C506F734F6E476574546578742876617220546578743A20537472
              696E67293B0D0A626567696E0D0A0D0A202054657874203A3D2027273B0D0A20
              200D0A20206C626C45726C2E466F6E742E556E6465726C696E65203A3D204661
              6C73653B0D0A2020202020202020090D0A2020696620706C456E74726965735B
              274561726C7950616365506F73275D203C3E2039393939207468656E20626567
              696E0D0A20202020696620706C456E74726965735B274561726C795061636550
              6F73275D203C3E2030207468656E20626567696E0D0A092020696620706C456E
              74726965735B274561726C7950616365506F7352616E6B275D203D2031207468
              656E20626567696E0D0A0909202054657874203A3D20272A273B0D0A09092020
              696620706C456E74726965735B2751535031737443616C6C52616E6B275D203D
              2031207468656E20626567696E0D0A202020202020202020202009096C626C45
              726C506F732E466F6E742E556E6465726C696E65203A3D20547275653B0D0A09
              092020656E6420656C736520626567696E0D0A20202020202020202020200909
              6C626C45726C506F732E466F6E742E556E6465726C696E65203A3D2046616C73
              653B0D0A202020202020202009656E643B0D0A2020202020202020656E643B0D
              0A202020202020656E643B0D0A2020656E643B0D0A2020200D0A0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D6506096C626C45726C506F73094576656E
              744E616D6506094F6E47657454657874074576656E74494402350001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D6506126C626C4D69
              64506F734F6E476574546578740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650C1F02000070726F636564757265206C626C4D
              6964506F734F6E476574546578742876617220546578743A20537472696E6729
              3B0D0A626567696E0D0A0D0A202054657874203A3D202720273B0D0A20206C62
              6C4D6964506F732E466F6E742E556E6465726C696E65203A3D2046616C73653B
              0D0A2020202020202020090D0A2020696620706C456E74726965735B274D6964
              646C6550616365506F73275D203C3E2039393939207468656E20626567696E0D
              0A2020202020696620706C456E74726965735B274D6964646C6550616365506F
              73275D203C3E2030207468656E20626567696E0D0A2020202020202020696620
              706C456E74726965735B274D6964646C6550616365506F7352616E6B275D203D
              2031207468656E20626567696E0D0A202020202020202020202054657874203A
              3D20272A273B0D0A092020202020696620706C456E74726965735B2751535032
              6E6443616C6C52616E6B275D203D2031207468656E20626567696E0D0A202020
              202020202020202009096C626C4D6964506F732E466F6E742E556E6465726C69
              6E65203A3D20547275653B0D0A0909656E6420656C736520626567696E0D0A20
              2020202020202020202009096C626C4D6964506F732E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A202020202020202009656E643B0D0A20
              20202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B2020
              20202020200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
              096C626C4D6964506F73094576656E744E616D6506094F6E4765745465787407
              4576656E74494402350001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D650618546F74616C54726E32796F57696E5063744F6E507269
              6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
              636506DC70726F63656475726520546F74616C54726E32796F57696E5063744F
              6E5072696E743B0D0A626567696E0D0A202020696620706C456E74726965735B
              27416765275D203D2032207468656E20626567696E0D0A20202009546F74616C
              54726E32596F57696E5063742E56697369626C65203A3D20547275653B0D0A20
              2020656E6420656C736520626567696E0D0A202020202020546F74616C54726E
              32596F57696E5063742E56697369626C65203A3D2046616C73653B0D0A202020
              656E643B0D0A2020200D0A2020200D0A2020202020200D0A0D0A656E643B0D0A
              0D436F6D706F6E656E744E616D650611546F74616C54726E32796F57696E5063
              74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E54
              7261696E65724F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650CB301000070726F6365647572652054726169
              6E65724F6E5072696E743B0D0A626567696E0D0A202020202020202020200D0A
              202020547261696E65722E466F6E742E426F6C64203A3D2046616C73653B0D0A
              202020547261696E65722E466F6E742E556E6465726C696E65203A3D2046616C
              73653B0D0A2020200D0A2020206966202828706C456E74726965735B2754726E
              57696E7352616E6B275D203E3D20312920616E642028706C456E74726965735B
              2754726E57696E7352616E6B275D203C3D2035302929206F720D0A2020202020
              202828706C456E74726965735B2754726E4561726E696E677352616E6B275D20
              3E3D20312920616E642028706C456E74726965735B2754726E4561726E696E67
              7352616E6B275D203C3D20353029206F720D0A20202020202028706C456E7472
              6965735B27547261696E6572526174696E6752616E6B275D203D203129292074
              68656E20626567696E0D0A202020202020547261696E65722E466F6E742E426F
              6C64203A3D20547275653B0D0A202020202020547261696E65722E466F6E742E
              556E6465726C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D650607547261696E657209457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65060D4A6F636B6579
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F757263650C8101000070726F636564757265204A6F636B65794F6E5072
              696E743B0D0A626567696E0D0A2020204A6F636B65792E466F6E742E426F6C64
              203A3D2046616C73653B0D0A2020204A6F636B65792E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020202020200D0A2020206966
              20706C456E74726965735B27497353757065724A6F636B6579275D207468656E
              20626567696E0D0A2020202020204A6F636B65792E466F6E742E426F6C64203A
              3D20547275653B0D0A2020202020204A6F636B65792E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A202020696620
              28706C456E74726965735B274A6F636B6579526174696E6752616E6B275D203D
              203129207468656E20626567696E0D0A2020202020204A6F636B65792E466F6E
              742E426F6C64203A3D20547275653B0D0A2020202020204A6F636B65792E466F
              6E742E556E6465726C696E65203A3D20547275653B0D0A202020656E643B0D0A
              2020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506064A6F63
              6B6579094576656E744E616D6506074F6E5072696E74074576656E7449440220
              0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
              164D6F726E696E674C696E65446573634F6E5072696E740B50726F6772616D54
              797065070B747450726F63656475726506536F7572636506C970726F63656475
              7265204D6F726E696E674C696E65446573634F6E5072696E743B0D0A62656769
              6E0D0A0D0A2020204D6F726E696E674C696E65446573632E466F6E742E426F6C
              64203A3D2046616C73653B0D0A20202069662020706C456E74726965735B274D
              6F726E696E674C696E65546F3152616E6B275D203D2031207468656E20626567
              696E0D0A2020202020204D6F726E696E674C696E65446573632E466F6E742E42
              6F6C64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B
              0D0A0D436F6D706F6E656E744E616D65060F4D6F726E696E674C696E65446573
              63094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061253
              756D6D6172794265666F72655072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F75726365063670726F6365647572652053756D
              6D6172794265666F72655072696E743B0D0A626567696E0D0A0D0A2020200D0A
              200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060753756D6D617279
              094576656E744E616D65060B4265666F72655072696E74074576656E74494402
              180001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
              06104F776E65724E616D654F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F757263650C1001000070726F636564757265
              204F776E65724E616D654F6E5072696E743B0D0A626567696E0D0A2020202020
              20202020200D0A2020204F776E65724E616D652E466F6E742E426F6C64203A3D
              2046616C73653B0D0A2020204F776E65724E616D652E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020202020200D0A2020206966
              20706C456E74726965735B27497353757065724F776E6572275D207468656E20
              626567696E0D0A2020202020204F776E65724E616D652E466F6E742E426F6C64
              203A3D20547275653B0D0A2020202020204F776E65724E616D652E466F6E742E
              556E6465726C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D6506094F776E65724E616D65
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506145475
              7266496E64696361746F724F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F7572636506C570726F636564757265205475
              7266496E64696361746F724F6E5072696E743B0D0A626567696E0D0A20206966
              20706C52616365735265706F72745B2753757266616365275D203D2027542720
              7468656E20626567696E0D0A2020200954757266496E64696361746F722E5669
              7369626C65203A3D20547275653B0D0A202020656E6420656C73652062656769
              6E0D0A2020200954757266496E64696361746F722E56697369626C65203A3D20
              46616C73653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D65060D54757266496E64696361746F72094576656E744E616D65
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D6506154465627574496E6469636174
              6F724F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F7572636506E470726F636564757265204465627574496E64696361
              746F724F6E5072696E743B0D0A626567696E0D0A0D0A2020204465627574496E
              64696361746F722E56697369626C65203A3D2046616C73653B0D0A2020206966
              2028706C52616365735265706F72745B275261636554797065275D203D20274D
              53572729206F722028706C52616365735265706F72745B275261636554797065
              275D203D20274D434C272920207468656E20626567696E0D0A09202020446562
              7574496E64696361746F722E56697369626C65203A3D20547275653B0D0A2020
              20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E44
              65627574496E64696361746F72094576656E744E616D6506074F6E5072696E74
              074576656E74494402200001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D650615526F757465496E64696361746F724F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              0C2601000070726F63656475726520526F757465496E64696361746F724F6E50
              72696E743B0D0A626567696E0D0A202020202020202020202020202020202020
              20202020200D0A202020526F757465496E64696361746F722E56697369626C65
              203A3D2046616C73653B0D0A2020200D0A20202069662028706C526163657352
              65706F72745B27526F757465496E64696361746F72275D203C3E202727292020
              7468656E20626567696E0D0A20202020202069662028706C5261636573526570
              6F72745B274973526F75746552616365275D203D20547275652920207468656E
              20626567696E0D0A09202020526F757465496E64696361746F722E5669736962
              6C65203A3D20547275653B0D0A202020202020656E643B200D0A202020656E64
              3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E526F757465
              496E64696361746F72094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D65060F446179734C6173744F6E5072696E740B50726F6772616D5479
              7065070B747450726F63656475726506536F757263650CA801000070726F6365
              6475726520446179734C6173744F6E5072696E743B0D0A626567696E0D0A0D0A
              09446179734C6173742E466F6E742E426F6C64203A3D2046616C73653B0D0A09
              446179734C6173742E466F6E742E556E6465726C696E65203A3D2046616C7365
              3B0D0A0D0A202020202020696620706C456E74726965735B27446179734C6173
              74275D203E203435207468656E20626567696E0D0A2020202020202020204461
              79734C6173742E466F6E742E426F6C64203A3D20547275653B0D0A2020202020
              20202020446179734C6173742E466F6E742E556E6465726C696E65203A3D2046
              616C73653B0D0A202020202020656E643B0D0A2020202020202020200D0A2020
              20202020696620706C456E74726965735B27446179734C617374275D203E2039
              30207468656E20626567696E0D0A202020202020202020446179734C6173742E
              466F6E742E426F6C64203A3D20547275653B0D0A202020202020202020446179
              734C6173742E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20
              2020202020656E643B0D0A0D0A2020202020200D0A2020202020200D0A656E64
              3B0D0A0D436F6D706F6E656E744E616D650608446179734C617374094576656E
              744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
              76656E7448616E646C65720B50726F6772616D4E616D65060C506F7765724F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F757263650C0601000070726F63656475726520506F7765724F6E5072696E74
              3B0D0A626567696E0D0A0D0A20202020696620706C456E74726965735B27506F
              77657252616E6B275D203D2031207468656E20626567696E0D0A09202020506F
              7765722E466F6E742E426F6C64203A3D20547275653B0D0A2020202020202020
              20506F7765722E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
              20202020656E6420656C736520626567696E0D0A09202020506F7765722E466F
              6E742E426F6C64203A3D2046616C73653B0D0A202020202020202020506F7765
              722E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20202065
              6E643B200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650605
              506F776572094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              6506106C626C545552464F6E476574546578740B50726F6772616D5479706507
              0B747450726F63656475726506536F757263650C4E01000070726F6365647572
              65206C626C545552464F6E476574546578742876617220546578743A20537472
              696E67293B0D0A626567696E0D0A0D0A09696620706C52616365735265706F72
              745B2753757266616365275D203D20275427207468656E20626567696E0D0A20
              20090954657874203A3D202754757266273B0D0A202020202020656E643B0D0A
              09696620706C52616365735265706F72745B2753757266616365275D203D2027
              4127207468656E20626567696E0D0A2020090954657874203A3D2027416C6C20
              57656174686572273B0D0A202020202020656E643B0D0A202020202020696620
              706C52616365735265706F72745B2753757266616365275D203D202744272074
              68656E20626567696E0D0A2020090954657874203A3D202744495254273B0D0A
              202020202020656E643B0D0A2020202020200D0A0D0A2020202020200D0A0D0A
              656E643B0D0A0D436F6D706F6E656E744E616D6506076C626C54555246094576
              656E744E616D6506094F6E47657454657874074576656E74494402350001060F
              5472614576656E7448616E646C65720B50726F6772616D4E616D650618546F74
              616C54726E4F776E57696E5063744F6E5072696E740B50726F6772616D547970
              65070B747450726F63656475726506536F757263650C3901000070726F636564
              75726520546F74616C54726E4F776E57696E5063744F6E5072696E743B0D0A62
              6567696E0D0A0D0A202020202020546F74616C54726E4F776E57696E5063742E
              466F6E742E426F6C64203A3D2046616C73653B0D0A202020202020546F74616C
              54726E4F776E57696E5063742E466F6E742E556E6465726C696E65203A3D2046
              616C73653B0D0A2020202020200D0A202020696620706C456E74726965735B27
              546F74616C54726E4F776E57696E506374275D203E203234207468656E206265
              67696E0D0A202020202020546F74616C54726E4F776E57696E5063742E466F6E
              742E426F6C64203A3D20547275653B0D0A202020202020546F74616C54726E4F
              776E57696E5063742E466F6E742E556E6465726C696E65203A3D20547275653B
              0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              650611546F74616C54726E4F776E57696E506374094576656E744E616D650607
              4F6E5072696E74074576656E74494402200001060F5472614576656E7448616E
              646C65720B50726F6772616D4E616D65061B51535031737443616C6C52756E53
              74796C654F6E476574546578740B50726F6772616D54797065070B747450726F
              63656475726506536F7572636506A270726F6365647572652051535031737443
              616C6C52756E5374796C654F6E476574546578742876617220546578743A2053
              7472696E67293B0D0A626567696E0D0A2054657874203A3D20706C456E747269
              65735B2751535031737443616C6C52756E5374796C65275D202B20272D27202B
              2020496E74546F53747228706C456E74726965735B2751535031737443616C6C
              275D293B0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
              1251535031737443616C6C52756E5374796C65094576656E744E616D6506094F
              6E47657454657874074576656E74494402350001060F5472614576656E744861
              6E646C65720B50726F6772616D4E616D65061951535031737443616C6C52756E
              5374796C654F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F7572636506D770726F636564757265205153503173744361
              6C6C52756E5374796C654F6E5072696E743B0D0A626567696E0D0A0D0A202020
              696620706C456E74726965735B274C696665537461727473275D203E20302074
              68656E20626567696E0D0A2020200951535031737443616C6C52756E5374796C
              652E56697369626C65203A3D20547275653B0D0A202020656E6420656C736520
              626567696E0D0A2020200951535031737443616C6C52756E5374796C652E5669
              7369626C65203A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D65061251535031737443616C6C52
              756E5374796C65094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D6506204D6964646C6550616365416476616E7461676557696E5063744F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F7572636506F670726F636564757265204D6964646C6550616365416476616E
              7461676557696E5063744F6E5072696E743B0D0A626567696E0D0A0D0A096966
              20706C456E74726965735B274D6964646C6550616365416476616E7461676557
              696E50637452616E6B275D203D2031207468656E20626567696E0D0A09094D69
              64646C6550616365416476616E7461676557696E5063742E466F6E742E426F6C
              64203A3D20547275653B0D0A09656E6420656C736520626567696E0D0A09094D
              6964646C6550616365416476616E7461676557696E5063742E466F6E742E426F
              6C64203A3D2046616C73653B0D0A09656E643B0D0A0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D6506194D6964646C6550616365416476616E74616765
              57696E506374094576656E744E616D6506074F6E5072696E74074576656E7449
              4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
              6D65061F4561726C7950616365416476616E7461676557696E5063744F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              72636506F770726F636564757265204561726C7950616365416476616E746167
              6557696E5063744F6E5072696E743B0D0A626567696E0D0A0D0A202020202020
              696620706C456E74726965735B274561726C7950616365416476616E74616765
              57696E50637452616E6B275D203D2031207468656E20626567696E0D0A090945
              61726C7950616365416476616E7461676557696E5063742E466F6E742E426F6C
              64203A3D20547275653B0D0A09656E6420656C736520626567696E0D0A090945
              61726C7950616365416476616E7461676557696E5063742E466F6E742E426F6C
              64203A3D2046616C73653B0D0A09656E643B0D0A0D0A656E643B0D0A0D436F6D
              706F6E656E744E616D6506184561726C7950616365416476616E746167655769
              6E506374094576656E744E616D6506074F6E5072696E74074576656E74494402
              200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
              061E4C61746550616365416476616E7461676557696E5063744F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06EE70726F636564757265204C61746550616365416476616E7461676557696E
              5063744F6E5072696E743B0D0A626567696E0D0A20696620706C456E74726965
              735B274C61746550616365416476616E7461676557696E50637452616E6B275D
              203D2031207468656E20626567696E0D0A09094C61746550616365416476616E
              7461676557696E5063742E466F6E742E426F6C64203A3D20547275653B0D0A09
              656E6420656C736520626567696E0D0A09094C61746550616365416476616E74
              61676557696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D0A09
              656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650617
              4C61746550616365416476616E7461676557696E506374094576656E744E616D
              6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D650612436C617373526174696E67
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F757263650C1501000070726F63656475726520436C617373526174696E
              674F6E5072696E743B0D0A626567696E0D0A202020436C617373526174696E67
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A202020436C6173735261
              74696E672E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20
              20202020202020200D0A20202069662028706C456E74726965735B27436C6173
              73526174696E6752616E6B275D203D203129207468656E20626567696E0D0A20
              2020202020436C617373526174696E672E466F6E742E426F6C64203A3D205472
              75653B0D0A202020202020436C617373526174696E672E466F6E742E556E6465
              726C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D
              0A0D436F6D706F6E656E744E616D65060B436C617373526174696E6709457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65061544697374616E
              6365526174696E674F6E5072696E740B50726F6772616D54797065070B747450
              726F63656475726506536F757263650C2B01000070726F636564757265204469
              7374616E6365526174696E674F6E5072696E743B0D0A626567696E0D0A202020
              44697374616E6365526174696E672E466F6E742E426F6C64203A3D2046616C73
              653B0D0A20202044697374616E6365526174696E672E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A20202020202020202020200D0A202020
              69662028706C456E74726965735B2744697374616E6365526174696E6752616E
              6B275D203D203129207468656E20626567696E0D0A2020202020204469737461
              6E6365526174696E672E466F6E742E426F6C64203A3D20547275653B0D0A2020
              2020202044697374616E6365526174696E672E466F6E742E556E6465726C696E
              65203A3D20547275653B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D
              436F6D706F6E656E744E616D65060E44697374616E6365526174696E67094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D6506115475726652
              6174696E674F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650CA301000070726F636564757265205475726652
              6174696E674F6E5072696E743B0D0A626567696E0D0A20202054757266526174
              696E672E466F6E742E426F6C64203A3D2046616C73653B0D0A20202054757266
              526174696E672E466F6E742E556E6465726C696E65203A3D2046616C73653B0D
              0A2020202020202020200D0A20202069662028706C456E74726965735B275475
              7266526174696E6752616E6B275D203D203129207468656E20626567696E0D0A
              20202020202054757266526174696E672E466F6E742E426F6C64203A3D205472
              75653B0D0A20202054757266526174696E672E466F6E742E556E6465726C696E
              65203A3D20547275653B0D0A202020656E643B0D0A0D0A202020696620706C52
              616365735265706F72745B2753757266616365275D203D20275427207468656E
              20626567696E0D0A2020200954757266526174696E672E56697369626C65203A
              3D20547275653B0D0A202020656E6420656C736520626567696E0D0A20202009
              54757266526174696E672E56697369626C65203A3D2046616C73653B0D0A2020
              20656E643B0D0A2020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D65060A54757266526174696E67094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D6506104D7564526174696E674F6E5072696E740B50726F
              6772616D54797065070B747450726F63656475726506536F757263650C0F0100
              0070726F636564757265204D7564526174696E674F6E5072696E743B0D0A6265
              67696E20200D0A2020204D7564526174696E672E466F6E742E426F6C64203A3D
              2046616C73653B0D0A2020204D7564526174696E672E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020202020200D0A2020206966
              2028706C456E74726965735B274D7564526174696E6752616E6B275D203D2031
              29207468656E20626567696E0D0A2020202020204D7564526174696E672E466F
              6E742E426F6C64203A3D20547275653B0D0A2020202020204D7564526174696E
              672E466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020656E
              643B0D0A0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
              4D7564526174696E67094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D65061A6C626C4D616964656E53686565744F726465724F6E5072696E
              740B50726F6772616D54797065070B747450726F63656475726506536F757263
              650C2201000070726F636564757265206C626C4D616964656E53686565744F72
              6465724F6E5072696E743B0D0A626567696E0D0A0D0A20200D0A202020206966
              2028706C52616365735265706F72745B275261636554797065275D203D20274D
              5357272920206F720D0A20202020202028706C52616365735265706F72745B27
              5261636554797065275D203D20274D434C2729207468656E20626567696E0D0A
              202020202020206C626C4D616964656E53686565744F726465722E5669736962
              6C65203A3D20547275653B0D0A20202020656E6420656C736520626567696E0D
              0A202020202020206C626C4D616964656E53686565744F726465722E56697369
              626C65203A3D2046616C73653B2020200D0A0D0A20202020656E643B0D0A0D0A
              0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506136C626C4D61696465
              6E53686565744F72646572094576656E744E616D6506074F6E5072696E740745
              76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D6506174D616964656E53686565744F726465724F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              0C0B01000070726F636564757265204D616964656E53686565744F726465724F
              6E5072696E743B0D0A626567696E0D0A202069662028706C5261636573526570
              6F72745B275261636554797065275D203D20274D5357272920206F720D0A2020
              2020202028706C52616365735265706F72745B275261636554797065275D203D
              20274D434C2729207468656E20626567696E0D0A202020202020204D61696465
              6E53686565744F726465722E56697369626C65203A3D20547275653B0D0A2020
              2020656E6420656C736520626567696E0D0A202020202020204D616964656E53
              686565744F726465722E56697369626C65203A3D2046616C73653B2020200D0A
              20202020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D650610
              4D616964656E53686565744F72646572094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D6506186C626C5475726653686565744F726465724F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F7572636506E470726F636564757265206C626C5475726653686565744F72
              6465724F6E5072696E743B0D0A626567696E0D0A69662028706C526163657352
              65706F72745B2753757266616365275D203D2027542729202020202020207468
              656E20626567696E0D0A202020202020206C626C5475726653686565744F7264
              65722E56697369626C65203A3D20547275653B0D0A20202020656E6420656C73
              6520626567696E0D0A202020202020206C626C5475726653686565744F726465
              722E56697369626C65203A3D2046616C73653B2020200D0A0D0A20202020656E
              643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506116C626C54
              75726653686565744F72646572094576656E744E616D6506074F6E5072696E74
              074576656E74494402200001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D6506155475726653686565744F726465724F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06D970726F636564757265205475726653686565744F726465724F6E5072696E
              743B0D0A626567696E0D0A2069662028706C52616365735265706F72745B2753
              757266616365275D203D2027542729202020202020207468656E20626567696E
              0D0A2020202020205475726653686565744F726465722E56697369626C65203A
              3D20547275653B0D0A20202020656E6420656C736520626567696E0D0A202020
              202020205475726653686565744F726465722E56697369626C65203A3D204661
              6C73653B2020200D0A20202020656E643B0D0A0D0A656E643B0D0A0D436F6D70
              6F6E656E744E616D65060E5475726653686565744F72646572094576656E744E
              616D6506074F6E5072696E74074576656E74494402200000}
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Caption = '2 Win Parlay'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Cour' +
          'ier New;}{\f1\fnil\fcharset0 Courier New;}{\f2\fnil\fcharset0 MS' +
          ' Sans Serif;}{\f3\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\f0\' +
          'fs16 $2 Win Parlay      - Restart after loss or profit > 50     ' +
          ' \par'#13#10'$4 Place Parlay  \f1   \f0 - Restart after loss or profit' +
          ' > 75    \par'#13#10'$6 Show Parlay  \f1    \f0 - Restart after loss o' +
          'r profit > 100    \par'#13#10'\f2\par'#13#10'\f3\par'#13#10'}'#13#10
        mmHeight = 11007
        mmLeft = 0
        mmTop = 1482
        mmWidth = 98849
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 32
    Top = 155
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 408
    Top = 112
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbValueReport'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race.DAT'
    Left = 496
    Top = 176
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 536
    Top = 113
  end
  object dsATrainerList: TDataSource
    DataSet = tblATrainerList
    Left = 206
    Top = 144
  end
  object plATrainerList: TppDBPipeline
    DataSource = dsATrainerList
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plATrainerList'
    Left = 213
    Top = 194
    MasterDataPipelineName = 'plEntries'
  end
  object tblATrainerList: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbValueReport'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr;PostPos;Trainer;ListType'
    MasterFields = 'TrkCode;RaceDate;RaceNbr;PostPos;Trainer;ListType'
    MasterSource = dsEntries
    TableName = 'ATrainerList'
    Left = 216
    Top = 90
  end
end
