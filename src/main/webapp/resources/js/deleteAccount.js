
let checkbox = document.querySelector('input[name=checkbox]');
//console.log(checkbox);
//console.log(checkbox.checked);



function openModal() {
    document.getElementById("modal").style.display = "flex";
    
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
}

function toggleTextarea(select) {
    const customReasonDiv = document.getElementById('customReason');
    if (select.value === 'custom') {
        customReasonDiv.style.display = 'block';
    } else {
        customReasonDiv.style.display = 'none';
    }
}


// 탈퇴버튼
function confirmAction() {
	const reason = document.querySelector('select[name="reason"]');
	let reasonVal = null;
	if(reason.value === 'not'){
		alert('탈퇴 사유를 선택 해 주세요');
		return;
	}else if(reason.value === 'custom'){
		const customReason = document.querySelector('#customInput').value;
		if(customReason === '' || customReason.length < 3){
			alert('탈퇴 사유가 너무 짧습니다. 최소 3글자 이상으로 적어주세요.');
			return;
		}
		reasonVal = customReason;
	}else {
		reasonVal = reason.value;
	}
	fetch(`/User/deleteUser?mno=${mno.value}&reason=${reasonVal}`)
		.then(response => response.text())
		.then(result => {
			closeModal();
			location.href = '/customLogout';
		})
		.catch(err => console.log(err));
}


function deleteButton() {
//	console.log(1);
	if(checkbox.checked != true){
		alert("탈퇴시 주의사항을 확인 후 동의하여 주세요.");
		return;
	}
	 openModal();
}