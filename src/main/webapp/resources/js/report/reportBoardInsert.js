const CSS_FILE_PATH = '/resources/css/insert.css';
//2. link 태그 설정
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
//3. head 태그에 link 엘리먼트 추가

document.head.appendChild(linkEle);

const rbf =document.forms[0];

document.querySelectorAll(".panel-body-btns button").forEach( btn =>{
	btn.addEventListener('click', ()=>{
		let type = btn.getAttribute('id');
		
		if(type ==='registerBtn'){
			register();
		}else if(type ==='resetBtn'){
			rbf.reset();
			
		}else if(type === 'indexBtn'){
			let pageData = getStorageData();
			let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
			location.href = '/report/reportBoard?' + sendData;
		}
	})
});

function register(){
	if(rbf.title.value == ''){
		alert('제목을 입력하쇼');
		return;
	}
	if(rbf.writer.value ==''){
		alert('작성자 쓰쇼');
		return;
	}
	if(rbf.content.value ==''){
		alert('내용을 입력하시오');
		return;
	}
	let str = '';
	document.querySelectorAll('.uploadResult ul li').forEach( (li,index) => {
		let path = li.getAttribute('path');
		let uuid = li.getAttribute('uuid');
		let fileName = li.getAttribute('fileName');
		
		str += `<input type="hidden" name="attachList[${index}].uploadPath" value="${path}"/>`;
		str += `<input type="hidden" name="attachList[${index}].uuid" value="${uuid}"/>`;
		str += `<input type="hidden" name="attachList[${index}].fileName" value="${fileName}"/>`;
		
	});
	rbf.insertAdjacentHTML('beforeend',str);
	console.log(rbf);
	
	rbf.action = '/report/insert';
	rbf.submit();
		
}
