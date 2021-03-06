<?

/*
  HandicappingOS, Open Source Handicapping Solutions
  http://www.handicappingOS

  Copyright (c) 2005 Richard Rosa

  Released under the GNU General Public License
*/

function parse_line($ppline, $raceToParse) {
	
	$labels = array("Track", "Date", "Race #", "Post Position", "Entry", "Distance Yards", "Surface", "Reserved1",
	                "Race Type", "Age/Sex Restrictions", "Today's Race Classification", "Purse", 
	                "Claiming Price", "Claiming Price (of horse)", "Track Record", "Race Conditions", "Today's Lasix list", "Today's Bute List",
	                "Today's Coupled List", "Today's Mutel List", "Simulcast host track code", "Simulcast host track race #", "Breed Type (if avail)", 
	                "Today's Nasal Strip Change", "Reserved2", "Reserved3", "Reserved4", "Today's Trainer", "Trainer Sts", "Trainer Wins", 
	                "Trainer Places", "Trainer Shows", "Today's Jockey", "Apprentice Wgt allow", "Jockey Sts", "Jockey Wins", 
	                "Jockey Places", "Jockey Shows", "Today's Owner", "Owner's Silks", "MTOAE", "Reserved5", "Program Number", "Morning Line" 
	                );   
               
 
	$fields = array ("track", "raceDate", "raceNum", "postPosition", "entry", "distanceYards", "surface",
	     "reserved1", "raceType", "ageSexRestriction", "tdyRaceClassification", "purse", 
	     "claimingPrice", "horseClaimingPrice", "trackRecord", "raceConditions", "tdyLasixList", 
	     "tdyButeList", "tdyCoupledList", "tdyMutelList", "simHostTrackCode", "simHostTrackRaceNum", "breedType", "tdyNasalStripChange",
	     "reserved2", "reserved3", "reserved4", "tdyTrainer", "trainerStats", "trainerWins",
	     "trainerPlaces", "trainerShows", "tdyJockey", "apprenticeWgtallow", "jockeySts", "jockeyWins", 
	     "jockeyPlaces", "jockeyShows", "tdyOwner", "ownerSilks", "MTO_AE", "reserved5", "programNumber", "morningLine",
	     "horseName", "yearOfBirth", "foalingMonth", "reserved6", "sex", "horseColor", "weight", "sire", "sireSire", "dam", 
	     "damsSire", "breeder", "bredState", "programPostPosition", "reserved7", "reserved8", "reserved9", 
	     "todaysMeds1", "todaysMeds2", "equipmentChange", "distStarts", "distWins", "distPlaces", "distShows", "distEarnings", 
	     "trackStarts", "trackWins", "trackPlaces", "trackShows", "trackEarnings", "turfStarts", "turfWins", "turfPlaces", 
	     "turfShows", "turfEarnings", "wetStarts", "wetWins", "wetPlaces", "wetShows", "wetEarnings",
	     "curYear", "curStarts", "curWins", "curPlaces", "curShows", "curEarnings", 
	     "prevYear", "prevStarts", "prevWins", "prevPlaces", "prevShows", "prevEarnings",
	     "lifeStarts", "lifeWins", "lifePlaces", "lifeShows", "lifeEarnings",  "dateWorkout1", "dateWorkout2",
	     "dateWorkout3", "dateWorkout4", "dateWorkout5", "dateWorkout6", "dateWorkout7", "dateWorkout8", "dateWorkout9", 
	     "dateWorkout10", "dateWorkout11", "dateWorkout12", "timeWorkout1", "timeWorkout2",
	     "timeWorkout3", "timeWorkout4", "timeWorkout5", "timeWorkout6", "timeWorkout7", "timeWorkout8", "timeWorkout9", 
	     "timeWorkout10", "timeWorkout11", "timeWorkout12", "trackWorkout1", "trackWorkout2",
	     "trackWorkout3", "trackWorkout4", "trackWorkout5", "trackWorkout6", "trackWorkout7", "trackWorkout8", "trackWorkout9", 
	     "trackWorkout10", "trackWorkout11", "trackWorkout12", "distanceWorkout1", "distanceWorkout2",
	     "distanceWorkout3", "distanceWorkout4", "distanceWorkout5", "distanceWorkout6", "distanceWorkout7", "distanceWorkout8", "distanceWorkout9", 
	     "distanceWorkout10", "distanceWorkout11", "distanceWorkout12", "conditionWorkout1", "conditionWorkout2",
	     "conditionWorkout3", "conditionWorkout4", "conditionWorkout5", "conditionWorkout6", "conditionWorkout7", "conditionWorkout8", "conditionWorkout9", 
	     "conditionWorkout10", "conditionWorkout11", "conditionWorkout12", "describeWorkout1", "describeWorkout2",
	     "describeWorkout3", "describeWorkout4", "describeWorkout5", "describeWorkout6", "describeWorkout7", "describeWorkout8", "describeWorkout9", 
	     "describeWorkout10", "describeWorkout11", "describeWorkout12", "innerIndicateWorkout1", "innerIndicateWorkout2",
	     "innerIndicateWorkout3", "innerIndicateWorkout4", "innerIndicateWorkout5", "innerIndicateWorkout6", "innerIndicateWorkout7", "innerIndicateWorkout8", "innerIndicateWorkout9", 
	     "innerIndicateWorkout10", "innerIndicateWorkout11", "innerIndicateWorkout12", "numWorksWorkout1", "numWorksWorkout2",
	     "numWorksWorkout3", "numWorksWorkout4", "numWorksWorkout5", "numWorksWorkout6", "numWorksWorkout7", "numWorksWorkout8", "numWorksWorkout9", 
	     "numWorksWorkout10", "numWorksWorkout11", "numWorksWorkout12", "rankWorkout1", "rankWorkout2",
	     "rankWorkout3", "rankWorkout4", "rankWorkout5", "rankWorkout6", "rankWorkout7", "rankWorkout8", "rankWorkout9", 
	     "rankWorkout10", "rankWorkout11", "rankWorkout12", "BrisRunStyle", "Quirin", "reserved10", "reserved11", "twoFBrisPaceParForLevel", 
	     "fourFBrisPaceParForLevel", "sizFBrisPaceParForLevel", "BrisSpeedParForClassLevel", "BrisLatePaceParForLevel", "reserved12", "reserved13",
	     "reserved14", "reserved15", "reserved16", "daysSinceLastRace",
	     "drfRaceCondition1", "drfRaceCondition2", "drfRaceCondition3", "drfRaceCondition4", "drfRaceCondition5", "drfRaceCondition6", 
	     "reserved17", "reserved18", "reserved19", "reserved20", "reserved21", "reserved22", "reserved23", "reserved24", "reserved25",
	     "wagerTypes1", "wagerTypes2", "wagerTypes3", "wagerTypes4", "wagerTypes5", "wagerTypes6", "wagerTypes7", "wagerTypes8", "wagerTypes9",
	     "reserved26", "reserved27", "BrisPrimePowerRating", "reserved28", "reserved29", "reserved30", "reserved31", 
	     "ppRaceDate1", "ppRaceDate2", "ppRaceDate3", "ppRaceDate4", "ppRaceDate5", "ppRaceDate6", "ppRaceDate7", 
	     "ppRaceDate8", "ppRaceDate9", "ppRaceDate10",
	     "ppDaysPrev1", "ppDaysPrev2", "ppDaysPrev3", "ppDaysPrev4", "ppDaysPrev5", "ppDaysPrev6", "ppDaysPrev7", 
	     "ppDaysPrev8", "ppDaysPrev9", "ppDaysPrev10",
	     "ppTrackCode1", "ppTrackCode2", "ppTrackCode3", "ppTrackCode4", "ppTrackCode5", "ppTrackCode6", "ppTrackCode7", 
	     "ppTrackCode8", "ppTrackCode9", "ppTrackCode10",
	     "ppBrisTrackCode1", "ppBrisTrackCode2", "ppBrisTrackCode3", "ppBrisTrackCode4", "ppBrisTrackCode5", "ppBrisTrackCode6", "ppBrisTrackCode7", 
	     "ppBrisTrackCode8", "ppBrisTrackCode9", "ppBrisTrackCode10",
	     "ppRaceNum1", "ppRaceNum2", "ppRaceNum3", "ppRaceNum4", "ppRaceNum5", "ppRaceNum6", "ppRaceNum7", 
	     "ppRaceNum8", "ppRaceNum9", "ppRaceNum10",
	     "ppTrackCond1", "ppTrackCond2", "ppTrackCond3", "ppTrackCond4", "ppTrackCond5", "ppTrackCond6", "ppTrackCond7", 
	     "ppTrackCond8", "ppTrackCond9", "ppTrackCond10",
	     "ppDistanceYards1", "ppDistanceYards2", "ppDistanceYards3", "ppDistanceYards4", "ppDistanceYards5", "ppDistanceYards6", "ppDistanceYards7", 
	     "ppDistanceYards8", "ppDistanceYards9", "ppDistanceYards10",
	     "ppSurface1", "ppSurface2", "ppSurface3", "ppSurface4", "ppSurface5", "ppSurface6", "ppSurface7", 
	     "ppSurface8", "ppSurface9", "ppSurface10",
	     "ppSpecialChute1", "ppSpecialChute2", "ppSpecialChute3", "ppSpecialChute4", "ppSpecialChute5", "ppSpecialChute6", "ppSpecialChute7", 
	     "ppSpecialChute8", "ppSpecialChute9", "ppSpecialChute10",
	     "ppNumEntrants1", "ppNumEntrants2", "ppNumEntrants3", "ppNumEntrants4", "ppNumEntrants5", "ppNumEntrants6", "ppNumEntrants7", 
	     "ppNumEntrants8", "ppNumEntrants9", "ppNumEntrants10",
	     "ppPostPosition1", "ppPostPosition2", "ppPostPosition3", "ppPostPosition4", "ppPostPosition5", "ppPostPosition6", "ppPostPosition7", 
	     "ppPostPosition8", "ppPostPosition9", "ppPostPosition10",
	     "ppEquipment1", "ppEquipment2", "ppEquipment3", "ppEquipment4", "ppEquipment5", "ppEquipment6", "ppEquipment7", 
	     "ppEquipment8", "ppEquipment9", "ppEquipment10",
		 "ppReserved1-1", "ppReserved1-2", "ppReserved1-3", "ppReserved1-4", "ppReserved1-5", "ppReserved1-6", "ppReserved1-7", 
	     "ppReserved1-8", "ppReserved1-9", "ppReserved1-10",
	     "ppMeds1", "ppMeds2", "ppMeds3", "ppMeds4", "ppMeds5", "ppMeds6", "ppMeds7", 
	     "ppMeds8", "ppMeds9", "ppMeds10",	     
	     "ppTripComment1", "ppTripComment2", "ppTripComment3", "ppTripComment4", "ppTripComment5", "ppTripComment6", "ppTripComment7", 
	     "ppTripComment8", "ppTripComment9", "ppTripComment10",
	     "ppWinnersName1", "ppWinnersName2", "ppWinnersName3", "ppWinnersName4", "ppWinnersName5", "ppWinnersName6", "ppWinnersName7", 
	     "ppWinnersName8", "ppWinnersName9", "ppWinnersName10",
	     "pp2ndPlaceName1", "pp2ndPlaceName2", "pp2ndPlaceName3", "pp2ndPlaceName4", "pp2ndPlaceName5", "pp2ndPlaceName6", "pp2ndPlaceName7", 
	     "pp2ndPlaceName8", "pp2ndPlaceName9", "pp2ndPlaceName10",
	     "pp3rdPlaceName1", "pp3rdPlaceName2", "pp3rdPlaceName3", "pp3rdPlaceName4", "pp3rdPlaceName5", "pp3rdPlaceName6", "pp3rdPlaceName7", 
	     "pp3rdPlaceName8", "pp3rdPlaceName9", "pp3rdPlaceName10",
	     "ppWinnersWeight1", "ppWinnersWeight2", "ppWinnersWeight3", "ppWinnersWeight4", "ppWinnersWeight5", "ppWinnersWeight6", "ppWinnersWeight7", 
	     "ppWinnersWeight8", "ppWinnersWeight9", "ppWinnersWeight10",
	     "pp2ndPlaceWeight1", "pp2ndPlaceWeight2", "pp2ndPlaceWeight3", "pp2ndPlaceWeight4", "pp2ndPlaceWeight5", "pp2ndPlaceWeight6", "pp2ndPlaceWeight7", 
	     "pp2ndPlaceWeight8", "pp2ndPlaceWeight9", "pp2ndPlaceWeight10",
	     "pp3rdPlaceWeight1", "pp3rdPlaceWeight2", "pp3rdPlaceWeight3", "pp3rdPlaceWeight4", "pp3rdPlaceWeight5", "pp3rdPlaceWeight6", "pp3rdPlaceWeight7", 
	     "pp3rdPlaceWeight8", "pp3rdPlaceWeight9", "pp3rdPlaceWeight10",
	     "ppWinnersMargin1", "ppWinnersMargin2", "ppWinnersMargin3", "ppWinnersMargin4", "ppWinnersMargin5", "ppWinnersMargin6", "ppWinnersMargin7", 
	     "ppWinnersMargin8", "ppWinnersMargin9", "ppWinnersMargin10",
	     "pp2ndPlaceMargin1", "pp2ndPlaceMargin2", "pp2ndPlaceMargin3", "pp2ndPlaceMargin4", "pp2ndPlaceMargin5", "pp2ndPlaceMargin6", "pp2ndPlaceMargin7", 
	     "pp2ndPlaceMargin8", "pp2ndPlaceMargin9", "pp2ndPlaceMargin10",
	     "pp3rdPlaceMargin1", "pp3rdPlaceMargin2", "pp3rdPlaceMargin3", "pp3rdPlaceMargin4", "pp3rdPlaceMargin5", "pp3rdPlaceMargin6", "pp3rdPlaceMargin7", 
	     "pp3rdPlaceMargin8", "pp3rdPlaceMargin9", "pp3rdPlaceMargin10",
	     "ppExtraComment1", "ppExtraComment2", "ppExtraComment3", "ppExtraComment4", "ppExtraComment5", "ppExtraComment6", "ppExtraComment7", 
	     "ppExtraComment8", "ppExtraComment9", "ppExtraComment10",
	     "ppWeight1", "ppWeight2", "ppWeight3", "ppWeight4", "ppWeight5", "ppWeight6", "ppWeight7", 
	     "ppWeight8", "ppWeight9", "ppWeight10",	     
   	     "ppOdds1", "ppOdds2", "ppOdds3", "ppOdds4", "ppOdds5", "ppOdds6", "ppOdds7", 
	     "ppOdds8", "ppOdds9", "ppOdds10",	     
	     "ppEntry1", "ppEntry2", "ppEntry3", "ppEntry4", "ppEntry5", "ppEntry6", "ppEntry7", 
	     "ppEntry8", "ppEntry9", "ppEntry10",	     
	     "ppRaceClassification1", "ppRaceClassification2", "ppRaceClassification3", "ppRaceClassification4", "ppRaceClassification5", "ppRaceClassification6", "ppRaceClassification7", 
	     "ppRaceClassification8", "ppRaceClassification9", "ppRaceClassification10",	     
	     "ppClaimingPriceHorse1", "ppClaimingPriceHorse2", "ppClaimingPriceHorse3", "ppClaimingPriceHorse4", "ppClaimingPriceHorse5", "ppClaimingPriceHorse6", "ppClaimingPriceHorse7", 
	     "ppClaimingPriceHorse8", "ppClaimingPriceHorse9", "ppClaimingPriceHorse10",	     
	     "ppPurse1", "ppPurse2", "ppPurse3", "ppPurse4", "ppPurse5", "ppPurse6", "ppPurse7", 
	     "ppPurse8", "ppPurse9", "ppPurse10",	     
	     "ppStartingCallPos1", "ppStartingCallPos2", "ppStartingCallPos3", "ppStartingCallPos4", "ppStartingCallPos5", "ppStartingCallPos6", "ppStartingCallPos7", 
	     "ppStartingCallPos8", "ppStartingCallPos9", "ppStartingCallPos10",	     
	     "ppFirstCallPos1", "ppFirstCallPos2", "ppFirstCallPos3", "ppFirstCallPos4", "ppFirstCallPos5", "ppFirstCallPos6", "ppFirstCallPos7", 
	     "ppFirstCallPos8", "ppFirstCallPos9", "ppFirstCallPos10",	     
	     "ppSecondCallPos1", "ppSecondCallPos2", "ppSecondCallPos3", "ppSecondCallPos4", "ppSecondCallPos5", "ppSecondCallPos6", "ppSecondCallPos7", 
	     "ppSecondCallPos8", "ppSecondCallPos9", "ppSecondCallPos10",	     
	     "ppReserved3-1", "ppReserved3-2", "ppReserved3-3", "ppReserved3-4", "ppReserved3-5", "ppReserved3-6", "ppReserved3-7", 
	     "ppReserved3-8", "ppReserved3-9", "ppReserved3-10",	     
	     "ppStretchPos1", "ppStretchPos2", "ppStretchPos3", "ppStretchPos4", "ppStretchPos5", "ppStretchPos6", "ppStretchPos7", 
	     "ppStretchPos8", "ppStretchPos9", "ppStretchPos10",	     
   	     "ppFinishPos1", "ppFinishPos2", "ppFinishPos3", "ppFinishPos4", "ppFinishPos5", "ppFinishPos6", "ppFinishPos7", 
	     "ppFinishPos8", "ppFinishPos9", "ppFinishPos10",	     
	     "ppMoneyPos1", "ppMoneyPos2", "ppMoneyPos3", "ppMoneyPos4", "ppMoneyPos5", "ppMoneyPos6", "ppMoneyPos7", 
	     "ppMoneyPos8", "ppMoneyPos9", "ppMoneyPos10",	
   	     "ppStartCallBeatenMargin1", "ppStartCallBeatenMargin2", "ppStartCallBeatenMargin3", "ppStartCallBeatenMargin4", "ppStartCallBeatenMargin5", "ppStartCallBeatenMargin6", "ppStartCallBeatenMargin7", 
	     "ppStartCallBeatenMargin8", "ppStartCallBeatenMargin9", "ppStartCallBeatenMargin10",	     
   	     "ppStartCallBeaten1", "ppStartCallBeaten2", "ppStartCallBeaten3", "ppStartCallBeaten4", "ppStartCallBeaten5", "ppStartCallBeaten6", "ppStartCallBeaten7", 
	     "ppStartCallBeaten8", "ppStartCallBeaten9", "ppStartCallBeaten10",	     
   	     "ppFirstCallBeatenMargin1", "ppFirstCallBeatenMargin2", "ppFirstCallBeatenMargin3", "ppFirstCallBeatenMargin4", "ppFirstCallBeatenMargin5", "ppFirstCallBeatenMargin6", "ppFirstCallBeatenMargin7", 
	     "ppFirstCallBeatenMargin8", "ppFirstCallBeatenMargin9", "ppFirstCallBeatenMargin10",	     
   	     "ppFirstCallBeaten1", "ppFirstCallBeaten2", "ppFirstCallBeaten3", "ppFirstCallBeaten4", "ppFirstCallBeaten5", "ppFirstCallBeaten6", "ppFirstCallBeaten7", 
	     "ppFirstCallBeaten8", "ppFirstCallBeaten9", "ppFirstCallBeaten10",	     
   	     "ppSecondCallBeatenMargin1", "ppSecondCallBeatenMargin2", "ppSecondCallBeatenMargin3", "ppSecondCallBeatenMargin4", "ppSecondCallBeatenMargin5", "ppSecondCallBeatenMargin6", "ppSecondCallBeatenMargin7", 
	     "ppSecondCallBeatenMargin8", "ppSecondCallBeatenMargin9", "ppSecondCallBeatenMargin10",	     
   	     "ppSecondCallBeaten1", "ppSecondCallBeaten2", "ppSecondCallBeaten3", "ppSecondCallBeaten4", "ppSecondCallBeaten5", "ppSecondCallBeaten6", "ppSecondCallBeaten7", 
	     "ppSecondCallBeaten8", "ppSecondCallBeaten9", "ppSecondCallBeaten10",	     
   	     "ppReserved4-1", "ppReserved4-2", "ppReserved4-3", "ppReserved4-4", "ppReserved4-5", "ppReserved4-6", "ppReserved4-7", 
	     "ppReserved4-8", "ppReserved4-9", "ppReserved4-10",	 
   	     "ppReserved5-1", "ppReserved5-2", "ppReserved5-3", "ppReserved5-4", "ppReserved5-5", "ppReserved5-6", "ppReserved5-7", 
	     "ppReserved5-8", "ppReserved5-9", "ppReserved5-10",	     
   	     "ppStretchBeatenMargin1", "ppStretchBeatenMargin2", "ppStretchBeatenMargin3", "ppStretchBeatenMargin4", "ppStretchBeatenMargin5", "ppStretchBeatenMargin6", "ppStretchBeatenMargin7", 
	     "ppStretchBeatenMargin8", "ppStretchBeatenMargin9", "ppStretchBeatenMargin10",	     
   	     "ppStretchBeaten1", "ppStretchBeaten2", "ppStretchBeaten3", "ppStretchBeaten4", "ppStretchBeaten5", "ppStretchBeaten6", "ppStretchBeaten7", 
	     "ppStretchBeaten8", "ppStretchBeaten9", "ppStretchBeaten10",	     
   	     "ppFinishBeatenMargin1", "ppFinishBeatenMargin2", "ppFinishBeatenMargin3", "ppFinishBeatenMargin4", "ppFinishBeatenMargin5", "ppFinishBeatenMargin6", "ppFinishBeatenMargin7", 
	     "ppFinishBeatenMargin8", "ppFinishBeatenMargin9", "ppFinishBeatenMargin10",	     
   	     "ppFinishBeaten1", "ppFinishBeaten2", "ppFinishBeaten3", "ppFinishBeaten4", "ppFinishBeaten5", "ppFinishBeaten6", "ppFinishBeaten7", 
	     "ppFinishBeaten8", "ppFinishBeaten9", "ppFinishBeaten10",	     
   	     "ppReserved6-1", "ppReserved6-2", "ppReserved6-3", "ppReserved6-4", "ppReserved6-5", "ppReserved6-6", "ppReserved6-7", 
	     "ppReserved6-8", "ppReserved6-9", "ppReserved6-10",	     
   	     "ppBris2fPaceRating1", "ppBris2fPaceRating2", "ppBris2fPaceRating3", "ppBris2fPaceRating4", "ppBris2fPaceRating5", "ppBris2fPaceRating6", "ppBris2fPaceRating7", 
	     "ppBris2fPaceRating8", "ppBris2fPaceRating9", "ppBris2fPaceRating10",	     
   	     "ppBris4fPaceRating1", "ppBris4fPaceRating2", "ppBris4fPaceRating3", "ppBris4fPaceRating4", "ppBris4fPaceRating5", "ppBris4fPaceRating6", "ppBris4fPaceRating7", 
	     "ppBris4fPaceRating8", "ppBris4fPaceRating9", "ppBris4fPaceRating10",	     
   	     "ppBris6fPaceRating1", "ppBris6fPaceRating2", "ppBris6fPaceRating3", "ppBris6fPaceRating4", "ppBris6fPaceRating5", "ppBris6fPaceRating6", "ppBris6fPaceRating7", 
	     "ppBris6fPaceRating8", "ppBris6fPaceRating9", "ppBris6fPaceRating10",	     
   	     "ppBris8fPaceRating1", "ppBris8fPaceRating2", "ppBris8fPaceRating3", "ppBris8fPaceRating4", "ppBris8fPaceRating5", "ppBris8fPaceRating6", "ppBris8fPaceRating7", 
	     "ppBris8fPaceRating8", "ppBris8fPaceRating9", "ppBris8fPaceRating10",	     
   	     "ppBris10fPaceRating1", "ppBris10fPaceRating2", "ppBris10fPaceRating3", "ppBris10fPaceRating4", "ppBris10fPaceRating5", "ppBris10fPaceRating6", "ppBris10fPaceRating7", 
	     "ppBris10fPaceRating8", "ppBris10fPaceRating9", "ppBris10fPaceRating10",	     
   	     "ppBrisLatePaceRating1", "ppBrisLatePaceRating2", "ppBrisLatePaceRating3", "ppBrisLatePaceRating4", "ppBrisLatePaceRating5", "ppBrisLatePaceRating6", "ppBrisLatePaceRating7", 
	     "ppBrisLatePaceRating8", "ppBrisLatePaceRating9", "ppBrisLatePaceRating10",	     
   	     "ppReserved7-1", "ppReserved7-2", "ppReserved7-3", "ppReserved7-4", "ppReserved7-5", "ppReserved7-6", "ppReserved7-7", 
	     "ppReserved7-8", "ppReserved7-9", "ppReserved7-10",	     
   	     "ppReserved8-1", "ppReserved8-2", "ppReserved8-3", "ppReserved8-4", "ppReserved8-5", "ppReserved8-6", "ppReserved8-7", 
	     "ppReserved8-8", "ppReserved8-9", "ppReserved8-10",	     
   	     "ppBrisSpeedRating1", "ppBrisSpeedRating2", "ppBrisSpeedRating3", "ppBrisSpeedRating4", "ppBrisSpeedRating5", "ppBrisSpeedRating6", "ppBrisSpeedRating7", 
	     "ppBrisSpeedRating8", "ppBrisSpeedRating9", "ppBrisSpeedRating10",	     
   	     "ppDRFSpeedRating1", "ppDRFSpeedRating2", "ppDRFSpeedRating3", "ppDRFSpeedRating4", "ppDRFSpeedRating5", "ppDRFSpeedRating6", "ppDRFSpeedRating7", 
	     "ppDRFSpeedRating8", "ppDRFSpeedRating9", "ppDRFSpeedRating10",	     
   	     "ppDRFTrackVariant1", "ppDRFTrackVariant2", "ppDRFTrackVariant3", "ppDRFTrackVariant4", "ppDRFTrackVariant5", "ppDRFTrackVariant6", "ppDRFTrackVariant7", 
	     "ppDRFTrackVariant8", "ppDRFTrackVariant9", "ppDRFTrackVariant10",     
   	     "pp2fFraction1", "pp2fFraction2", "pp2fFraction3", "pp2fFraction4", "pp2fFraction5", "pp2fFraction6", "pp2fFraction7", 
	     "pp2fFraction8", "pp2fFraction9", "pp2fFraction10",	     
   	     "pp3fFraction1", "pp3fFraction2", "pp3fFraction3", "pp3fFraction4", "pp3fFraction5", "pp3fFraction6", "pp3fFraction7", 
	     "pp3fFraction8", "pp3fFraction9", "pp3fFraction10",	     
   	     "pp4fFraction1", "pp4fFraction2", "pp4fFraction3", "pp4fFraction4", "pp4fFraction5", "pp4fFraction6", "pp4fFraction7", 
	     "pp4fFraction8", "pp4fFraction9", "pp4fFraction10",	     
   	     "pp5fFraction1", "pp5fFraction2", "pp5fFraction3", "pp5fFraction4", "pp5fFraction5", "pp5fFraction6", "pp5fFraction7", 
	     "pp5fFraction8", "pp5fFraction9", "pp5fFraction10",	     
   	     "pp6fFraction1", "pp6fFraction2", "pp6fFraction3", "pp6fFraction4", "pp6fFraction5", "pp6fFraction6", "pp6fFraction7", 
	     "pp6fFraction8", "pp6fFraction9", "pp6fFraction10",	     
   	     "pp7fFraction1", "pp7fFraction2", "pp7fFraction3", "pp7fFraction4", "pp7fFraction5", "pp7fFraction6", "pp7fFraction7", 
	     "pp7fFraction8", "pp7fFraction9", "pp7fFraction10",	     
   	     "pp8fFraction1", "pp8fFraction2", "pp8fFraction3", "pp8fFraction4", "pp8fFraction5", "pp8fFraction6", "pp8fFraction7", 
	     "pp8fFraction8", "pp8fFraction9", "pp8fFraction10",	     
   	     "pp10fFraction1", "pp10fFraction2", "pp10fFraction3", "pp10fFraction4", "pp10fFraction5", "pp10fFraction6", "pp10fFraction7", 
	     "pp10fFraction8", "pp10fFraction9", "pp10fFraction10",	     
   	     "pp12fFraction1", "pp12fFraction2", "pp12fFraction3", "pp12fFraction4", "pp12fFraction5", "pp12fFraction6", "pp12fFraction7", 
	     "pp12fFraction8", "pp12fFraction9", "pp12fFraction10",	     
   	     "pp14fFraction1", "pp14fFraction2", "pp14fFraction3", "pp14fFraction4", "pp14fFraction5", "pp14fFraction6", "pp14fFraction7", 
	     "pp14fFraction8", "pp14fFraction9", "pp14fFraction10",	     
   	     "pp16fFraction1", "pp16fFraction2", "pp16fFraction3", "pp16fFraction4", "pp16fFraction5", "pp16fFraction6", "pp16fFraction7", 
	     "pp16fFraction8", "pp16fFraction9", "pp16fFraction10",	     
   	     "ppFirstFraction1", "ppFirstFraction2", "ppFirstFraction3", "ppFirstFraction4", "ppFirstFraction5", "ppFirstFraction6", "ppFirstFraction7", 
	     "ppFirstFraction8", "ppFirstFraction9", "ppFirstFraction10",	     
   	     "ppSecondFraction1", "ppSecondFraction2", "ppSecondFraction3", "ppSecondFraction4", "ppSecondFraction5", "ppSecondFraction6", "ppSecondFraction7", 
	     "ppSecondFraction8", "ppSecondFraction9", "ppSecondFraction10",	     
   	     "ppThirdFraction1", "ppThirdFraction2", "ppThirdFraction3", "ppThirdFraction4", "ppThirdFraction5", "ppThirdFraction6", "ppThirdFraction7", 
	     "ppThirdFraction8", "ppThirdFraction9", "ppThirdFraction10",	     
   	     "ppReserved9-1", "ppReserved9-2", "ppReserved9-3", "ppReserved9-4", "ppReserved9-5", "ppReserved9-6", "ppReserved9-7", 
	     "ppReserved9-8", "ppReserved9-9", "ppReserved9-10",	     
   	     "ppReserved10-1", "ppReserved10-2", "ppReserved10-3", "ppReserved10-4", "ppReserved10-5", "ppReserved10-6", "ppReserved10-7", 
	     "ppReserved10-8", "ppReserved10-9", "ppReserved10-10",	     
   	     "ppFinalTime1", "ppFinalTime2", "ppFinalTime3", "ppFinalTime4", "ppFinalTime5", "ppFinalTime6", "ppFinalTime7", 
	     "ppFinalTime8", "ppFinalTime9", "ppFinalTime10",	     
   	     "ppClaimedCode1", "ppClaimedCode2", "ppClaimedCode3", "ppClaimedCode4", "ppClaimedCode5", "ppClaimedCode6", "ppClaimedCode7", 
	     "ppClaimedCode8", "ppClaimedCode9", "ppClaimedCode10",	     
   	     "ppTrainer1", "ppTrainer2", "ppTrainer3", "ppTrainer4", "ppTrainer5", "ppTrainer6", "ppTrainer7", 
	     "ppTrainer8", "ppTrainer9", "ppTrainer10",	     
   	     "ppJockey1", "ppJockey2", "ppJockey3", "ppJockey4", "ppJockey5", "ppJockey6", "ppJockey7", 
	     "ppJockey8", "ppJockey9", "ppJockey10",
   	     "ppApprenticeWgtAllow1", "ppApprenticeWgtAllow2", "ppApprenticeWgtAllow3", "ppApprenticeWgtAllow4", "ppApprenticeWgtAllow5", "ppApprenticeWgtAllow6", "ppApprenticeWgtAllow7", 
	     "ppApprenticeWgtAllow8", "ppApprenticeWgtAllow9", "ppApprenticeWgtAllow10",	     
   	     "ppRaceType1", "ppRaceType2", "ppRaceType3", "ppRaceType4", "ppRaceType5", "ppRaceType6", "ppRaceType7", 
	     "ppRaceType8", "ppRaceType9", "ppRaceType10",     
   	     "ppAgeSexRestrict1", "ppAgeSexRestrict2", "ppAgeSexRestrict3", "ppAgeSexRestrict4", "ppAgeSexRestrict5", "ppAgeSexRestrict6", "ppAgeSexRestrict7", 
	     "ppAgeSexRestrict8", "ppAgeSexRestrict9", "ppAgeSexRestrict10",	     
   	     "ppStateBredFlag1", "ppStateBredFlag2", "ppStateBredFlag3", "ppStateBredFlag4", "ppStateBredFlag5", "ppStateBredFlag6", "ppStateBredFlag7", 
	     "ppStateBredFlag8", "ppStateBredFlag9", "ppStateBredFlag10",	     
   	     "ppRestrictedQualifierFlag1", "ppRestrictedQualifierFlag2", "ppRestrictedQualifierFlag3", "ppRestrictedQualifierFlag4", "ppRestrictedQualifierFlag5", "ppRestrictedQualifierFlag6", "ppRestrictedQualifierFlag7", 
	     "ppRestrictedQualifierFlag8", "ppRestrictedQualifierFlag9", "ppRestrictedQualifierFlag10",	     
   	     "ppFavoriteIndicator1", "ppFavoriteIndicator2", "ppFavoriteIndicator3", "ppFavoriteIndicator4", "ppFavoriteIndicator5", "ppFavoriteIndicator6", "ppFavoriteIndicator7", 
	     "ppFavoriteIndicator8", "ppFavoriteIndicator9", "ppFavoriteIndicator10",	     
   	     "ppFrontBandages1", "ppFrontBandages2", "ppFrontBandages3", "ppFrontBandages4", "ppFrontBandages5", "ppFrontBandages6", "ppFrontBandages7", 
	     "ppFrontBandages8", "ppFrontBandages9", "ppFrontBandages10",
	     "reserved32", 
	     "trainerCurStarts", "trainerCurWins", "trainerCurPlaces", "TrainerCurShows", "trainerCurROI", 
	     "trainerPrevStarts", "trainerPrevWins", "trainerPrevPlaces", "TrainerPrevShows", "trainerPrevROI", 
	     "jockeyCurStarts", "jockeyCurWins", "jockeyCurPlaces", "jockeyCurShows", "jockeyCurROI", 
	     "jockeyPrevStarts", "jockeyPrevWins", "jockeyPrevPlaces", "jockeyPrevShows", "jockeyPrevROI", 
	     "brisSpeedParForClass1", "brisSpeedParForClass2", "brisSpeedParForClass3", "brisSpeedParForClass4", "brisSpeedParForClass5", 
	     "brisSpeedParForClass6", "brisSpeedParForClass7", "brisSpeedParForClass8", "brisSpeedParForClass9", "brisSpeedParForClass10", 	     
	     "sireStudFee", "bestBrisFastTrack", "bestBrisTurf", "bestBrisOff", "bestBrisDistance",
	     "barShoe1", "barShoe2", "barShoe3", "barShoe4", "barShoe5", 
	     "barShoe6", "barShoe7", "barShoe8", "barShoe9", "barShoe10", 	     
	     "companyLineCode1", "companyLineCode2", "companyLineCode3", "companyLineCode4", "companyLineCode5", 
	     "companyLineCode6", "companyLineCode7", "companyLineCode8", "companyLineCode9", "companyLineCode10", 	     
	     "lowClaimingPriceOfRace1", "lowClaimingPriceOfRace2", "lowClaimingPriceOfRace3", "lowClaimingPriceOfRace4", "lowClaimingPriceOfRace5", 
	     "lowClaimingPriceOfRace6", "lowClaimingPriceOfRace7", "lowClaimingPriceOfRace8", "lowClaimingPriceOfRace9", "lowClaimingPriceOfRace10", 	     
	     "highClaimingPriceOfRace1", "highClaimingPriceOfRace2", "highClaimingPriceOfRace3", "highClaimingPriceOfRace4", "highClaimingPriceOfRace5", 
	     "highClaimingPriceOfRace6", "highClaimingPriceOfRace7", "highClaimingPriceOfRace8", "highClaimingPriceOfRace9", "highClaimingPriceOfRace10", 	     
		 "auctionPrice", "whenWhereAuction", "reserved33", "reserved34", "reserved35", "reserved36", "reserved37", "reserved38", "reserved39", 
		 "reserved40", "reserved41", "reserved42", "reserved43", "reserved44", "reserved45", "reserved46", "reserved47", "reserved48", 
		 "reserved49", "reserved50", "reserved51", "reserved52", "reserved53", "reserved54", "reserved55", "reserved56", "reserved57", 
		 "reserved58", "reserved59", "reserved60", "reserved61", "reserved62", 	   
	     "startCode1", "startCode2", "startCode3", "startCode4", "startCode5", 
	     "startCode6", "startCode7", "startCode8", "startCode9", "startCode10", 
	     "brisDirtPedigreeRating", "brisMudPedigreeRating", "brisTurfPedigreeRating", "brisDistPedigreeRating",
		 "reserved1268", "reserved1269", "reserved1270", "reserved1271", "reserved1272", "reserved1273", "reserved1274", "reserved1275", "reserved1276", 
		 "reserved1277", "reserved1278", "reserved1279", "reserved1280", "reserved1281", "reserved1282", "reserved1283", "reserved1284", "reserved1285", 
		 "reserved1286", "reserved1287", "reserved1288", "reserved1289", "reserved1290", 
		 "reserved1291", "reserved1292", "reserved1293", "reserved1294", "reserved1295", "reserved1296", "reserved1297", "reserved1298", "reserved1299", 
		 "reserved1300", "reserved1301", "reserved1302", "reserved1303", "reserved1304", "reserved1305", "reserved1306", "reserved1307", "reserved1308", 
		 "reserved1309", "reserved1310", "reserved1311", "reserved1312", "reserved1313", 	
		 "reserved1314", "reserved1315", "reserved1316", "reserved1317", "reserved1318", "reserved1319", "reserved1320", "reserved1321", "reserved1322", 
		 "reserved1323", "reserved1324", "reserved1325", "reserved1326", "reserved1327", 
		 "bestBrisLife", "bestBrisMostRecentYear", "bestBrisPastYear", "bestBrisTrack", "starts", "wins", "places", "shows", "earnings", 
		 "keyTrainerStatCategory1", "keyTrainerStatStarts1", "keyTrainerStatWinPct1", "keyTrainerStatITM1", "keyTrainerStatROI1",
		 "keyTrainerStatCategory2", "keyTrainerStatStarts2", "keyTrainerStatWinPct2", "keyTrainerStatITM2", "keyTrainerStatROI2",
		 "keyTrainerStatCategory3", "keyTrainerStatStarts3", "keyTrainerStatWinPct3", "keyTrainerStatITM3", "keyTrainerStatROI3",
		 "keyTrainerStatCategory4", "keyTrainerStatStarts4", "keyTrainerStatWinPct4", "keyTrainerStatITM4", "keyTrainerStatROI4",
		 "keyTrainerStatCategory5", "keyTrainerStatStarts5", "keyTrainerStatWinPct5", "keyTrainerStatITM5", "keyTrainerStatROI5",
		 "keyTrainerStatCategory6", "keyTrainerStatStarts6", "keyTrainerStatWinPct6", "keyTrainerStatITM6", "keyTrainerStatROI6",
		 "jockeyDistanceOnTurfLabel", "jockeyDistanceOnTurfStarts", "jockeyDistanceOnTurfWins", "jockeyDistanceOnTurfPlaces", 
		 "jockeyDistanceOnTurfShows", "jockeyDistanceOnTurfROI", "jockeyDistanceOnTurfEarnings", 
		 "postTimes", "reserved1375"			   	     
	     );

        
         for ($i=0; $i<sizeof($fields); $i++) {
	        $entry[$fields[$i]] = str_replace("\"", "", $ppline[$i]);  
         	//$entry->$fields[$i]->name = $labels[$i];
         	//$entry->$fields[$i]->value = $ppline[$i];         	
         	}
		 //show_array($entry);
		 
		 return $entry;     
	}
	
?>