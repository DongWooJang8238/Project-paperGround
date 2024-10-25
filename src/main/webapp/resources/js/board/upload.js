// 비어있는 요소 복사
let uploadDiv = document.querySelector('.uploadDiv');
//cloneNode(true) : true -> 하위 노드까지 복사할 것인지
let cloneObj = uploadDiv.firstElementChild.cloneNode(true);

const regex = new RegExp("(.*?)\.(png|jpg|txt|webp|exe|sh|zip|alz)$");
const MAX_SIZE = 15242880; //5MB

function checkExtension(fileName, fileSize){
	if(fileSize >= MAX_SIZE){
		alert("파일 사이즈 초과");
		return false;
	}
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}



document.querySelector('input[type="file"]').addEventListener('change', ()=> {
	const formData = new FormData();
	const inputFile = document.querySelector('input[type=file]');
	const files = inputFile.files;
	
	for(let i=0; i<files.length; i++){

		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		
		formData.append("uploadFile", files[i]);
	}
	
	fetch('/uploadAsyncAction',
			{
				method : 'post',
				body : formData
			}
		)
		.then(response => response.json())
		.then(json => {
			console.log(json);
			
			// uploadDiv.replaceChild(cloneObj.cloneNode(true), uploadDiv.firstElementChild);
			
			inputFile.value = '';
			
			showUploadFile(json);
		})
		.catch(err => console.log(err));
	
});

let uploadResult = document.querySelector('.uploadResult ul');
function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length==0) return;
	
	let str = '';
	uploadResultArr.forEach( file => {
		let fileCallPath = encodeURIComponent(file.uploadPath + "/" +
											file.uuid + "_" + file.fileName);
		
		
		str += `<li path="${file.uploadPath}" uuid="${file.uuid}" fileName="${file.fileName}">`;
		//str += '<a href="/download?fileName=' + fileCallPath + '">';
		str += "<a>";
		str += file.fileName;
		str += "</a>";
		str += "<span data-file='" + fileCallPath + "'> X </span>";
		str += "</li>";
	});
	uploadResult.innerHTML = str;
}

uploadResult.addEventListener('click', (e)=>{
	
	if(e.target.tagName === 'SPAN'){
		let targetFile = e.target.getAttribute('data-file');
		
		fetch('/deleteFile',
				{
					method : 'post',
					body : targetFile,
					headers : {
						'Content-type' : 'text/plain'
					}
				}
			)
			.then(response => response.text())
			.then(result => {
				console.log(result);
				
				// 해당 태그 삭제
				let targetLi = e.target.closest('li');
				targetLi.parentNode.removeChild(targetLi);
			})
			.catch(err => console.log(err));
		
	}
})

