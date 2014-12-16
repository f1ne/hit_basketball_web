
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
		if (foul>=5)
		{
		    var url="ChangePlayerState.servlet?playerID="+playerID+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID+"&state=fouledout";
		    sendRequest(url);
		    fouledout(playerID);
		}
		
	}
	/*
	 *刷新
	 */
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		globalHomeTeamID=homeTeamID;
		globalAwayTeamID=awayTeamID;
		sendRefreshRequest(url);
		t=setTimeout("uploadallgametable()","30000")
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
				//刷新页面的比赛状态
				var State;
				var data=res.getElementsByTagName("GameData");
				for (var i=0;i<data.length;i++)
				{
				    var y=Array();
					var y=data[i].childNodes;
					State=y[0].childNodes[0].nodeValue;
					document.getElementById("gamestateint").value=State;
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
					//更改球员计分规则显示
					//获得球员信息
					var Position=document.getElementById(playerID+"Position").innerText;
					var Sex=document.getElementById(playerID+"Sex").innerText;
					var Age=document.getElementById(playerID+"Age").innerText;
					var IsSHB=document.getElementById(playerID+"IsSHB").innerText;
					var rule=document.getElementById(playerID+"rule");
					if (State==1||State==2||State==4||State==5)
					{
					    if (Sex=="女")
						{
						    rule.innerText="若非增补女队员则得分X2。";
						}
						else
						{
						    rule.innerText="得分X1";
						}
						if (Age>=45&&Age<55)
						{
						    var node=document.createTextNode("每打满一节加2分，上限6分,全队加分上限20分");
							rule.appendchild(node);
						}
						else
						{
						    if (Age>=55)
							{
							    var node=document.createTextNode("每打满一节加3分，上限6分，全队加分上限20分");
							    rule.appendchild(node);
							}
						}
					}
					if (State==3)
				    {
					    if (Sex=="女")
						{
						    rule.innerText="得分X1";
						}
						else
						{
						    rule.innerText="不可出场";
						}
					}
					if (State==6)
					{
					    if (Sex=="女")
						{
						    rule.innerText="若非增补女队员则得分X2。";
						}
						else
						{
						    rule.innerText="得分X1";
						}
					}
					//阵容规则修改
					if (State==3)
					{
					    var gamerule=document.getElementById("gamerule");
						gamerule.innerText="";
						var para=document.createElement("p");
                        var node=document.createTextNode("在中场休息时，每队派出3名女队员进行罚篮比赛（可起跳），每人5次罚篮机会，每中一球加一分，得分直接计入两队总分，如某队派出女队员数量不足3人，则仍按每人5次罚篮机会进行。");
                        para.appendChild(node);
                        gamerule.appendChild(para);
						gamerule.innerText="在中场休息时，每队派出3名女队员进行罚篮比赛（可起跳），每人5次罚篮机会，每中一球加一分，得分直接计入两队总分，如某队派出女队员数量不足3人，则仍按每人5次罚篮机会进行。"
					}
					else
					{
					    var gamerule=document.getElementById("gamerule");
                        gamerule.innerText="";
						var para=document.createElement("p");
                        var node=document.createTextNode("1、各参赛单位上场运动员中：男教师不少于2人，男学生不多于2人，学生运动员须为在读硕士生，博士生（实验中心允许有至多同时2名本科生上场；教研室允许有同时1名本科生上场；其它单位不允许本科生上场。");
                        para.appendChild(node);
                        gamerule.appendChild(para);
						
						para=document.createElement("p");
                        node=document.createTextNode("2、 对于参加学校“三好杯”篮球赛（往年和今年）的学生，各参赛单位允许且仅允许在第三小节至多同时1名队员上场。");
                        para.appendChild(node);
                        gamerule.appendChild(para);
						
						para=document.createElement("p");
                        node=document.createTextNode("3、比赛中犯规满5次者将被罚下场，若因犯规罚下，导致某队场上男教师人数小于规定人数，则可增补女运动员代替上场，此时，女运动员不再享有任何特殊政策（得分不加倍、男运动员可对其防守）");
                        para.appendChild(node);    
                        gamerule.appendChild(para);
					}
				}
				document.getElementById("hometeamscore").innerText=homeTeamScore;
				document.getElementById("awayteamscore").innerText=awayTeamScore;
				
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
			    var url="ChangePlayerState.servlet?playerID="+playerID+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID+"&state=bench";
		        sendRequest(url);
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
		document.getElementById(playerID).setAttribute("style","background-color:#00FF00");
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
	    document.getElementById(playerID).setAttribute("style","background-color:white");
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
		document.getElementById(playerID).setAttribute("style","background-color:#FF0000");
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
	*上传比赛数据到比赛表allgamebtable 中，用于页面显示
	*/
	function uploadallgametable()
	{
	    changeGameState(globalHomeTeamID,globalAwayTeamID,100);//100表示刷新allgameball表     	
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
    