//�๤��
var ClassUtils=Class.create();
ClassUtils.prototype={
	_ClassUtilsName:'ClassUtils',
	initialize:function(){
	},
	/**
	 * �����ÿ������ע��һ������������������
	 * @param reference ������������
	 */
	registerFuncSelfLink:function(reference){
		for (var n in reference) {
        	var item = reference[n];                        
        	if (item instanceof Function) 
				item.$ = reference;
    	}
	}
}
//Ajax������װ�ࣺ
//���ڵ���AjaxRequest�����XMLHTTPRequest����ʱ��this���ã�ָ��ǰ�Ķ��󣩻������call stack���⣬�Ӷ�ָ��ǰ�Ķ���
//���ԣ���putRequest��callBackHandler���Լ�callback������Ҫʹ��arguments.callee.$�������ȷ�����������
var AjaxWrapper=Class.create();
AjaxWrapper.prototype={
	debug_flag:false,
	xml_source:'',
	/**
	 * ��ʼ��
	 * @param isDebug �Ƿ���ʾ������Ϣ
	 */
	initialize:function(isDebug){
		new ClassUtils().registerFuncSelfLink(this);
		this.debug_flag=isDebug;
		
	},
	/**
	 * ��get�ķ�ʽ��server����request
	 * @param url
	 * @param params
	 * @param callBackFunction ���ͳɹ���ص��ĺ������ߺ�����
	 */
	putRequest:function(url,params,callBackFunction){
		var funcHolder=arguments.callee.$;
	    var xmlHttp = new Ajax.Request(url,
			{
				method: 'get', 
	    		parameters: params, 
				requestHeaders:['my-header-encoding','utf-8'],
	    		onFailure: function(){
					alert('�Բ�������ͨѶʧ�ܣ�������ˢ�£�');
				},
				onSuccess: function(transport){
				},
				onComplete: function(transport){
					funcHolder.callBackHandler.apply(funcHolder,[transport,callBackFunction]);
				}
			});
	},
	/**
	 * ��post�ķ�ʽ��server����xml����
	 * @param url
	 * @param postDataBody
	 * @param callBackFunction ���ͳɹ���ص��ĺ������ߺ�����
	 */
	pushRequest:function(url,postDataBody,callBackFunction){
		var funcHolder=arguments.callee.$;
		var options={
				method: 'post', 
		    	parameters:'',
		    	requestHeaders:['my-header-encoding','utf-8'],
		    	postBody: postDataBody,
				onFailure: function(transport){
					alert('�Բ�������ͨѶʧ�ܣ������·��ͣ�');
				},
				onComplete: function(transport){
					funcHolder.callBackHandler.apply(funcHolder,[transport,callBackFunction]);
				}
			};
		var xmlHttp = new Ajax.Request(url,options);
	},
	/**
	 * Զ�̵��õĻص�����
	 * @param transport xmlhttp��transport
	 * @param callBackFunction �ص�ʱcall�ķ����������Ǻ���Ҳ�����Ǻ�����
	 */
	callBackHandler:function(transport,callBackFunction){
		var funcHolder=arguments.callee.$;
		if(transport.status!=200){
			alert("��û�Ӧʧ��,����״̬:"+transport.status);
		}
		else{
			funcHolder.xml_source=transport.responseText;
			if (funcHolder.debug_flag)
				alert('call callback function');
			if (typeof(callBackFunction)=='function'){
				if (funcHolder.debug_flag){
					alert('invoke callbackFunc');
				}
				callBackFunction(transport.responseText);
			}
			else{
				if (funcHolder.debug_flag){
					alert('evalFunc callbackFunc');
				}
				new execute().evalFunc(callBackFunction,transport.responseText);
			}
			if (funcHolder.debug_flag)
				alert('end callback function');
		}
	},
	//��ʾxml��Ϣ
	showXMLResponse:function(){
		var funcHolder=arguments.callee.$;
		alert(funcHolder.xml_source);
	}
}

var XMLDomForAjax=Class.create();
XMLDomForAjax.prototype={
	isDebug:false,
	//dom�ڵ����ͳ���
	ELEMENT_NODE:1,
	ATTRIBUTE_NODE:2,
    TEXT_NODE:3,
    CDATA_SECTION_NODE:4,
    ENTITY_REFERENCE_NODE:5,
    ENTITY_NODE:6,
    PROCESSING_INSTRUCTION_NODE:7,
    COMMENT_NODE:8,
    DOCUMENT_NODE:9,
    DOCUMENT_TYPE_NODE:10,
    DOCUMENT_FRAGMENT_NODE:11,
    NOTATION_NODE:12,
    
	initialize:function(isDebug){
		new ClassUtils().registerFuncSelfLink(this);
		this.isDebug=isDebug;
	},
	/**
	 * ������ƽ̨��dom������
	 * @param xml xml�ַ���
	 * @return dom������
	 */
	createDomParser:function(xml){
		// code for IE
		if (window.ActiveXObject){
		  var doc=new ActiveXObject("Microsoft.XMLDOM");
		  doc.async="false";
		  doc.loadXML(xml);
		}
		// code for Mozilla, Firefox, Opera, etc.
		else{
		  var parser=new DOMParser();
		  var doc=parser.parseFromString(xml,"text/xml");
		}
		return doc;
	},
	/**
	 * �������л�xml��javascript Bean
	 * @param xml xml�ַ���
	 * @return javascript Bean
	 */
	deserializedBeanFromXML:function (xml){
		var funcHolder=arguments.callee.$;
		var doc=funcHolder.createDomParser(xml);
		// documentElement�ܱ�ʾ�ĵ���root
		var objDomTree=doc.documentElement;
		var obj=new Object();
	    for (var i=0; i<objDomTree.childNodes.length; i++) {
	    	//��ýڵ�
	    	var node=objDomTree.childNodes[i];
	    	//ȡ�����е�fieldԪ�ؽ��д���
	        if ((node.nodeType==funcHolder.ELEMENT_NODE) && (node.tagName == 'field')) {
	        	var nodeText=funcHolder.getNodeText(node);
	        	if (funcHolder.isDebug){
		            alert(node.getAttribute('name')+' type:'+node.getAttribute('type')+' text:'+nodeText);
	        	}
	            var objFieldValue=null;
	            //���Ϊ�б�
	            if (node.getAttribute('type')=='java.util.List'){
	            	if (objFieldValue && typeof(objFieldValue)=='Array'){
		            	if (nodeText.length>0){
							objFieldValue[objFieldValue.length]=nodeText;
						}
					}
					else{
						objFieldValue=new Array();
					}
				}
				else if (node.getAttribute('type')=='long' 
					|| node.getAttribute('type')=='java.lang.Long'
					|| node.getAttribute('type')=='int'
					|| node.getAttribute('type')=='java.lang.Integer'){
					
					objFieldValue=parseInt(nodeText);
				}
				else if (node.getAttribute('type')=='double' 
					|| node.getAttribute('type')=='float'
					|| node.getAttribute('type')=='java.lang.Double'
					|| node.getAttribute('type')=='java.lang.Float'){
					
					objFieldValue=parseFloat(nodeText);
				}
				else if (node.getAttribute('type')=='java.lang.String'){
					objFieldValue=nodeText;
				}
				else{
					objFieldValue=nodeText;
				}
				//��ֵ������
				obj[node.getAttribute('name')]=objFieldValue;
				if (funcHolder.isDebug){
					alert(eval('obj.'+node.getAttribute('name')));
				}
	        }
	        else if (node.nodeType == funcHolder.TEXT_NODE){
	        	if (funcHolder.isDebug){
			        //alert('TEXT_NODE');
	        	}
		        
	        }
	        else if (node.nodeType == funcHolder.CDATA_SECTION_NODE){
	        	if (funcHolder.isDebug){
		        	//alert('CDATA_SECTION_NODE');
	        	}
	        }
	    }
	    return obj;
	},
	/**
	 * ���dom�ڵ��text
	 */
	getNodeText:function (node) {
		var funcHolder=arguments.callee.$;
	    // is this a text or CDATA node?
	    if (node.nodeType == funcHolder.TEXT_NODE || node.nodeType == funcHolder.CDATA_SECTION_NODE) {
	        return node.data;
	    }
	    var i;
	    var returnValue = [];
	    for (i = 0; i < node.childNodes.length; i++) {
	    	//���õݹ��㷨
	        returnValue.push(funcHolder.getNodeText(node.childNodes[i]));
	    }
	    return returnValue.join('');
	}
}

//ί������
var Dispatcher=Class.create();
Dispatcher.prototype={
	name:'Dispatcher',
	//��class�е�ÿ��function����ֵһ��ֵΪthis��$����
	initialize:function(){
		new ClassUtils().registerFuncSelfLink(this);
	},
	/**
	 * ί�е���
	 * @param caller �����ߣ�func��ӵ����
	 * @param func �����function������ʹ��Dispatcher�����Լ���name��Ϊ����������ֱ�ӵ���func
	 */
	dispatch:function(caller,func){
		if (func instanceof Function){
			var funcArguments=new Array();
			funcArguments[0]=arguments.callee.$.name;
			func.apply(caller,funcArguments);
		}
		else{
			eval(func);
		}
	}
}
//������
var Invoker=Class.create();
Invoker.prototype={
	name:'Invoker',
	initialize:function(){
	},
	invoke:function(showMsg){
		alert(showMsg+"����this.name="+this.name);
	}
}