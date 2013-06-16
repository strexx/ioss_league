<?php

class MatchController extends AppController {

    public function statisticAction()
    {   
	 	$request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');
        $matchId = $request->id;

        // Queries
        $matchInfo = $db->fetchRow('SELECT * FROM matches WHERE id = ?', $matchId);
        $events = $db->fetchAll('SELECT * FROM match_events WHERE match_id = ? ORDER BY minute', $matchId);
        $positions = $db->fetchAll('SELECT * FROM match_positions WHERE match_id = ?', $matchId);
        $details = $db->fetchAll('SELECT * FROM match_detail WHERE match_id = ?', $matchId);
	
		// Views
        $this->view->matchInfo = $matchInfo;
        $this->view->events = $events;
        $this->view->positions = $positions;
        $this->view->details = $details;
	}

    public function loadjsonAction()
    {   
	 	$request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');

        $jsonFile = $request->jsonfile;

     	$fileCheckExists = 'uploads/json/' . $jsonFile;
     	$fileExistsDb = $db->fetchRow('SELECT * FROM json WHERE name = ?', $jsonFile);

        if( file_exists($fileCheckExists) && !$fileExistsDb ) 
        {
            $fileUrl = $config->baseurl . 'uploads/json/' . $jsonFile;
        	$getJson = file_get_contents($fileUrl);
        	$jsonData = json_decode($getJson, true);

        	//pr($jsonData);
	    	//exit;

	    	// ========= Get hometeam stats ========= //
	    	
	    	$homeTeamStatsArr = $jsonData['matchData']['teams'][0]['statistics'];
	    	$homeTeamName = $jsonData['matchData']['teams'][0]['info']['name'];

	    	$homeTeamStats = array('name' => $homeTeamName,
	    						  'redCards' => $homeTeamStatsArr['0'],
	        					  'yellowCards' => $homeTeamStatsArr['1'],
	        					  'fouls' => $homeTeamStatsArr['2'],
	        					  'foulsSuffered' => $homeTeamStatsArr['3'],
	        					  'slidingTackles' => $homeTeamStatsArr['4'],
	        					  'slidingTacklesCompleted' => $homeTeamStatsArr['5'],
	        					  'goalsConceded' => $homeTeamStatsArr['6'],
	        					  'shots' => $homeTeamStatsArr['7'],
	        					  'shotsOnGoal' => $homeTeamStatsArr['8'],
	        					  'passesCompleted' => $homeTeamStatsArr['9'],
	        					  'interceptions' => $homeTeamStatsArr['10'],
	        					  'offsides' => $homeTeamStatsArr['11'],
	        					  'goals' => $homeTeamStatsArr['12'],
	        					  'ownGoals' => $homeTeamStatsArr['13'],
	        					  'assists' => $homeTeamStatsArr['14'],
	        					  'passes' => $homeTeamStatsArr['15'],
	        					  'freeKicks' => $homeTeamStatsArr['16'],
	        					  'penalties' => $homeTeamStatsArr['17'],
	        					  'corners' => $homeTeamStatsArr['18'],
	        					  'throwIns' => $homeTeamStatsArr['19'],
	        					  'keeperSaves' => $homeTeamStatsArr['20'],
	        					  'goalKicks' => $homeTeamStatsArr['21'],
	        					  'possession' => $homeTeamStatsArr['22'],
	        					  'distanceCovered' => $homeTeamStatsArr['23']);

			// ========= Store hometeam stats data ========= //

			if( !empty($homeTeamStats) ) {

				$q = $db->prepare('UPDATE clubs SET shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp,
										  fouls = fouls + :fouls, 
										  ycards = ycards + :ycards, 
										  rcards = rcards + :rcards
										  WHERE club = :club');
				$q->bindValue(":shots", $homeTeamStats['shots']);
				$q->bindValue(":shotsot", $homeTeamStats['shotsOnGoal']);
				$q->bindValue(":passes", $homeTeamStats['passes']);
				$q->bindValue(":passescp", $homeTeamStats['passesCompleted']);
				$q->bindValue(":fouls", $homeTeamStats['fouls']);
				$q->bindValue(":ycards", $homeTeamStats['yellowCards']);
				$q->bindValue(":rcards", $homeTeamStats['redCards']);
				$q->bindValue(":club", $homeTeamName);
				$q->execute();

			}

			// ========= Get awayteam stats ========= //

	    	$awayTeamStatsArr = $jsonData['matchData']['teams'][1]['statistics'];
	    	$awayTeamName = $jsonData['matchData']['teams'][1]['info']['name'];

	    	$awayTeamStats = array('name' => $awayTeamName,
					  'redCards' => $awayTeamStatsArr['0'],
					  'yellowCards' => $awayTeamStatsArr['1'],
					  'fouls' => $awayTeamStatsArr['2'],
					  'foulsSuffered' => $awayTeamStatsArr['3'],
					  'slidingTackles' => $awayTeamStatsArr['4'],
					  'slidingTacklesCompleted' => $awayTeamStatsArr['5'],
					  'goalsConceded' => $awayTeamStatsArr['6'],
					  'shots' => $awayTeamStatsArr['7'],
					  'shotsOnGoal' => $awayTeamStatsArr['8'],
					  'passesCompleted' => $awayTeamStatsArr['9'],
					  'interceptions' => $awayTeamStatsArr['10'],
					  'offsides' => $awayTeamStatsArr['11'],
					  'goals' => $awayTeamStatsArr['12'],
					  'ownGoals' => $awayTeamStatsArr['13'],
					  'assists' => $awayTeamStatsArr['14'],
					  'passes' => $awayTeamStatsArr['15'],
					  'freeKicks' => $awayTeamStatsArr['16'],
					  'penalties' => $awayTeamStatsArr['17'],
					  'corners' => $awayTeamStatsArr['18'],
					  'throwIns' => $awayTeamStatsArr['19'],
					  'keeperSaves' => $awayTeamStatsArr['20'],
					  'goalKicks' => $awayTeamStatsArr['21'],
					  'possession' => $awayTeamStatsArr['22'],
					  'distanceCovered' => $awayTeamStatsArr['23']);

			// ========= Store awayteam stats general data ========= //

			if( !empty($awayTeamStats) ) {

				$q = $db->prepare('UPDATE clubs SET shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp,
										  fouls = fouls + :fouls, 
										  ycards = ycards + :ycards, 
										  rcards = rcards + :rcards
										  WHERE club = :club');
				$q->bindValue(":shots", $awayTeamStats['shots']);
				$q->bindValue(":shotsot", $awayTeamStats['shotsOnGoal']);
				$q->bindValue(":passes", $awayTeamStats['passes']);
				$q->bindValue(":passescp", $awayTeamStats['passesCompleted']);
				$q->bindValue(":fouls", $awayTeamStats['fouls']);
				$q->bindValue(":ycards", $awayTeamStats['yellowCards']);
				$q->bindValue(":rcards", $awayTeamStats['redCards']);
				$q->bindValue(":club", $awayTeamName);
				$q->execute();

			}

	    	// ========= Team players home and away ========== //

	    	$homeTeamPlayers = array();
	    	$awayTeamPlayers = array();
	    	$playerPositions = array();

	    	$homeTeamPlayersDetail = array();
	    	$awayTeamPlayersDetail = array();

	    	$players = $jsonData['matchData']['players'];

	    	foreach($players as $k => $player) {

	    		if(!empty($player['matchPeriodData']))
	    		{
		    		$team = $player['matchPeriodData'][0]['info']['team'];
		    		if($team == 'home') {
						
						$playerPositions[$k]['steamId'] = $player['info']['steamId'];
						$playerPositions[$k]['position'] = $player['matchPeriodData'][0]['info']['position'];
						$playerPositions[$k]['team'] = $team;

						$homeTeamPlayersDetail[$k]['steamId'] = $player['info']['steamId'];
						$homeTeamPlayersDetail[$k]['shots'] = $player['matchPeriodData'][0]['statistics']['7'] + $player['matchPeriodData'][1]['statistics']['7'];
						$homeTeamPlayersDetail[$k]['shotsOnGoal'] = $player['matchPeriodData'][0]['statistics']['8'] + $player['matchPeriodData'][1]['statistics']['8'];
						$homeTeamPlayersDetail[$k]['passes'] = $player['matchPeriodData'][0]['statistics']['15'] + $player['matchPeriodData'][1]['statistics']['15'];
						$homeTeamPlayersDetail[$k]['passesCompleted'] = $player['matchPeriodData'][0]['statistics']['9'] + $player['matchPeriodData'][1]['statistics']['9'];
						$homeTeamPlayersDetail[$k]['distanceCovered'] = $player['matchPeriodData'][0]['statistics']['23'] + $player['matchPeriodData'][1]['statistics']['23'];

						$homeTeamPlayers[$k]['playerName'] = $player['info']['name'];
						$homeTeamPlayers[$k]['steamId'] = $player['info']['steamId'];
						$homeTeamPlayers[$k]['redCards'] = $player['matchPeriodData'][0]['statistics']['0'] + $player['matchPeriodData'][1]['statistics']['0'];
						$homeTeamPlayers[$k]['yellowCards'] = $player['matchPeriodData'][0]['statistics']['1'] + $player['matchPeriodData'][1]['statistics']['1'];
						$homeTeamPlayers[$k]['fouls'] = $player['matchPeriodData'][0]['statistics']['2'] + $player['matchPeriodData'][1]['statistics']['2'];
						$homeTeamPlayers[$k]['foulsSuffered'] = $player['matchPeriodData'][0]['statistics']['3'] + $player['matchPeriodData'][1]['statistics']['3'];
						$homeTeamPlayers[$k]['slidingTackles'] = $player['matchPeriodData'][0]['statistics']['4'] + $player['matchPeriodData'][1]['statistics']['4'];
						$homeTeamPlayers[$k]['slidingTacklesCompleted'] = $player['matchPeriodData'][0]['statistics']['5'] + $player['matchPeriodData'][1]['statistics']['5'];
						$homeTeamPlayers[$k]['goalsConceded'] = $player['matchPeriodData'][0]['statistics']['6'] + $player['matchPeriodData'][1]['statistics']['6'];
						$homeTeamPlayers[$k]['shots'] = $player['matchPeriodData'][0]['statistics']['7'] + $player['matchPeriodData'][1]['statistics']['7'];
						$homeTeamPlayers[$k]['shotsOnGoal'] = $player['matchPeriodData'][0]['statistics']['8'] + $player['matchPeriodData'][1]['statistics']['8'];
						$homeTeamPlayers[$k]['passesCompleted'] = $player['matchPeriodData'][0]['statistics']['9'] + $player['matchPeriodData'][1]['statistics']['9'];
						$homeTeamPlayers[$k]['interceptions'] = $player['matchPeriodData'][0]['statistics']['10'] + $player['matchPeriodData'][1]['statistics']['10'];
						$homeTeamPlayers[$k]['offsides'] = $player['matchPeriodData'][0]['statistics']['11'] + $player['matchPeriodData'][1]['statistics']['11'];
						$homeTeamPlayers[$k]['goals'] = $player['matchPeriodData'][0]['statistics']['12'] + $player['matchPeriodData'][1]['statistics']['12'];
						$homeTeamPlayers[$k]['ownGoals'] = $player['matchPeriodData'][0]['statistics']['13'] + $player['matchPeriodData'][1]['statistics']['13'];
						$homeTeamPlayers[$k]['assists'] = $player['matchPeriodData'][0]['statistics']['14'] + $player['matchPeriodData'][1]['statistics']['14'];
						$homeTeamPlayers[$k]['passes'] = $player['matchPeriodData'][0]['statistics']['15'] + $player['matchPeriodData'][1]['statistics']['15'];
						$homeTeamPlayers[$k]['freeKicks'] = $player['matchPeriodData'][0]['statistics']['16'] + $player['matchPeriodData'][1]['statistics']['16'];
						$homeTeamPlayers[$k]['penalties'] = $player['matchPeriodData'][0]['statistics']['17'] + $player['matchPeriodData'][1]['statistics']['17'];
						$homeTeamPlayers[$k]['corners'] = $player['matchPeriodData'][0]['statistics']['18'] + $player['matchPeriodData'][1]['statistics']['18'];
						$homeTeamPlayers[$k]['throwIns'] = $player['matchPeriodData'][0]['statistics']['19'] + $player['matchPeriodData'][1]['statistics']['19'];
						$homeTeamPlayers[$k]['keeperSaves'] = $player['matchPeriodData'][0]['statistics']['20'] + $player['matchPeriodData'][1]['statistics']['20'];
						$homeTeamPlayers[$k]['goalKicks'] = $player['matchPeriodData'][0]['statistics']['21'] + $player['matchPeriodData'][1]['statistics']['21'];
						$homeTeamPlayers[$k]['possession'] = $player['matchPeriodData'][0]['statistics']['22'] + $player['matchPeriodData'][1]['statistics']['22'];
						$homeTeamPlayers[$k]['distanceCovered'] = $player['matchPeriodData'][0]['statistics']['23'] + $player['matchPeriodData'][1]['statistics']['23'];
					}
					elseif($team == 'away') {
						$playerPositions[$k]['steamId'] = $player['info']['steamId'];
						$playerPositions[$k]['position'] = $player['matchPeriodData'][0]['info']['position'];
						$playerPositions[$k]['team'] = $team;

						$awayTeamPlayersDetail[$k]['steamId'] = $player['info']['steamId'];
						$awayTeamPlayersDetail[$k]['shots'] = $player['matchPeriodData'][0]['statistics']['7'] + $player['matchPeriodData'][1]['statistics']['7'];
						$awayTeamPlayersDetail[$k]['shotsOnGoal'] = $player['matchPeriodData'][0]['statistics']['8'] + $player['matchPeriodData'][1]['statistics']['8'];
						$awayTeamPlayersDetail[$k]['passes'] = $player['matchPeriodData'][0]['statistics']['15'] + $player['matchPeriodData'][1]['statistics']['15'];
						$awayTeamPlayersDetail[$k]['passesCompleted'] = $player['matchPeriodData'][0]['statistics']['9'] + $player['matchPeriodData'][1]['statistics']['9'];
						$awayTeamPlayersDetail[$k]['distanceCovered'] = $player['matchPeriodData'][0]['statistics']['23'] + $player['matchPeriodData'][1]['statistics']['23'];


						$awayTeamPlayers[$k]['playerName'] = $player['info']['name'];
						$awayTeamPlayers[$k]['steamId'] = $player['info']['steamId'];
						$awayTeamPlayers[$k]['redCards'] = $player['matchPeriodData'][0]['statistics']['0'] + $player['matchPeriodData'][1]['statistics']['0'];
						$awayTeamPlayers[$k]['yellowCards'] = $player['matchPeriodData'][0]['statistics']['1'] + $player['matchPeriodData'][1]['statistics']['1'];
						$awayTeamPlayers[$k]['fouls'] = $player['matchPeriodData'][0]['statistics']['2'] + $player['matchPeriodData'][1]['statistics']['2'];
						$awayTeamPlayers[$k]['foulsSuffered'] = $player['matchPeriodData'][0]['statistics']['3'] + $player['matchPeriodData'][1]['statistics']['3'];
						$awayTeamPlayers[$k]['slidingTackles'] = $player['matchPeriodData'][0]['statistics']['4'] + $player['matchPeriodData'][1]['statistics']['4'];
						$awayTeamPlayers[$k]['slidingTacklesCompleted'] = $player['matchPeriodData'][0]['statistics']['5'] + $player['matchPeriodData'][1]['statistics']['5'];
						$awayTeamPlayers[$k]['goalsConceded'] = $player['matchPeriodData'][0]['statistics']['6'] + $player['matchPeriodData'][1]['statistics']['6'];
						$awayTeamPlayers[$k]['shots'] = $player['matchPeriodData'][0]['statistics']['7'] + $player['matchPeriodData'][1]['statistics']['7'];
						$awayTeamPlayers[$k]['shotsOnGoal'] = $player['matchPeriodData'][0]['statistics']['8'] + $player['matchPeriodData'][1]['statistics']['8'];
						$awayTeamPlayers[$k]['passesCompleted'] = $player['matchPeriodData'][0]['statistics']['9'] + $player['matchPeriodData'][1]['statistics']['9'];
						$awayTeamPlayers[$k]['interceptions'] = $player['matchPeriodData'][0]['statistics']['10'] + $player['matchPeriodData'][1]['statistics']['10'];
						$awayTeamPlayers[$k]['offsides'] = $player['matchPeriodData'][0]['statistics']['11'] + $player['matchPeriodData'][1]['statistics']['11'];
						$awayTeamPlayers[$k]['goals'] = $player['matchPeriodData'][0]['statistics']['12'] + $player['matchPeriodData'][1]['statistics']['12'];
						$awayTeamPlayers[$k]['ownGoals'] = $player['matchPeriodData'][0]['statistics']['13'] + $player['matchPeriodData'][1]['statistics']['13'];
						$awayTeamPlayers[$k]['assists'] = $player['matchPeriodData'][0]['statistics']['14'] + $player['matchPeriodData'][1]['statistics']['14'];
						$awayTeamPlayers[$k]['passes'] = $player['matchPeriodData'][0]['statistics']['15'] + $player['matchPeriodData'][1]['statistics']['15'];
						$awayTeamPlayers[$k]['freeKicks'] = $player['matchPeriodData'][0]['statistics']['16'] + $player['matchPeriodData'][1]['statistics']['16'];
						$awayTeamPlayers[$k]['penalties'] = $player['matchPeriodData'][0]['statistics']['17'] + $player['matchPeriodData'][1]['statistics']['17'];
						$awayTeamPlayers[$k]['corners'] = $player['matchPeriodData'][0]['statistics']['18'] + $player['matchPeriodData'][1]['statistics']['18'];
						$awayTeamPlayers[$k]['throwIns'] = $player['matchPeriodData'][0]['statistics']['19'] + $player['matchPeriodData'][1]['statistics']['19'];
						$awayTeamPlayers[$k]['keeperSaves'] = $player['matchPeriodData'][0]['statistics']['20'] + $player['matchPeriodData'][1]['statistics']['20'];
						$awayTeamPlayers[$k]['goalKicks'] = $player['matchPeriodData'][0]['statistics']['21'] + $player['matchPeriodData'][1]['statistics']['21'];
						$awayTeamPlayers[$k]['possession'] = $player['matchPeriodData'][0]['statistics']['22'] + $player['matchPeriodData'][1]['statistics']['22'];
						$awayTeamPlayers[$k]['distanceCovered'] = $player['matchPeriodData'][0]['statistics']['23'] + $player['matchPeriodData'][1]['statistics']['23'];
					}
				}

	    	}

			// ========= Store hometeam player stats ========= //

			foreach($homeTeamPlayers as $k => $homePlayerStats) {

				$q = $db->prepare('UPDATE players SET games = games + :games,
										  goals = goals + :goals, 
										  assists = assists + :assists,
										  shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp, 
										  interceptions = interceptions + :interceptions,
										  saves = saves + :saves,
										  fouls = fouls + :fouls,
										  foulssuf = foulssuf + :foulssuf,
										  ycards = ycards + :ycards,
										  rcards = rcards + :rcards
										  WHERE steam_id = :steam_id');

				$q->bindValue(":games", '1');
				$q->bindValue(":goals", $homePlayerStats['goals']);
				$q->bindValue(":assists", $homePlayerStats['assists']);
				$q->bindValue(":shots", $homePlayerStats['shots']);
				$q->bindValue(":shotsot", $homePlayerStats['shotsOnGoal']);
				$q->bindValue(":passes", $homePlayerStats['passes']);
				$q->bindValue(":passescp", $homePlayerStats['passesCompleted']);
				$q->bindValue(":interceptions", $homePlayerStats['interceptions']);
				$q->bindValue(":saves", $homePlayerStats['keeperSaves']);
				$q->bindValue(":fouls", $homePlayerStats['steam_id']);
				$q->bindValue(":foulssuf", $homePlayerStats['foulsSuffered']);
				$q->bindValue(":ycards", $homePlayerStats['yellowCards']);
				$q->bindValue(":rcards", $homePlayerStats['redCards']);
				$q->bindValue(":steam_id", $homePlayerStats['steamId']);
				$q->execute();

			}

			// ========= Store hometeam player stats ========= //

			foreach($awayTeamPlayers as $k => $awayPlayerStats) {

				$q = $db->prepare('UPDATE players SET games = games + :games,
										  goals = goals + :goals, 
										  assists = assists + :assists,
										  shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp, 
										  interceptions = interceptions + :interceptions,
										  saves = saves + :saves,
										  fouls = fouls + :fouls,
										  foulssuf = foulssuf + :foulssuf,
										  ycards = ycards + :ycards,
										  rcards = rcards + :rcards
										  WHERE steam_id = :steam_id');

				$q->bindValue(":games", '1');
				$q->bindValue(":goals", $awayPlayerStats['goals']);
				$q->bindValue(":assists", $awayPlayerStats['assists']);
				$q->bindValue(":shots", $awayPlayerStats['shots']);
				$q->bindValue(":shotsot", $awayPlayerStats['shotsOnGoal']);
				$q->bindValue(":passes", $awayPlayerStats['passes']);
				$q->bindValue(":passescp", $awayPlayerStats['passesCompleted']);
				$q->bindValue(":interceptions", $awayPlayerStats['interceptions']);
				$q->bindValue(":saves", $awayPlayerStats['keeperSaves']);
				$q->bindValue(":fouls", $awayPlayerStats['steam_id']);
				$q->bindValue(":foulssuf", $awayPlayerStats['foulsSuffered']);
				$q->bindValue(":ycards", $awayPlayerStats['yellowCards']);
				$q->bindValue(":rcards", $awayPlayerStats['redCards']);
				$q->bindValue(":steam_id", $awayPlayerStats['steamId']);
				$q->execute();

			}

			// ========= Store data in matches table ========== //
			
			$possHplusA = $homeTeamStats['possession'] + $awayTeamStats['possession']; 
			$possAplusH = $awayTeamStats['possession'] + $homeTeamStats['possession']; 

			$possH = round( $homeTeamStats['possession'] * 100 / $possHplusA );
			$possA = round( $awayTeamStats['possession'] * 100 / $possAplusH );

			$q = $db->prepare('INSERT INTO matches (h_team, h_goals, h_shots, h_shotsot, h_possession, h_interceptions, h_corners, h_passes, h_passescp, h_fouls, h_ycards, h_rcards, h_distance,
													a_team, a_goals, a_shots, a_shotsot, a_possession, a_interceptions, a_corners, a_passes, a_passescp, a_fouls, a_ycards, a_rcards, a_distance) 
							   VALUES (:h_team, :h_goals, :h_shots, :h_shotsot, :h_possession, :h_interceptions, :h_corners, :h_passes, :h_passescp, :h_fouls, :h_ycards, :h_rcards, :h_distance,
							   		   :a_team, :a_goals, :a_shots, :a_shotsot, :a_possession, :a_interceptions, :a_corners, :a_passes, :a_passescp, :a_fouls, :a_ycards, :a_rcards, :a_distance)');
			$q->bindValue(":h_team", $homeTeamName);
			$q->bindValue(":h_goals", $homeTeamStats['goals']);
			$q->bindValue(":h_shots", $homeTeamStats['shots']);
			$q->bindValue(":h_shotsot", $homeTeamStats['shotsOnGoal']);
			$q->bindValue(":h_possession", $possH);
			$q->bindValue(":h_interceptions", $homeTeamStats['interceptions']);
			$q->bindValue(":h_corners", $homeTeamStats['corners']);
			$q->bindValue(":h_passes", $homeTeamStats['passes']);
			$q->bindValue(":h_passescp", $homeTeamStats['passesCompleted']);
			$q->bindValue(":h_fouls", $homeTeamStats['fouls']);
			$q->bindValue(":h_ycards", $homeTeamStats['yellowCards']);
			$q->bindValue(":h_rcards", $homeTeamStats['redCards']);
			$q->bindValue(":h_distance", $homeTeamStats['distanceCovered']);
			$q->bindValue(":a_team", $awayTeamName);
			$q->bindValue(":a_goals", $awayTeamStats['goals']);
			$q->bindValue(":a_shots", $awayTeamStats['shots']);
			$q->bindValue(":a_shotsot", $awayTeamStats['shotsOnGoal']);
			$q->bindValue(":a_possession", $possA);
			$q->bindValue(":a_interceptions", $awayTeamStats['interceptions']);
			$q->bindValue(":a_corners", $awayTeamStats['corners']);
			$q->bindValue(":a_passes", $awayTeamStats['passes']);
			$q->bindValue(":a_passescp", $awayTeamStats['passesCompleted']);
			$q->bindValue(":a_fouls", $awayTeamStats['fouls']);
			$q->bindValue(":a_ycards", $awayTeamStats['yellowCards']);
			$q->bindValue(":a_rcards", $awayTeamStats['redCards']);
			$q->bindValue(":a_distance", $awayTeamStats['distanceCovered']);
			$q->execute();

			// Match ID
			$matchId = $db->fetchOne("SELECT id FROM matches ORDER BY id DESC LIMIT 1");

			// ========= Store player detail data ========= //

			foreach($homeTeamPlayersDetail as $k => $homeTeamPlayerDetail) {

				$shotsOnGoalsPercentage = round(divide($homeTeamPlayerDetail['shotsOnGoal'], $homeTeamPlayerDetail['shots']));
				$passesCompletedPercentage = round(divide($homeTeamPlayerDetail['passesCompleted'], $homeTeamPlayerDetail['passes']));
				$distanceCovered = $homeTeamPlayerDetail['distanceCovered'] / 100;
				$distance = round( $distanceCovered, 1, PHP_ROUND_HALF_UP );

				$q = $db->prepare('INSERT INTO match_detail (match_id, steam_id, shotsot, passescp, distancecovered) VALUES (:match_id, :steam_id, :shotsot, :passescp, :distancecovered)');
				$q->bindValue(":match_id", $matchId);
				$q->bindValue(":steam_id", $homeTeamPlayerDetail['steamId']);
				$q->bindValue(":shotsot", $shotsOnGoalsPercentage);
				$q->bindValue(":passescp", $passesCompletedPercentage);
				$q->bindValue(":distancecovered", $distance);
				$q->execute();
			}

			foreach($awayTeamPlayersDetail as $k => $awayTeamPlayerDetail) {
				$shotsOnGoalsPercentage = round(divide($awayTeamPlayerDetail['shotsOnGoal'], $awayTeamPlayerDetail['shots']));
				$passesCompletedPercentage = round(divide($awayTeamPlayerDetail['passesCompleted'], $awayTeamPlayerDetail['passes']));
				$distanceCovered = $awayTeamPlayerDetail['distanceCovered'] / 100;
				$distance = round( $distanceCovered, 1, PHP_ROUND_HALF_UP );

				$q = $db->prepare('INSERT INTO match_detail (match_id, steam_id, shotsot, passescp, distancecovered) VALUES (:match_id, :steam_id, :shotsot, :passescp, :distancecovered)');
				$q->bindValue(":match_id", $matchId);
				$q->bindValue(":steam_id", $awayTeamPlayerDetail['steamId']);
				$q->bindValue(":shotsot", $shotsOnGoalsPercentage);
				$q->bindValue(":passescp", $passesCompletedPercentage);
				$q->bindValue(":distancecovered", $distance);
				$q->execute();
			}

	    	// ========= Get match events ========= //

	    	$matchEvents = array();
	    	$events = $jsonData['matchData']['matchEvents'];

	    	foreach($events as $k => $event) {
	    		$matchEvents[$k]['minute'] = round( $event['second'] / 60 );
	    		$matchEvents[$k]['event'] = $event['event'];
	    		$matchEvents[$k]['period'] = $event['period'];
	    		$matchEvents[$k]['steamId'] = $event['player1SteamId'];
	    	}

	    	// ========= Store match events ========= //

	    	foreach($matchEvents as $k => $matchEvent) {

		    	$q = $db->prepare('INSERT INTO match_events (match_id, minute, event, period, steam_id) VALUES (:match_id, :minute, :event, :period, :steam_id)');
				$q->bindValue(":match_id", $matchId);
				$q->bindValue(":minute", $matchEvent['minute']);
				$q->bindValue(":event", $matchEvent['event']);
				$q->bindValue(":period", $matchEvent['period']);
				$q->bindValue(":steam_id", $matchEvent['steamId']);
				$q->execute();
			}

	    	// ========= Store player positions ========= //

	    	foreach($playerPositions as $k => $playerPosition) {

		    	$q = $db->prepare('INSERT INTO match_positions (match_id, steam_id, position, team) VALUES (:match_id, :steam_id, :position, :team)');
		
				$q->bindValue(":match_id", $matchId);
				$q->bindValue(":steam_id", $playerPosition['steamId']);
				$q->bindValue(":position", $playerPosition['position']);
				$q->bindValue(":team", $playerPosition['team']);
				$q->execute();

			}



			// ========= Store JSON filename for filter ========= //

	    	$q = $db->prepare('INSERT INTO json (name) VALUES (:name)');
	    	$q->bindValue(':name', $jsonFile);
	    	$q->execute();

        	//$this->_helper->redirector->gotoRouteAndExit(array('action' => 'upload'));

    	}
		else {
	    	echo 'Invalid file type or file has already been inserted';        
		}
	}
	
}

?>