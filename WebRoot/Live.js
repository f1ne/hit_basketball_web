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
					document.getElementById(playerID+"score").innerText=score;
					document.getElementById(playerID+"foul").innerText=foul;
				}
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
	//刷新函数
	function refresh(homeTeamID,awayTeamID){
		var url="LiveRefresh.servlet?homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
		sendRequest(url);
	}