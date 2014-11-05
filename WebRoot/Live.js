/**
 * 
 */
    var globalHomeTeamID;
    var globalAwayTeamID;
    var homeTeamScore;
    var awayTeamScore;
    var xmlHttp;
	/*����XMLHttpRequest����*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*�����������Ӧ���*/
	function processResponse(){
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
				
				document.getElementById("hometeamscore").innerText=homeTeamScore;
				document.getElementById("awayteamscore").innerText=awayTeamScore;
				}
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
	//ˢ�º���
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		globalHomeTeamID=homeTeamID;
		globalAwayTeamID=awayTeamID;
		sendRequest(url);
		t=setTimeout("refresh(globalHomeTeamID,globalAwayTeamID)",3000);
	}