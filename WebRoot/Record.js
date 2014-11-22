/**
 * 
 */
    var xmlHttp;
    var globalHomeTeamID;
    var globalAwayTeamID;
    var homeTeamScore;
    var awayTeamScore;
	/*创建XMLHttpRequest对象*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*处理服务器响应结果*/
	function processResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
				refresh(globalHomeTeamID,globalAwayTeamID);
			}
		}
	}
	/*发送客户端的请求*/
	function sendRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processResponse;
		xmlHttp.send(null);
	}
	/*增加得分*/
	function score(playerID,homeTeamID,awayTeamID){
		
	    //当前页面的数据自加1
	    var score=parseInt(document.getElementById(playerID+"score").innerText)+1;
	    var url="Record.servlet?playerID="+playerID+"&event=Score&amount="+score+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    document.getElementById(playerID+"score").innerText=score;
	    sendRequest(url);
	    
	}
	/*增加犯规*/
	function foul(playerID,homeTeamID,awayTeamID){
		//当前页面的犯规数据自动加1
		var foul=parseInt(document.getElementById(playerID+"foul").innerText)+1;
	    document.getElementById(playerID+"foul").innerText=foul;
	    var url="Record.servlet?playerID="+playerID+"&event=Fouls&amount="+foul+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    sendRequest(url);
	}
	/*
	 * 刷新函数
	 */
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		globalHomeTeamID=homeTeamID;
		globalAwayTeamID=awayTeamID;
		sendRefreshRequest(url);
	}
	/*发送客户端的请求*/
	function sendRefreshRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processRefreshResponse;
		xmlHttp.send(null);
	}
	/*处理服务器响应结果*/
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
	/*
	*统计撤销功能
	*/
	function cancelScore(playerID,homeTeamID,awayTeamID)
	{
		var score=parseInt(document.getElementById(playerID+"score").innerText)-1;
		if (score>=0)
		{
			var url="Record.servlet?playerID="+playerID+"&event=CancelScore&amount="+score+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		    document.getElementById(playerID+"score").innerText=score;
		    sendRequest(url);
		}else{
			alert("Wrong Operation!");
		}
	    
	}
	function cancelFoul(playerID,homeTeamID,awayTeamID)
	{
		var foul=parseInt(document.getElementById(playerID+"foul").innerText)-1;
		if (foul>=0)
		{
			document.getElementById(playerID+"foul").innerText=foul;
		    var url="Record.servlet?playerID="+playerID+"&event=CancelFouls&amount="+foul+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		    sendRequest(url);
		}else{
			alert("Wrong Operation!");
		}
	    
	}