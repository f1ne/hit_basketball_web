/**
 * 
 */
    var xmlHttp;
    var globalHomeTeamID;
    var globalAwayTeamID;
    var homeTeamScore;
    var awayTeamScore;
	/*����XMLHttpRequest����*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*�����������Ӧ���*/
	function processResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
				refresh(globalHomeTeamID,globalAwayTeamID);
			}
		}
	}
	/*���Ϳͻ��˵�����*/
	function sendRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processResponse;
		xmlHttp.send(null);
	}
	/*���ӵ÷�*/
	function score(playerID,homeTeamID,awayTeamID){
		
	    //��ǰҳ��������Լ�1
	    var preScore=parseInt(document.getElementById(playerID+"score").innerText);
	    var url="Record.servlet?playerID="+playerID+"&event=score"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    document.getElementById(playerID+"score").innerText=preScore+1;
	    sendRequest(url);
	    
	}
	/*���ӷ���*/
	function foul(playerID,homeTeamID,awayTeamID){
		//��ǰҳ��ķ��������Զ���1
		var prefoul=parseInt(document.getElementById(playerID+"foul").innerText);
	    document.getElementById(playerID+"foul").innerText=prefoul+1;
	    var url="Record.servlet?playerID="+playerID+"&event=foul"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    sendRequest(url);
	}
	//ˢ�º���
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		globalHomeTeamID=homeTeamID;
		globalAwayTeamID=awayTeamID;
		sendRefreshRequest(url);
	}
	/*���Ϳͻ��˵�����*/
	function sendRefreshRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processRefreshResponse;
		xmlHttp.send(null);
	}
	/*�����������Ӧ���*/
	function processRefreshResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
				homeTeamScore=parseInt(0);
				awayTeamScore=parseInt(0);
				var out="";
				var res=xmlHttp.responseXML;
				var data=res.getElementsByTagName("PlayerData");
				var len=data.length;
				for (var i=0;i<data.length;i++){
					var y=Array();
					var y=data[i].childNodes;
					var playerID=y[0].childNodes[0].nodeValue;
					var score=y[1].childNodes[0].nodeValue;
					var foul=y[2].childNodes[0].nodeValue;
					var teamID=y[3].childNodes[0].nodeValue;
					document.getElementById(playerID+"score").innerText=score;
					document.getElementById(playerID+"foul").innerText=foul;
					if (teamID==globalHomeTeamID){
						homeTeamScore=homeTeamScore+parseInt(score);
					}
					else{
						awayTeamScore=awayTeamScore+parseInt(score);
					}
				}
				document.getElementById("hometeamscore").innerText=homeTeamScore;
				document.getElementById("awayteamscore").innerText=awayTeamScore;
			}
		}
	}