<?php

class MatchController extends AppController {

    public function statisticAction()
    {   
	 //
	}

	public function loadjsonAction()
	{
		$request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');
        $test = 'Poeplap werkt';

        if(!$request->jsonfile)
        	exit;

        $jsonFile = $request->jsonfile;

        $fileExists = $db->fetchRow('SELECT * FROM json WHERE name = ?', $jsonFile);
        $fileLink = $_SERVER['DOCUMENT_ROOT'] . '/ioss_league/uploads/json/' . $jsonFile;

        if( !$fileExists && file_exists($fileLink) )
        {
        	$fileUrl = $config->baseurl . 'uploads/json/' . $jsonFile;
        	$getJson = file_get_contents($fileUrl);
        	$jsonData = json_decode($getJson, true);

        	// ========= JSON output ========= //

        	var_dump($jsonData);
        	exit;

        	// ========= Home team ========= //

        	$homeTeamStatsArr = $jsonData['homeTeam']['statistics'];

        	$homeTeamName = $jsonData['homeTeam']['info']['name'];
        	$homeTeamMatchEvents = $jsonData['homeTeam']['matchEvents'];
        	$homeTeamPlayers = $jsonData['homeTeam']['players'];

        	// ========= Get hometeam stats ========= //

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

			// ========= Store hometeam stats general data ========= //

			/*if( !empty($homeTeamStats) ) {

				$q = $db->prepare('UPDATE clubs SET shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp,
										  fouls = fouls + :fouls, 
										  ycards = ycards + :ycards, 
										  rcards = rcards + :rcards, 
										  csheets = csheets + :csheets
										  WHERE club = :club');
				$q->bindValue(":shots", $homeTeamStatsArr['7']);
				$q->bindValue(":shotsot", $homeTeamStatsArr['8']);
				$q->bindValue(":passes", $homeTeamStatsArr['15']);
				$q->bindValue(":passescp", $homeTeamStatsArr['9']);
				$q->bindValue(":fouls", $homeTeamStatsArr['2']);
				$q->bindValue(":ycards", $homeTeamStatsArr['1']);
				$q->bindValue(":rcards", $homeTeamStatsArr['0']);
				$q->bindValue(":csheets", '1');
				$q->bindValue(":club", 'NextGen');
				$q->execute();

			}*/
			
			// ========= Get home players data ========= //

			$homePlayersInfo = array();

			foreach ($homeTeamPlayers as $k => $player) {

				$homePlayersInfo[$k]['steamIdUint64'] = $player['info']['steamIdUint64'];
				$homePlayersInfo[$k]['name'] = $player['info']['name'];
				$homePlayersInfo[$k]['redCards'] = $player['statistics']['0'];
				$homePlayersInfo[$k]['yellowCards'] = $player['statistics']['1'];
				$homePlayersInfo[$k]['fouls'] = $player['statistics']['2'];
				$homePlayersInfo[$k]['foulsSuffered'] = $player['statistics']['3'];
				$homePlayersInfo[$k]['slidingTackles'] = $player['statistics']['4'];
				$homePlayersInfo[$k]['slidingTacklesCompleted'] = $player['statistics']['5'];
				$homePlayersInfo[$k]['goalsConceded'] = $player['statistics']['6'];
				$homePlayersInfo[$k]['shots'] = $player['statistics']['7'];
				$homePlayersInfo[$k]['shotsOnGoal'] = $player['statistics']['8'];
				$homePlayersInfo[$k]['passesCompleted'] = $player['statistics']['9'];
				$homePlayersInfo[$k]['interceptions'] = $player['statistics']['10'];
				$homePlayersInfo[$k]['goals'] = $player['statistics']['11'];
				$homePlayersInfo[$k]['ownGoals'] = $player['statistics']['12'];
				$homePlayersInfo[$k]['assists'] = $player['statistics']['13'];
				$homePlayersInfo[$k]['passes'] = $player['statistics']['14'];
				$homePlayersInfo[$k]['freeKicks'] = $player['statistics']['15'];
				$homePlayersInfo[$k]['penalties'] = $player['statistics']['16'];
				$homePlayersInfo[$k]['corners'] = $player['statistics']['17'];
				$homePlayersInfo[$k]['throwIns'] = $player['statistics']['18'];
				$homePlayersInfo[$k]['keeperSaves'] = $player['statistics']['19'];
				$homePlayersInfo[$k]['goalKicks'] = $player['statistics']['20'];
				$homePlayersInfo[$k]['possession'] = $player['statistics']['21'];
				$awayPlayersInfo[$k]['distanceCovered'] = $player['statistics']['22'];

			}

			// ========= Store hometeam player stats ========= //

			foreach($homePlayersInfo as $k => $homePlayerStats) {

				/*$q = $db->prepare('UPDATE players SET games = games + :games,
										  goals = goals + :goals, 
										  assists = assists + :assists, 
										  passescp = passescp + :passescp,
										  shots = shots + :shots, 
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
				$q->bindValue(":steam_id", $homePlayerStats['steam_id']);
				$q->execute();*/

				var_dump($homePlayerStats);

			}

        	// ========= Away team ========= //

        	$awayTeamStatsArr = $jsonData['awayTeam']['statistics'];
        	$awayTeamName = $jsonData['awayTeam']['info']['name'];
        	$awayTeamPlayers = $jsonData['awayTeam']['players'];

        	// ========= Get awayteam stats ========= //

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
 
			/*if( !empty($awayTeamStats) ) {

				$q = $db->prepare('UPDATE clubs SET shots = shots + :shots,
										  shotsot = shotsot + :shotsot, 
										  passes = passes + :passes, 
										  passescp = passescp + :passescp,
										  fouls = fouls + :fouls, 
										  ycards = ycards + :ycards, 
										  rcards = rcards + :rcards, 
										  csheets = csheets + :csheets
										  WHERE club = :club');
				$q->bindValue(":shots", $awayTeamStatsArr['7']);
				$q->bindValue(":shotsot", $awayTeamStatsArr['8']);
				$q->bindValue(":passes", $awayTeamStatsArr['15']);
				$q->bindValue(":passescp", $awayTeamStatsArr['9']);
				$q->bindValue(":fouls", $awayTeamStatsArr['2']);
				$q->bindValue(":ycards", $awayTeamStatsArr['1']);
				$q->bindValue(":rcards", $awayTeamStatsArr['0']);
				$q->bindValue(":csheets", '1');
				$q->bindValue(":club", 'Bears');
				$q->execute();

			}*/
			
			// ========= Get away players data ========= //

			$awayPlayersInfo = array();

			foreach ($awayTeamPlayers as $k => $player) {

				$awayPlayersInfo[$k]['steamIdUint64'] = $player['info']['steamIdUint64'];
				$awayPlayersInfo[$k]['name'] = $player['info']['name'];
				$awayPlayersInfo[$k]['redCards'] = $player['statistics']['0'];
				$awayPlayersInfo[$k]['yellowCards'] = $player['statistics']['1'];
				$awayPlayersInfo[$k]['fouls'] = $player['statistics']['2'];
				$awayPlayersInfo[$k]['foulsSuffered'] = $player['statistics']['3'];
				$awayPlayersInfo[$k]['slidingTackles'] = $player['statistics']['4'];
				$awayPlayersInfo[$k]['slidingTacklesCompleted'] = $player['statistics']['5'];
				$awayPlayersInfo[$k]['goalsConceded'] = $player['statistics']['6'];
				$awayPlayersInfo[$k]['shots'] = $player['statistics']['7'];
				$awayPlayersInfo[$k]['shotsOnGoal'] = $player['statistics']['8'];
				$awayPlayersInfo[$k]['passesCompleted'] = $player['statistics']['9'];
				$awayPlayersInfo[$k]['interceptions'] = $player['statistics']['10'];
				$awayPlayersInfo[$k]['goals'] = $player['statistics']['11'];
				$awayPlayersInfo[$k]['ownGoals'] = $player['statistics']['12'];
				$awayPlayersInfo[$k]['assists'] = $player['statistics']['13'];
				$awayPlayersInfo[$k]['passes'] = $player['statistics']['14'];
				$awayPlayersInfo[$k]['freeKicks'] = $player['statistics']['15'];
				$awayPlayersInfo[$k]['penalties'] = $player['statistics']['16'];
				$awayPlayersInfo[$k]['corners'] = $player['statistics']['17'];
				$awayPlayersInfo[$k]['throwIns'] = $player['statistics']['18'];
				$awayPlayersInfo[$k]['keeperSaves'] = $player['statistics']['19'];
				$awayPlayersInfo[$k]['goalKicks'] = $player['statistics']['20'];
				$awayPlayersInfo[$k]['possession'] = $player['statistics']['21'];
				$awayPlayersInfo[$k]['distanceCovered'] = $player['statistics']['22'];

			}

			// ========= Store hometeam player stats ========= //

			foreach($awayPlayersInfo as $k => $awayPlayerStats) {

				/*$q = $db->prepare('UPDATE players SET games = games + :games,
										  goals = goals + :goals, 
										  assists = assists + :assists, 
										  passescp = passescp + :passescp,
										  shots = shots + :shots, 
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
				$q->bindValue(":steam_id", $awayPlayerStats['steam_id']);
				$q->execute();*/

				var_dump($awayPlayerStats);

			}

			exit;

			// ========= Store JSON filename for filter ========= //

        	$q = $db->prepare('INSERT INTO json (name) VALUES (:name)');
        	$q->bindValue(':name', $jsonFile);
        	$q->execute();
        	
        }
        else {
        	throw new Exception("Match has been inserted already", 1);
        }

	}
	
}

?>