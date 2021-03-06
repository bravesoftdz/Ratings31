unit unitProcessTSNChanges;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure ParseTSNChanges(tblR: TDBISAMTable; tblE: TDBISAMTable; sFileName: string);

procedure ParseEquibaseChanges(tblR: TDBISAMTable; tblE: TDBISAMTable; sFileName: string);
procedure ProcessTSNChanges(tblR: TDBISAMTable; tblE: TDBISAMTable);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure ProcessTSNChanges(tblR: TDBISAMTable; tblE: TDBISAMTable);

var
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;
   spath: string;
   tsFile: TSearchRec;

   sFileName: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;

begin

   try

      hLog.AddToLog('Import Todays TSN Changes ', msevOperation);

      //    bDebug := False;

      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      //   prgBar.Position := 0;
      //   pnlPrgBar.Visible := False;

      //   dtDownloadDate := Now();


      iAttributes := faAnyFile;
      sPath := TSN_LSC_PATH;
      DecodeDate(Now(), wYear, wMonth, wDay);
      sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
      sFileName := sFileName + '.scr';
      sSearch := sPath + sFileName;

      UpdateStatusBar(sSearch);
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         ParseEquibaseChanges(tblR, tblE, sPath + Trim(tsFile.Name));
         ParseTSNChanges(tblR, tblE, sPath + Trim(tsFile.Name));
      end;

      while (FindNext(tsFile) = 0) do begin
         ParseEquibaseChanges(tblR, tblE, sPath + Trim(tsFile.Name));
         ParseTSNChanges(tblR, tblE, sPath + Trim(tsFile.Name));
      end;
      FindClose(tsFile);

   except
      on E: Exception do begin
         CloseTable(tblR);
         CloseTable(tblE);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(tblR);
   CloseTable(tblE);
   ClearPrgStatusBars();
end;

procedure ParseTSNChanges(tblR: TDBISAMTable; tblE: TDBISAMTable; sFileName: string);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;
   lstSplit: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: string;

   sRace: string;

   sName: string;
   sName2: string;
   sName3: string;
   sName4: string;
   sName5: string;
   sName6: string;
   sName7: string;
   sName8: string;
   sName9: string;
   sName10: string;
   sName11: string;
   sName12: string;
   sName13: string;

   bAddLines: boolean;

   sSaveFileName: string;


   procedure InitVariables();
   begin
      sRace := '';
      sName := '';
      sName2 := '';
      sName3 := '';
      sName4 := '';
      sName5 := '';
      sName6 := '';
      sName7 := '';
      sName8 := '';
      sName9 := '';
      sName10 := '';
      sName11 := '';
      sName12 := '';
      sName13 := '';
   end;

   procedure SplitLine();
   begin
      try
         //General
         //| 1  | ELUSIVE QUALITY(93, Gone West), Gainsborough Farm, KY   |  $100,000  | 137/80  | 5/11  | 2/1  | Smarty Jones, $7,563,535  | $10,756,659
         sTmp := FastReplace(sTmp, '.', '|', True);
         sTmp := FastReplace(sTmp, ',', '|', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 1 then begin
            sRace := StringListTrim(UpperCase(lstSplit[0]));
            sName := StringListTrim(UpperCase(lstSplit[1]));
         end;

         if lstSplit.Count > 2 then begin
            sName2 := StringListTrim(UpperCase(lstSplit[2]));
         end;

         if lstSplit.Count > 3 then begin
            sName3 := StringListTrim(UpperCase(lstSplit[3]));
         end;

         if lstSplit.Count > 4 then begin
            sName4 := StringListTrim(UpperCase(lstSplit[4]));
         end;

         if lstSplit.Count > 5 then begin
            sName5 := StringListTrim(UpperCase(lstSplit[5]));
         end;

         if lstSplit.Count > 6 then begin
            sName6 := StringListTrim(UpperCase(lstSplit[6]));
         end;

         if lstSplit.Count > 7 then begin
            sName7 := StringListTrim(UpperCase(lstSplit[7]));
         end;

         if lstSplit.Count > 8 then begin
            sName8 := StringListTrim(UpperCase(lstSplit[8]));
         end;

         if lstSplit.Count > 9 then begin
            sName9 := StringListTrim(UpperCase(lstSplit[9]));
         end;

         if lstSplit.Count > 10 then begin
            sName10 := StringListTrim(UpperCase(lstSplit[10]));
         end;

         if lstSplit.Count > 11 then begin
            sName11 := StringListTrim(UpperCase(lstSplit[11]));
         end;

         if lstSplit.Count > 12 then begin
            sName12 := StringListTrim(UpperCase(lstSplit[12]));
         end;

         if lstSplit.Count > 13 then begin
            sName13 := StringListTrim(UpperCase(lstSplit[13]));
         end;

      finally
         FreeAndNil(lstSplit);
      end;

   end;

   procedure SetupKey();
   begin
      tblE.IndexName := 'ByHorseNameRaceNbr';
      tblE.SetKey();
      if (sRace = '1ST') then begin
         tblE.FieldByName('RaceNbr').Value := 1;
      end else if (sRace = '2ND') then begin
         tblE.FieldByName('RaceNbr').Value := 2;
      end else if (sRace = '3RD') then begin
         tblE.FieldByName('RaceNbr').Value := 3;
      end else if (sRace = '4TH') then begin
         tblE.FieldByName('RaceNbr').Value := 4;
      end else if (sRace = '5TH') then begin
         tblE.FieldByName('RaceNbr').Value := 5;
      end else if (sRace = '6TH') then begin
         tblE.FieldByName('RaceNbr').Value := 6;
      end else if (sRace = '7TH') then begin
         tblE.FieldByName('RaceNbr').Value := 7;
      end else if (sRace = '8TH') then begin
         tblE.FieldByName('RaceNbr').Value := 8;
      end else if (sRace = '9TH') then begin
         tblE.FieldByName('RaceNbr').Value := 9;
      end else if (sRace = '10TH') then begin
         tblE.FieldByName('RaceNbr').Value := 10;
      end else if (sRace = '11TH') then begin
         tblE.FieldByName('RaceNbr').Value := 11;
      end else if (sRace = '12TH') then begin
         tblE.FieldByName('RaceNbr').Value := 12;
      end else if (sRace = '13TH') then begin
         tblE.FieldByName('RaceNbr').Value := 13;
      end else if (sRace = '14TH') then begin
         tblE.FieldByName('RaceNbr').Value := 14;
      end else if (sRace = '15TH') then begin
         tblE.FieldByName('RaceNbr').Value := 15;
      end else if (sRace = '16TH') then begin
         tblE.FieldByName('RaceNbr').Value := 16;
      end;
   end;
begin

   try

      sSaveFileName := 'changes.txt';

      UpdateStatusBar(sFileName);

      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      sOut := HtmlExtractText(sIn, False, True, True, False);
      sOut := FastReplace(sOut, Chr(160), '', False);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         FreeAndNil(fsOut);
      end;

   finally
      FreeAndNil(fsIn);
   end;

   try
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;
      bAddLines := False;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         if (sTmp = '') then begin
            continue;
         end;

         if (sTmp = '|') then begin
            continue;
         end;

         bAddLines := False;
         if (SmartPos('1ST', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('2ND', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('3RD', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('4TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('5TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('6TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('7TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('8TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('9TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('10TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('11TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('12TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('13TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;
         if (SmartPos('14TH', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;

         if (bAddLines) then begin
            lstOut.Add(UpperCase(sTmp));
            continue;
         end;

      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;

   //
   try
      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         InitVariables();
         SplitLine();

         try
            if (sName = 'NO LATE SCRATCHES') then begin
               continue;
            end;


            if (sName <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName, msevOperation);
               end;
            end;


            if (sName2 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName2);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName2, msevOperation);
               end;
            end;

            if (sName3 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName3);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName3, msevOperation);
               end;
            end;

            if (sName4 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName4);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName4, msevOperation);
               end;

            end;

            if (sName5 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName5);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName5, msevOperation);
               end;
            end;

            if (sName6 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName6);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName6, msevOperation);
               end;
            end;

            if (sName7 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName7);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName7, msevOperation);
               end;
            end;

            if (sName8 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName8);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName8, msevOperation);
               end;
            end;

            if (sName9 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName9);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName9, msevOperation);
               end;
            end;


            if (sName10 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName10);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName10, msevOperation);
               end;
            end;

            if (sName11 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName11);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName11, msevOperation);
               end;
            end;

            if (sName12 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName12);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName12, msevOperation);
               end;
            end;

            if (sName13 <> '') then begin
               SetupKey();
               tblE.FieldByName('HorseName').Value := Trim(sName13);
               if (tblE.GotoKey()) then begin
                  tblE.Delete();
               end else begin
                  hLog.AddToLog(sName13, msevOperation);
               end;
            end;

         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
            end;
         end;
      end;

   finally
      FreeAndNil(lstIn);
      UpdateStatusBar('');
   end;

end;

procedure ParseEquibaseChanges(tblR: TDBISAMTable; tblE: TDBISAMTable; sFileName: string);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;
   lstSplit: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: string;

   sRace: string;

   sName: string;
   sRaceNumber: string;
   sType: string;
   sProgramNumber: string;
   sTrkCode: string;
   sHorseName: string;
   sReason: string;
   sOldValue: string;
   sNewValue: string;
   sRaceDate: string;

   dtRaceDate: TDateTime;

   bAddLines: boolean;

   sSaveFileName: string;

   iPos: integer;

   procedure InitVariables();
   begin
      sType := '';
      sTrkCode := '';
      sHorseName := '';
      sRaceNumber := '';
      sOldValue := '';
      sNewValue := '';
      sReason := '';
      sRaceDate := '';
   end;

   procedure SplitLine();
   begin
      try

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 1 then begin
            sType := StringListTrim(UpperCase(lstSplit[0]));
         end;

         if (sType = 'RC') then begin
            sRaceDate := StringListTrim(UpperCase(lstSplit[1]));
            dtRaceDate := Str2Date(sRaceDate);
         end;

         if (sType = 'HC') then begin
            sTrkCode := StringListTrim(UpperCase(lstSplit[1]));
            sRaceNumber := StringListTrim(UpperCase(lstSplit[2]));
            sProgramNumber := StringListTrim(UpperCase(lstSplit[3]));
            sHorseName := StringListTrim(UpperCase(lstSplit[4]));
            sReason := StringListTrim(UpperCase(lstSplit[5]));
            sOldValue := StringListTrim(UpperCase(lstSplit[6]));
            sNewValue := StringListTrim(UpperCase(lstSplit[7]));

         end;
         if (sType = 'TC') then begin
            sTrkCode := StringListTrim(UpperCase(lstSplit[1]));
            sRaceNumber := StringListTrim(UpperCase(lstSplit[2]));
            sReason := StringListTrim(UpperCase(lstSplit[3]));
            sOldValue := StringListTrim(UpperCase(lstSplit[4]));
            sNewValue := StringListTrim(UpperCase(lstSplit[5]));

         end;


      finally
         FreeAndNil(lstSplit);
      end;

   end;                                                           

   procedure SetupKey();
   begin
      tblE.IndexName := 'ByHorseNameRaceNbr';
      tblE.SetKey();
      tblE.FieldByName('RaceNbr').Value := atoi(sRaceNumber);
      tblE.FieldByName('HorseName').Value := sHorseName;
   end;

   procedure SetupRaceKey();
   begin
      tblR.IndexName := '';
      tblR.SetKey();
      tblR.FieldByName('TrkCode').Value := sTrkCode;
      tblR.FieldByName('RaceDate').Value := dtRaceDate;
      tblr.FieldByName('RaceNbr').Value := atoi(sRaceNumber);
   end;
begin





   //
   try
      lstIn := TStringList.Create;
      lstIn.LoadFromFile('c:\KSKDownloads\Equibase\eqbLateChanges.txt');

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         InitVariables();
         SplitLine();

         try
            if (sType = 'TC') then begin
               if sReason = 'COURSE' then begin
                  SetupRaceKey();
                  if (tblR.GotoKey()) then begin

                     if (sNewValue = 'ALL WEATHER TRACK') then begin
                        tblR.Edit();

                        tblR.FieldByName('Surface').Value := 'A';

                        if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
                        end;

                        if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
                        end;

                        tblR.Post();
                        continue;
                     end;

                     if (sNewValue = 'DIRT') then begin
                        tblR.Edit();

                        tblR.FieldByName('Surface').Value := 'D';

                        if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
                        end;

                        if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
                           tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
                           tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
                        end;

                        tblR.Post();
                        continue;
                     end;
                  end;
               end;
            end;

            if (sType = 'TC') then begin
               iPos := SmartPos('CANCELLED', sReason);
               if (iPos > 0) then begin
                  SetupRaceKey();
                  if (tblR.GotoKey()) then begin

                     //tblR.Edit();
                     //tblR.FieldByName('TypeOfRace').Value := 'C';
                     //tblR.Post();
                     tblR.Delete();
                  end;
               end;
            end;



            if (sType = 'HC') then begin

               if sReason = 'SCRATCHED' then begin
                  SetupKey();
                  tblE.FieldByName('HorseName').Value := Trim(sHorseName);
                  if (tblE.GotoKey()) then begin
                     tblE.Delete();
                  end else begin
                     hLog.AddToLog('No Horse Found' + sName, msevOperation);
                  end;
               end;

               if sReason = 'JOCKEY' then begin
                  SetupKey();
                  tblE.FieldByName('HorseName').Value := Trim(sHorseName);
                  if (tblE.GotoKey()) then begin
                     tblE.Edit();
                     tblE.FieldByName('Jockey').Value := sNewValue;
                     tblE.Post();
                  end else begin
                     //hLog.AddToLog('No Horse Found' + sName, msevOperation);
                  end;
               end;

               if sReason = 'TRAINER' then begin
                  SetupKey();
                  tblE.FieldByName('HorseName').Value := Trim(sHorseName);
                  if (tblE.GotoKey()) then begin
                     tblE.Edit();
                     tblE.FieldByName('Trainer').Value := sNewValue;
                     tblE.Post();
                  end else begin
                    // hLog.AddToLog('No Horse Found' + sName, msevOperation);
                  end;
               end;

            end;


         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
            end;
         end;
      end;

   finally
      FreeAndNil(lstIn);
      UpdateStatusBar('');
   end;


end;






end.

