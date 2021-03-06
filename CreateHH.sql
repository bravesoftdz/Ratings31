/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "HorseHistory"
(
   "TrkCode" VARCHAR(3) NOT NULL DEFAULT '0',
   "RaceDate" DATE NOT NULL,
   "RaceNbr" SMALLINT NOT NULL,
   "PostPos" SMALLINT NOT NULL,
   "RangeRaceDate" DATE,
   "RaceType" VARCHAR(10),
   "TypeOfRace" VARCHAR(1) DEFAULT 'T',
   "Surface" VARCHAR(1) DEFAULT 'D',
   "TrkCond" VARCHAR(2) DEFAULT 'FT',
   "DistanceInFurlongs" FLOAT DEFAULT 0,
   "Purse" FLOAT DEFAULT 0,
   "ClaimingPrice" FLOAT DEFAULT 0,
   "ProgramNbr" VARCHAR(10),
   "ProgNbrSort" SMALLINT DEFAULT 0,
   "MorningLineDesc" VARCHAR(6),
   "MorningLineTo1" FLOAT DEFAULT 0,
   "MorningLineTo1Rank" SMALLINT DEFAULT 0,
   "FinishPos" SMALLINT DEFAULT 0,
   "Odds" FLOAT DEFAULT 0,
   "IsFavorite" BOOLEAN DEFAULT False,
   "HorseName" VARCHAR(25),
   "HorseNbr" SMALLINT DEFAULT 0,
   "Sex" VARCHAR(1),
   "Age" SMALLINT DEFAULT 0,
   "Equip" VARCHAR(10),
   "Med" VARCHAR(5),
   "IsFirstTimeJuice" BOOLEAN DEFAULT False,
   "IsSecondTimeJuice" BOOLEAN DEFAULT False,
   "IsDebut" BOOLEAN DEFAULT False,
   "IsDebutTwo" BOOLEAN DEFAULT False,
   "IsTurfDebut" BOOLEAN DEFAULT False,
   "DebutIndicator" VARCHAR(2),
   "TurfIndicator" VARCHAR(2),
   "MudIndicator" VARCHAR(2),
   "RouteIndicator" VARCHAR(2),
   "IsClaimed1Back" BOOLEAN DEFAULT False,
   "IsClaimed2Back" BOOLEAN DEFAULT False,
   "IsDirtToTurf" BOOLEAN DEFAULT False,
   "IsTurfToDirt" BOOLEAN DEFAULT False,
   "IsSprToRte" BOOLEAN DEFAULT False,
   "IsRteToSpr" BOOLEAN DEFAULT False,
   "DaysLast" SMALLINT DEFAULT 0,
   "DaysLastWork" SMALLINT DEFAULT 0,
   "DaysLastWork2" SMALLINT DEFAULT 0,
   "DaysLastWork3" SMALLINT DEFAULT 0,
   "NbrWorksLast" SMALLINT DEFAULT 0,
   "StartsWorks21" SMALLINT DEFAULT 0,
   "JkyEquibaseKey" VARCHAR(10),
   "TrnEquibaseKey" VARCHAR(10),
   "SireName" VARCHAR(16),
   "DamSireName" VARCHAR(16),
   "DamName" VARCHAR(25),
   "BredIn" VARCHAR(6),
   "Owner" VARCHAR(45),
   "Breeder" VARCHAR(67),
   "LastSpeed" SMALLINT DEFAULT 0,
   "LastSpeedRank" SMALLINT DEFAULT 0,
   "Power" FLOAT DEFAULT 0,
   "PowerRank" SMALLINT DEFAULT 0,
   "BackSpeed" SMALLINT DEFAULT 0,
   "BackSpeedRank" SMALLINT DEFAULT 0,
   "EarlyPace" FLOAT DEFAULT 0,
   "EarlyPaceRank" SMALLINT DEFAULT 0,
   "EarlyPacePos" FLOAT DEFAULT 9999,
   "EarlyPacePosRank" SMALLINT DEFAULT 0,
   "MiddlePace" FLOAT DEFAULT 0,
   "MiddlePaceRank" SMALLINT DEFAULT 0,
   "MiddlePacePos" FLOAT DEFAULT 9999,
   "MiddlePacePosRank" SMALLINT DEFAULT 0,
   "LatePace" FLOAT DEFAULT 0,
   "LatePaceRank" SMALLINT DEFAULT 0,
   "LatePacePos" FLOAT DEFAULT 9999,
   "LatePacePosRank" SMALLINT DEFAULT 0,
   "FinishPacePos" FLOAT DEFAULT 0,
   "FinishPacePosRank" SMALLINT DEFAULT 0,
   "AvgClass" FLOAT DEFAULT 0,
   "AvgClassRank" SMALLINT DEFAULT 0,
   "FinalOrderKey" VARCHAR(30) DEFAULT '0',
   "FinalWinPct" FLOAT DEFAULT 0,
   "FinalWinPctRank" SMALLINT DEFAULT 0,
   "FinalValueBet" FLOAT DEFAULT 0,
   "PrimaryOrderKey" VARCHAR(30),
   "PrimaryWinPct" FLOAT DEFAULT 0,
   "PrimaryWinPctRank" SMALLINT DEFAULT 0,
   "PrimaryValueBet" FLOAT DEFAULT 0,
   "SecondaryOrderKey" VARCHAR(30),
   "SecondaryWinPct" FLOAT DEFAULT 0,
   "SecondaryWinPctRank" SMALLINT DEFAULT 0,
   "SecondaryValueBet" FLOAT DEFAULT 0,
   "DefaultOrderKey" VARCHAR(30),
   "DefaultWinPct" FLOAT DEFAULT 0,
   "DefaultWinPctRank" SMALLINT DEFAULT 0,
   "DefaultValueBet" FLOAT DEFAULT 0,
   "AvgSpeed" SMALLINT DEFAULT 0,
   "AvgSpeedRank" SMALLINT DEFAULT 0,
   "AvgClassRating" SMALLINT DEFAULT 0,
   "AvgClassRatingRank" SMALLINT DEFAULT 0,
   "BackClass" SMALLINT DEFAULT 0,
   "BackClassRank" SMALLINT DEFAULT 0,
   "LastClass" SMALLINT DEFAULT 0,
   "LastClassRank" SMALLINT DEFAULT 0,
   "IsDollar" BOOLEAN DEFAULT False,
   "IsDoubleDollar" BOOLEAN DEFAULT False,
   "IsFrontDoubleLiner0" BOOLEAN DEFAULT False,
   "IsFrontDoubleLiner1" BOOLEAN DEFAULT False,
   "IsFrontDoubleLiner2" BOOLEAN DEFAULT False,
   "IsFrontDoubleLiner3" BOOLEAN DEFAULT False,
   "IsBackDoubleLiner0" BOOLEAN DEFAULT False,
   "IsBackDoubleLiner1" BOOLEAN DEFAULT False,
   "IsBackDoubleLiner2" BOOLEAN DEFAULT False,
   "IsBackDoubleLiner3" BOOLEAN DEFAULT False,
   "IsTripleLiner0" BOOLEAN DEFAULT False,
   "IsTripleLiner1" BOOLEAN DEFAULT False,
   "IsTripleLiner2" BOOLEAN DEFAULT False,
   "IsTripleLiner3" BOOLEAN DEFAULT False,
   "IsFrontDoubleLiner" BOOLEAN DEFAULT False,
   "IsBackDoubleLiner" BOOLEAN DEFAULT False,
   "IsTripleDot" BOOLEAN DEFAULT False,
   "IsFrontDoubleDot" BOOLEAN DEFAULT False,
   "IsBackDoubleDot" BOOLEAN DEFAULT False,
   "IsTripleLiner" BOOLEAN DEFAULT False,
   "IsLayoffAndUp" BOOLEAN DEFAULT False,
   "IsClaimedAndUp" BOOLEAN DEFAULT False,
   "IsClaimedAndDown" BOOLEAN DEFAULT False,
   "IsFirstTimeClaiming" BOOLEAN DEFAULT False,
   "IsBelowClaimedPrice" BOOLEAN DEFAULT False,
   "AngleDesc" VARCHAR(100),
   "IsBlinkersOn" BOOLEAN DEFAULT False,
   "IsBlinkersOff" BOOLEAN DEFAULT False,
   "LastEquip" VARCHAR(7),
   "EstTimeOfRace" TIME,
   "EstTimeOfFirstRace" TIME,
   "NbrDebutStarters" SMALLINT,
   "AvgPurse" FLOAT DEFAULT 0,
   "Entry" VARCHAR(5),
   "ProgramNbrSort" SMALLINT,
   "IsScratched" BOOLEAN DEFAULT False,
   "Color" VARCHAR(10),
   "Weight" SMALLINT,
   "EstMorningLineOrderKey" VARCHAR(30),
   "EstMorningLineWinPct" FLOAT DEFAULT 0,
   "EstMorningLineValueBet" FLOAT DEFAULT 0,
   "EarlyPaceAdvantage" FLOAT DEFAULT 0,
   "MiddlePaceAdvantage" FLOAT DEFAULT 0,
   "LatePaceAdvantage" FLOAT DEFAULT 0,
   "LifeStarts" SMALLINT DEFAULT 0,
   "LifeWins" SMALLINT DEFAULT 0,
   "TurfStarts" SMALLINT DEFAULT 0,
   "TurfWins" SMALLINT DEFAULT 0,
   "MudStarts" SMALLINT DEFAULT 0,
   "MudWins" SMALLINT DEFAULT 0,
   "TrkStarts" SMALLINT DEFAULT 0,
   "TrkWins" SMALLINT DEFAULT 0,
   "RouteStarts" SMALLINT,
   "RouteWins" SMALLINT,
   "SprintStarts" SMALLINT,
   "SprintWins" SMALLINT,
   "QSP1stCall" SMALLINT,
   "QSP1stCallRank" SMALLINT,
   "KSP1stCall" INTEGER,
   "KSP1stCallRank" SMALLINT,
   "QSP1stCallRunStyle" VARCHAR(2),
   "WagerAmt" FLOAT,
   "WinWagerAmt" FLOAT,
   "PlcWagerAmt" FLOAT,
   "ShoWagerAmt" FLOAT,
   "TodaysWagerOrderKey" VARCHAR(30),
   "IsUpInClass" BOOLEAN DEFAULT False,
   "IsDownInClass" BOOLEAN DEFAULT False,
   "Is1stClaiming" BOOLEAN DEFAULT False,
   "Is1stMCL" BOOLEAN DEFAULT False,
   "IsHiddenWorkout" BOOLEAN DEFAULT False,
   "Is1stAfterLayoff" BOOLEAN DEFAULT False,
   "Is2ndAfterLayoff" BOOLEAN DEFAULT False,
   "Is3rdAfterLayoff" BOOLEAN DEFAULT False,
   "IsDirtToTurfToDirtAfterLayoff" BOOLEAN DEFAULT False,
   "IsTurfToDirtToTurfAfterLayoff" BOOLEAN DEFAULT False,
   "IsRouteToSprintToRouteAfterLayoff" BOOLEAN DEFAULT False,
   "IsSprintToRouteToSprintAfterLayoff" BOOLEAN DEFAULT False,
   "IsOnlySpeed" BOOLEAN DEFAULT False,
   "IsProvenSpeed" BOOLEAN DEFAULT False,
   "IsProvenSpeedPlus" BOOLEAN DEFAULT False,
   "IsXtremeSpeed" BOOLEAN DEFAULT False,
   "IsLastRaceTurnMove" BOOLEAN DEFAULT False,
   "IsLastRaceFinalFurlongMove" BOOLEAN DEFAULT False,
   "IsPrevToLastRaceTurnMove" BOOLEAN DEFAULT False,
   "IsPrevToLastRaceFinalFurlongMove" BOOLEAN DEFAULT False,
   "Is2yoBred" BOOLEAN DEFAULT False,
   "Is1stBred" BOOLEAN DEFAULT False,
   "IsTurfBred" BOOLEAN DEFAULT False,
   "IsQuirinSpeed" BOOLEAN DEFAULT False,
   "IsKleinSpeed" BOOLEAN DEFAULT False,
   "IsKeyRace" BOOLEAN DEFAULT False,
   "IsBouncyBouncy" BOOLEAN DEFAULT False,
   "IsBestEffortLast" BOOLEAN DEFAULT False,
   "IsShipIn" BOOLEAN DEFAULT False,
   "IsYouBetTrack" BOOLEAN DEFAULT False,
   "IsPrintedOnValueSheet" BOOLEAN DEFAULT False,
   "IsWagerSheetSelected" BOOLEAN DEFAULT False,
   "IsOverlaySheetSelected" BOOLEAN DEFAULT False,
   "IsLinerSheetSelected" BOOLEAN DEFAULT False,
   "IsVerifiedClaim" BOOLEAN DEFAULT False,
   "IsBetLast" BOOLEAN DEFAULT False,
   "IsUltimateFormFactor" BOOLEAN DEFAULT False,
   "Is1stOffLayoff" BOOLEAN DEFAULT False,
   "Is2ndOffLayoff" BOOLEAN DEFAULT False,
   "Is3rdOffLayoff" BOOLEAN DEFAULT False,
   "IsFormConsistent" BOOLEAN DEFAULT False,
   "IsX1stBred" BOOLEAN DEFAULT False,
   "IsX2yoBred" BOOLEAN DEFAULT False,
   "IsXTurfBred" BOOLEAN DEFAULT False,
   "IsBoolean17" BOOLEAN DEFAULT False,
   "IsBoolean18" BOOLEAN DEFAULT False,
   "IsBoolean19" BOOLEAN DEFAULT False,
   "IsBoolean20" BOOLEAN DEFAULT False,
   "IsBoolean21" BOOLEAN DEFAULT False,
   "IsBoolean22" BOOLEAN DEFAULT False,
   "IsBoolean23" BOOLEAN DEFAULT False,
   "IsBoolean24" BOOLEAN DEFAULT False,
   "IsBoolean25" BOOLEAN DEFAULT False,
   "IsBoolean26" BOOLEAN DEFAULT False,
   "IsBoolean27" BOOLEAN DEFAULT False,
   "IsBoolean28" BOOLEAN DEFAULT False,
   "IsBoolean29" BOOLEAN DEFAULT False,
   "IsBoolean30" BOOLEAN DEFAULT False,
   "EstMorningLineTo1Fair" FLOAT DEFAULT 0,
   "TodaysWagerWinPct" FLOAT DEFAULT 0,
   "TodaysWagerValueBet" FLOAT DEFAULT 0,
   "TodaysWagerLineTo1Fair" FLOAT DEFAULT 0,
   "EstMorningLineWinPctRank" SMALLINT DEFAULT 0,
   "TodaysWagerWinPctRank" SMALLINT DEFAULT 0,
   "TrnWinsRank" SMALLINT DEFAULT 0,
   "TrnEarningsRank" SMALLINT DEFAULT 0,
   "TrnTrackRank" SMALLINT DEFAULT 0,
   "JkyWinsRank" SMALLINT DEFAULT 0,
   "JkyEarningsRank" SMALLINT DEFAULT 0,
   "JkyTrackRank" SMALLINT DEFAULT 0,
   "OwnWinsRank" SMALLINT DEFAULT 0,
   "OwnEarningsRank" SMALLINT DEFAULT 0,
PRIMARY KEY ("TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL
DESCRIPTION 'Horse History'
LOCALE CODE 0
USER MAJOR VERSION 4
);

CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "HorseHistory" ("RangeRaceDate","RaceDate") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByHorseName" ON "HorseHistory" ("RangeRaceDate","HorseName") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinalWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","FinalWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByProgramNbr" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","ProgramNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDateTrkCode" ON "HorseHistory" ("RangeRaceDate","RaceDate","TrkCode","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "HorseHistory" ("RangeRaceDate","RaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByPrimaryWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PrimaryWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "BySecondaryWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","SecondaryWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByDefaultWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","DefaultWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByOdds" ON "HorseHistory" ("RangeRaceDate","Odds") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "HorseHistory" ("RangeRaceDate","FinishPos") COMPRESS FULL;
