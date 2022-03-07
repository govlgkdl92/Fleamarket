// 새 메세지 알림
var flagAlram = true;
var titleOrigin = document.title;
var timeoutId;

// 창 활성화, 비활성화 여부
var flagFocused = true;
window.onfocus = function() {
	flagFocused = true;
	if(typeof timeoutId != 'undefined' && timeoutId != null && timeoutId != '') {
		clearInterval(timeoutId);
		timeoutId = '';
		document.title = titleOrigin;
	}
};
window.onblur = function() {
	flagFocused = false;
};


$(document).ready(function() {
 	//이모티콘 전송
	$('#emoji_1').click(function(){
		webSocket.sendCmd('CMD_MSG_SEND', '<img src="../image/chat/emoji_1.gif" width="100" height="100">');
	});
	$('#emoji_2').click(function(){
		webSocket.sendCmd('CMD_MSG_SEND', '<img src="../image/chat/emoji_2.gif" width="100" height="100">');
	});
	$('#emoji_3').click(function(){
		webSocket.sendCmd('CMD_MSG_SEND', '<img src="../image/chat/emoji_3.gif" width="100" height="100">');
	});
	
	//이미지 전송
//	$('#uploadImg').on('change', getData);
//	
//	var data;
//	function getData() {
//		const input = this;
//		const file = input.files[0];
//		const reader = new FileReader();
//		reader.onload = function(progressEvent) {
//			console.log(progressEvent.target.result);
//		};
//		
//		return new Promise(function(resolve, reject) {
//			data = reader.readAsDataURL(file);
//			console.log(data);
//		});
//	};
//	
//	getData().then(function(resolvedData) {
//		console.log('늦게 : ' + resolvedData);
//		webSocket.sendCmd('CMD_MSG_SEND', '<img src="'+resolvedData+'" width="100" height="100">');
//	});
	
	$('#uploadImg').on('change', function(){
		var imageURL = '';
		const input = this;
		if(load()) return true;
		uploadAction.call(this);
	
		function load() {
			const file = input.files[0];
			const reader = new FileReader();
			reader.onload = function(progressEvent) {
				console.log(progressEvent.target.result);
				
				webSocket.sendCmd('CMD_MSG_SEND', '<img src="'+progressEvent.target.result+'" width="150" height="150">');
			};
			imageURL = reader.readAsDataURL(file);
			
			if(imageURL != '') return true;
		};
		
		function uploadAction() {
			console.log('');
		};
	});
	
	
	//이미지 전송
//	$('#uploadImg').on('change', readURL);
//	
//	function readURL() {
//		var imageURL;
//		const input = this;
//		
//		if(input.files && input.files[0]) {
//	        imageURL = window.URL.createObjectURL(input.files[0]);
//			console.log(imageURL);
//		
//		webSocket.sendCmd('CMD_MSG_SEND', '<img src="'+imageURL+'" width="100" height="100">');
//		}
//	};
	
});


// XSS 체크
const arrXss = ['<script', '<style', '<link', '<iframe', 'document.cookie', 'javascript:', '&#x', '<html', '<body', '</html', '</body', '<head'];
function xss_check(str) {
	str = str.replace(/ /gi, "");
	var Break = new Error('Break');
	var ret = '';
	try {
		arrXss.forEach(function(element) {
			if(str.toLowerCase().match(element) != null) {
				ret = element;
				throw Break;
			}
		});
	} catch (e) {
		if(ret.substring(0,2) == '</')
			return ret.substring(2);
		else if(ret.substring(0,1) == '<')
			return ret.substring(1);
		else
			return ret;
	}
	return null;
}


//불건전 단어 체크
const arrWord = [ '씨발', '시발', 'ㅅㅂ' ];
const arrWord2 = [ '병신', 'ㅄ' ];
const arrWord3 = [ 'fuck', 'sibal' ];

function word_check(str) {
	
	var str_reg = str;
	var ret = '';
	var regExp = /[\s\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
    var regExp2 = /[0-9]/g;
    var regExp3 = /[a-z]/gi;
	var Break = new Error('Break');
	
	try {
		arrWord.forEach(function(element) {
			if(str_reg.toLowerCase().match(element) != null) {
				ret = element;
				throw Break;
			}
		});
	} catch (e) {
		return ret;
	}
	
	str_reg = str;
	str_reg = str_reg.replace(regExp, "");
	str_reg = str_reg.replace(regExp2, "");
	str_reg = str_reg.replace(regExp3, "");
	try {
		arrWord2.forEach(function(element) {
			if(str_reg.toLowerCase().match(element) != null) {
				ret = element;
				throw Break;
			}
		});
	} catch (e) {
		return ret;
	}
	
	str_reg = str;
	str_reg = str_reg.replace(regExp, "");
	str_reg = str_reg.replace(regExp2, ""); 
	try {
		arrWord3.forEach(function(element) {
			if(str_reg.toLowerCase().match(element) != null) {
				ret = element;
				throw Break;
			}
		});
	} catch (e) {
		return ret;
	}
	
	return null;
}