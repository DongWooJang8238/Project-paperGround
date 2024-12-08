/*-------------- 버튼 요소들 ------*/
// img 버튼
const profileImage = document.getElementById("userIcon"); 
// x 버튼
const deleteImage = document.getElementById("deleteImage"); 
// input 태그
const imageInput = document.getElementById("imageInput");


const regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
const MAX_SIZE = 5242880; // 5MB

//console.log(profileImage);
//console.log(deleteImage);
//console.log(imageInput);


function checkExtension(fileName, fileSize) {
	if(fileSize >= MAX_SIZE){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}


// 이미지 삭제 (초기 이미지) - input창 초기화
deleteImage.addEventListener("click", () =>{

//	console.log(1234);
    profileImage.setAttribute("src","../resources/images/usericon.jpg");

    imageInput.value = ""; 
    document.querySelector('#goChange').setAttribute("onclick", "goResetIcon(this.form)");
    
});

imageInput.addEventListener('change', e => {
	document.querySelector('#goChange').setAttribute("onclick", "goChangeIcon(this.form)");
})

// 파일 선택 시 확장자 검증 - input창 초기화
imageInput.addEventListener('change', () =>{
	const files = imageInput.files;
	const formData = new FormData();
	
//		console.log(files[0]);
		if(!checkExtension(files[0].name, files[0].size)){
			imageInput.value = ""; 
			return false;
		}
		console.log(files[0].name)
//		formData.append("newIcon",files[0])
		 const reader = new FileReader();

        reader.readAsDataURL(files[0]);
        reader.onload = e => {
//             console.log(e.target);
//             console.log(e.target.result); 

            const url = e.target.result;

            // 프로필 이미지(img) 태그에 src 속성으로 추가
            profileImage.setAttribute("src", url);
        }
});


function goResetIcon(form) {
	const formData = new FormData();
	formData.append('userId',form.userId.value);
	formData.append('userIcon',profileImage.getAttribute("src"));
	
	fetch('/asycn/resetIcon', {
		method : 'post',
		body : formData
	})
	.then(response => response.text())
	.then(text => {
		console.log(text);
	})
	.catch(err => console.log(err));
	
	
}
function goChangeIcon(form) {
//	console.log(form.userIcon.value);
//	console.log(form.userIcon);
	const formData = new FormData();
	formData.append('userId',form.userId.value);
	formData.append('userIcon',form.userIcon.files[0]);
	
//	let obj = {userId : form.userId.value, userIcon : form.userIcon.files[0]};
	
//	console.log(obj);
	fetch('/asycn/updateIcon', {
		method : 'post',
		body : formData
	})
	.then(response => response.text())
	.then(text => {
//		console.log(text);
		if(text == "success"){
			alert("아이콘을 변경하였습니다.");
		}
	})
	.catch(err => console.log(err));
	
}