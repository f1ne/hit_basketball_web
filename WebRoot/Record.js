
/**
 * 
 */
    var xmlHttp;
    var globalHomeTeamID;
    var globalAwayTeamID;
    var homeTeamScore;
    var awayTeamScore;
	/*创建XMLHttpRequest请求*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*处理响应*/
	function processResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
				refresh(globalHomeTeamID,globalAwayTeamID);
			}
		}
	}
	/*发送请求*/
	function sendRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processResponse;
		xmlHttp.send(null);
	}
	/*得分*/
	function score(playerID,homeTeamID,awayTeamID){
		
	    //得分加1
	    var score=parseInt(document.getElementById(playerID+"score").innerText)+1;
	    var url="Record.servlet?playerID="+playerID+"&event=Score&amount="+score+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    document.getElementById(playerID+"score").innerText=score;
	    sendRequest(url);
	    
	}
	/*犯规数增加*/
	function foul(playerID,homeTeamID,awayTeamID){
		//增加犯规数
		var foul=parseInt(document.getElementById(playerID+"foul").innerText)+1;
	    document.getElementById(playerID+"foul").innerText=foul;
	    var url="Record.servlet?playerID="+playerID+"&event=Fouls&amount="+foul+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    sendRequest(url);
	}
	/*
	 *刷新
	 */
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		globalHomeTeamID=homeTeamID;
		globalAwayTeamID=awayTeamID;
		sendRefreshRequest(url);
	}
	/*发送刷新请求*/
	function sendRefreshRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processRefreshResponse;
		xmlHttp.send(null);
	}
	/*处理刷新*/
	function processRefreshResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
				homeTeamScore=parseInt(0);
				awayTeamScore=parseInt(0);
				var out="";
				var res=xmlHttp.responseXML;
				//刷新页面的球员数据
				var data=res.getElementsByTagName("PlayerData");
				var len=data.length;
				for (var i=0;i<data.length;i++){
					var y=Array();
					var y=data[i].childNodes;
					var playerID=y[0].childNodes[0].nodeValue;
					var score=y[1].childNodes[0].nodeValue;
					var foul=y[2].childNodes[0].nodeValue;
					var teamID=y[3].childNodes[0].nodeValue;
					var state=y[4].childNodes[0].nodeValue;
					document.getElementById(playerID+"score").innerText=score;
					document.getElementById(playerID+"foul").innerText=foul;
					//更改球员状态
					if (foul>=5)
					{
					    var url="ChangePlayerState.servlet?playerID="+playerID+"&homeTeamID="+globalHomeTeamID+"&awayTeamID="+globalAwayTeamID+"&state=fouledout";
						sendRequest(url);
					    fouledout(playerID);
					}
					else
					{
					    if (state=="bench")
						{
						    bench(playerID);
						}
						if (state=="oncourt")
						{
						    oncourt(playerID);
						}
					}
					if (teamID==globalHomeTeamID){
						homeTeamScore=homeTeamScore+parseInt(score);
					}
					else{
						awayTeamScore=awayTeamScore+parseInt(score);
					}
				}
				document.getElementById("hometeamscore").innerText=homeTeamScore;
				document.getElementById("awayteamscore").innerText=awayTeamScore;
				//刷新页面的比赛状态
				var data=res.getElementsByTagName("GameData");
				for (var i=0;i<data.length;i++)
				{
				    var y=Array();
					var y=data[i].childNodes;
					var State=y[0].childNodes[0].nodeValue;
					if (State==0)
					{
					    document.getElementById("gamestate").innerText="未进行";
					}
					if (State==1)
					{
					    document.getElementById("gamestate").innerText="第一节";
					}
					if (State==2)
					{
					    document.getElementById("gamestate").innerText="第二节";
					}
					if (State==3)
					{
					    document.getElementById("gamestate").innerText="中场投篮比赛";
					}
					if (State==4)
					{
					    document.getElementById("gamestate").innerText="第三节";
					}
					if (State==5)
					{
					    document.getElementById("gamestate").innerText="第四节";
					}
					if (State==6)
					{
					    document.getElementById("gamestate").innerText="加时赛";
					}
					if (State==7)
					{
					    document.getElementById("gamestate").innerText="比赛结束";
					}
				}
			}
		}
	}
	/*
	*撤销得分
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
			if (foul==4)
			{
			    bench(playerID);
			}
		}else{
			alert("Wrong Operation!");
		}
	    
	}
	/*
	 * 更改替换球员
	 */
	function changeplayerstate(playerID,homeTeamID,awayTeamID)
	{
		//获得当前状态
		var currentstate=document.getElementById(playerID+"playerstate").innerText;
		//修改按钮名字
		if (currentstate=="替补")
		{
		    var url="ChangePlayerState.servlet?playerID="+playerID+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID+"&state=oncourt";
			sendRequest(url);
			oncourt(playerID);
		}
		if (currentstate=="场上")
		{
		    var url="ChangePlayerState.servlet?playerID="+playerID+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID+"&state=bench";
			sendRequest(url);
			bench(playerID);
		}
	}
	
	/*
	 *改变球员的状态的几个函数
	 */
	 //上场
	function oncourt(playerID)
	{
		document.getElementById(playerID+"playerstate").innerText="场上";
		document.getElementById(playerID+"changeplayerstate").value="下场";
		document.getElementById(playerID+"scorebutton").disabled=false;
		document.getElementById(playerID+"cancelscorebutton").disabled=false;
		document.getElementById(playerID+"foulbutton").disabled=false;
		document.getElementById(playerID+"cancelfoulbutton").disabled=false;
		document.getElementById(playerID+"changeplayerstate").disabled=false;
	}
	//下场
	function bench(playerID)
	{
		document.getElementById(playerID+"playerstate").innerText="替补";
		document.getElementById(playerID+"changeplayerstate").value="上场";
		document.getElementById(playerID+"scorebutton").disabled=true;
		document.getElementById(playerID+"cancelscorebutton").disabled=true;
		document.getElementById(playerID+"foulbutton").disabled=true;
		document.getElementById(playerID+"cancelfoulbutton").disabled=true;
		document.getElementById(playerID+"changeplayerstate").disabled=false;
	}
	//罚出比赛
	function fouledout(playerID)
	{
	    document.getElementById(playerID+"playerstate").innerText="罚出";
		document.getElementById(playerID+"changeplayerstate").value="不可用";
		document.getElementById(playerID+"scorebutton").disabled=true;
		document.getElementById(playerID+"cancelscorebutton").disabled=false;
		document.getElementById(playerID+"foulbutton").disabled=true;
		document.getElementById(playerID+"cancelfoulbutton").disabled=false;
		document.getElementById(playerID+"changeplayerstate").disabled=true;
	}
/*
 *比赛状态修改
 */
//结束比赛
    function changeGameState(homeTeamID,awayTeamID,state)
    {
        var homeScore=document.getElementById("hometeamscore").innerText;
		var awayScore=document.getElementById("awayteamscore").innerText; 
        var url="ChangeGameState.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID+"&homeScore="+homeScore+"&awayScore="+awayScore+"&state="+state;
        sendRequest(url);		
    }
	/*
	*打开一个请求时锁定所有按键直到请求完成
	*/
	function openbutton()
	{
	    var x=document.getElementsByTagName("input");
		for (var i=0;i<x.length;i++)
		{
		    x[i].disabled=false;
		}
	}
	function lockbutton()
	{
	    var x=document.getElementsByTagName("input");
		for (var i=0;i<x.length;i++)
		{
		    x[i].disabled=true;
		}
	}
    