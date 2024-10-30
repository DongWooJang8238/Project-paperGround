const inputImgName = document.querySelector('input[name="ReviewImgName"]'); 
const inputImgUUID = document.querySelector('input[name="ReviewImgUuid"]');
console.log(inputImgUUID);
console.log(inputImgName);
function previewImage(event) {
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다.');
		return;
	}else{
	
    const imagePreview = document.getElementById('imagePreview');
    const file = event.target.files[0];
    
    const formData = new FormData();
    
    formData.append("uploadFile", file);
    
    fetch('/shopUpload/uploadAsyncAction', {
		method : 'post',
		body : formData
	})
		.then(response => response.json())
		.then(data => {
//			console.log(data.reviewimguuid);
			
			if(data){
				const imgName = data.reviewimgname;
				const imgUuid = data.reviewimguuid;
//				const imgPath = "/resources/images/" + imgUuid + "_" + imgName;
				inputImgName.value = imgName;
				inputImgUUID.value = imgUuid;
				console.log(inputImgUUID.value);
				console.log(inputImgName.value);
			}else {
				alert('서버 오류');
			}
			
			
			if (file) {
				const reader = new FileReader();
				
				reader.onload = function (e) {
					imagePreview.src = e.target.result; // 선택한 파일의 URL을 미리보기 이미지의 src에 설정
					imagePreview.style.display = 'block'; // 이미지 표시
				};
				
				reader.readAsDataURL(file); // 파일 읽기
			}
			
		})
		.catch(err => console.log(err));
	}

}

//별점 js
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.ratings').forEach(starsContainer => {
        const stars = starsContainer.querySelectorAll('.rating');

        stars.forEach(star => {
            star.addEventListener('click', function() {
                const ratingValue = parseInt(this.getAttribute('data-value'));

                // ratings의 data-rating 값 업데이트
                starsContainer.setAttribute('data-rating', ratingValue.toFixed(1));

                // 별 색상 업데이트
                stars.forEach((s, index) => {
                    if (index < ratingValue) {
                        s.style.color = '#FFD700'; // 노란색
                    } else {
                        s.style.color = '#FFF'; // 흰색
                    }
                });

                // 반별 처리
                if (ratingValue % 1 >= 0.5) {
                    stars[ratingValue - 1].style.color = '#FFD700'; // 마지막 별을 노란색으로 설정
                }
            });
        });

        // 초기 색상 설정
        const rating = parseFloat(starsContainer.getAttribute('data-rating'));
        stars.forEach((star, index) => {
            if (index < Math.floor(rating)) {
                star.style.color = '#FFD700'; // 노란색
            } else if (index === Math.floor(rating) && rating % 1 >= 0.5) {
                star.style.color = '#FFD700'; // 노란색 반 개
            } else {
                star.style.color = '#FFF'; // 흰색
            }
        });
    });
});


document.querySelector('.submit-review').addEventListener('click', e=> {
	// 리뷰 등록 비동기 ( 첨부파일 db에 저장까지 )
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		reviewAdd();
	}
});

function reviewAdd() {
	const formData = new FormData();
	
	const dataRating = parseInt(document.querySelector('.ratings').getAttribute('data-rating'));
	console.log("uuid : " + inputImgName.value);
	console.log("리뷰내용 : " + document.querySelector('.review-body').value);
	console.log("별점 : " + dataRating);
	formData.append("reviewImage",inputImgName.value);
	formData.append("reviewContent", document.querySelector('.review-body').value)
	formData.append("bno", bno);
	formData.append("mno", mno.value);
	formData.append("rating", dataRating);
	
	fetch('/review/new', {
      method: 'POST',
      body: formData, 
  })
  .then(response => response.text())
  .then(data => {
	  console.log(data);
	  // 댓글 불러오기 함수
	  if(data === "success"){
		  alert("소중한 리뷰 감사합니다!");
		  reviewLoad();
	  }else if(data === "false"){
		  alert('이미 리뷰에 참여하셨습니다.');
	  }else {
		  alert('서버 오류');
	  }
  })
  .catch(error => console.error('Error:', error));
}

reviewLoad();

// 댓글 불러오기 함수
function reviewLoad() {
	console.log("댓글 불러오기 bno : " + bno);
	let replyUL = document.querySelector('.chat');
	
	fetch(`/review/get/${bno}`)
	  .then(response => response.json()) // 응답을 JSON 형식으로 파싱
	  .then(data => {
		  // 댓글 불러오기 로직
		  let msg = "";
		  data.forEach(rvo => {
//			  console.log(data.reviewContent);
			  const date = new Date(rvo.reviewDate);
			  const sqlDate = date.toLocaleDateString('en-CA');
			  
			  msg += `<li>`;
			  msg += `<div>`;
			  msg += `<div class="chat-header">`;
			  msg += `<strong class="primary-font">${rvo.userName}</strong>`;
			  msg += `<small class="pull-right">${sqlDate}</small>`;
			  msg += `</div>`;
			  msg += `<div class="stars" data-rating="${rvo.rating}.0">`;
			  msg += `<span class="star">&#9733;</span> `;
			  msg += `<span class="star">&#9733;</span> `;
			  msg += `<span class="star">&#9733;</span> `;
			  msg += `<span class="star">&#9733;</span> `;
			  msg += `<span class="star">&#9733;</span> `;
			  msg += `</div>`;
			  msg += `<p>${rvo.reviewContent}</p>`;
			  if(rvo.reviewImage === null){
				  
			  }else{
				  msg += `<img src="${rvo.reviewImage}" alt="예시 이미지" class="comment-image" style="max-width: 200px;" />`;
			  }
			  msg += `<button onclick="deleteReview(${rvo.bno}, ${rvo.mno})">삭제</button>`;
			  msg += `</div>`;
			  msg += `</li>`;
		  });
		  
		  replyUL.innerHTML = msg;
		  
		  applyStarRatings();
	  })
	  .catch(error => console.error('Error:', error));
}

// 리뷰 삭제
function deleteReview(rbno, rmno) {
	console.log(rmno);
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else if(mno.value == rmno){

	fetch(`/review/deleteReview/${rbno}/${rmno}`)
	  .then(response => response.text()) // 응답을 JSON 형식으로 파싱
	  .then(data => {
		  console.log(data);
		  // 리뷰 불러오기 로직
		  reviewLoad();
		  applyStarRatings();
	  })
	  .catch(error => console.error('Error:', error));

	}else {
		alert('꺼지쇼');
		return;
	}
}