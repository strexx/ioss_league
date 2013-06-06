<?php

class JsonController extends Cms {

    public function uploadAction() 
    {
        //
    }

    public function addAction()
    {
    	$request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');

        if ( !empty($_FILES) ) {

        	$targetFolder = '/uploads/json/';
        	$jsonFile = $_FILES['file']['name'];
        	$tempFile = $_FILES['file']['tmp_name'];
            $targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
            $targetFile = rtrim( $targetPath,'/' ) . '/' . $jsonFile;

            $fileTypes = array('json');
            $fileParts = pathinfo( $jsonFile );

            $fileExistsDb = $db->fetchRow('SELECT * FROM json WHERE name = ?', $jsonFile);

            if (!$fileExistsDb && in_array($fileParts['extension'], $fileTypes)) 
            {
                move_uploaded_file($tempFile, $targetFile);

                $fileCheckExists = $_SERVER['DOCUMENT_ROOT'] . $targetFolder . $jsonFile;

                if( file_exists($fileCheckExists) ) {
                	
	                $fileUrl = $config->baseurl . 'uploads/json/' . $jsonFile;
		        	$getJson = file_get_contents($fileUrl);
		        	$jsonData = json_decode($getJson, true);

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
						$q->bindValue(":club", 'NextGen');
						$q->execute();

					}
					
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

						$q = $db->prepare('UPDATE players SET games = games + :games,
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
						$q->bindValue(":steam_id", $homePlayerStats['steamIdUint64']);
						$q->execute();

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
						$q->bindValue(":club", 'Bears');
						$q->execute();

					}
					
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

						$q = $db->prepare('UPDATE players SET games = games + :games,
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
						$q->bindValue(":steam_id", $awayPlayerStats['steamIdUint64']);
						$q->execute();

					}

					// ========= Store data in matches table ========== //

					$q = $db->prepare('INSERT INTO matches (h_team, h_goals, h_shots, h_shotsot, h_possession, h_interceptions, h_corners, h_passes, h_passescp, h_fouls, h_ycards, h_rcards, h_distance,
															a_team, a_goals, a_shots, a_shotsot, a_possession, a_interceptions, a_corners, a_passes, a_passescp, a_fouls, a_ycards, a_rcards, a_distance) 
									   VALUES (:h_team, :h_goals, :h_shots, :h_shotsot, :h_possession, :h_interceptions, :h_corners, :h_passes, :h_passescp, :h_fouls, :h_ycards, :h_rcards, :h_distance,
									   		   :a_team, :a_goals, :a_shots, :a_shotsot, :a_possession, :a_interceptions, :a_corners, :a_passes, :a_passescp, :a_fouls, :a_ycards, :a_rcards, :a_distance)');

					$q->bindValue(":h_team", $homeTeamName);
					$q->bindValue(":h_goals", $homeTeamStats['goals']);
					$q->bindValue(":h_shots", $homeTeamStats['shots']);
					$q->bindValue(":h_shotsot", $homeTeamStats['shotsOnGoal']);
					$q->bindValue(":h_possession", $homeTeamStats['possession']);
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
					$q->bindValue(":a_possession", $awayTeamStats['possession']);
					$q->bindValue(":a_interceptions", $awayTeamStats['interceptions']);
					$q->bindValue(":a_corners", $awayTeamStats['corners']);
					$q->bindValue(":a_passes", $awayTeamStats['passes']);
					$q->bindValue(":a_passescp", $awayTeamStats['passesCompleted']);
					$q->bindValue(":a_fouls", $awayTeamStats['fouls']);
					$q->bindValue(":a_ycards", $awayTeamStats['yellowCards']);
					$q->bindValue(":a_rcards", $awayTeamStats['redCards']);
					$q->bindValue(":a_distance", $awayTeamStats['distanceCovered']);
					$q->execute();

					// ========= Store JSON filename for filter ========= //

			    	$q = $db->prepare('INSERT INTO json (name) VALUES (:name)');
			    	$q->bindValue(':name', $jsonFile);
			    	$q->execute();

		        	$this->_helper->redirector->gotoRouteAndExit(array('action' => 'upload'));

		        }

            } else {
                echo 'Invalid file type or file has already been inserted';
            }
    	} else {
	        throw new Exception("Match has been inserted already", 1);
	    }
    }

}