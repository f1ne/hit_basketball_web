/**
 * 
 */
    var xmlHttp;
	/*创建XMLHttpRequest对象*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*处理服务器响应结果*/
	function processResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
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
	    var preScore=parseInt(document.getElementById(playerID+"score").innerText);
	    var url="Record.servlet?playerID="+playerID+"&event=score"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    document.getElementById(playerID+"score").innerText=preScore+1;
	    sendRequest(url);
	    
	}
	/*增加犯规*/
	function foul(playerID,homeTeamID,awayTeamID){
		//当前页面的犯规数据自动加1
		var prefoul=parseInt(document.getElementById(playerID+"foul").innerText);
	    document.getElementById(playerID+"foul").innerText=prefoul+1;
	    var url="Record.servlet?playerID="+playerID+"&event=foul"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    sendRequest(url);
	}