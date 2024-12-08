console.log("kaaaak");
let f = document.forms[0];
let totalPrice = 0;

document.addEventListener("DOMContentLoaded", function () {

    document.getElementById("goRefund").addEventListener("click", function () {

		const radioButtons = document.querySelectorAll('input[name="option"]');
		const refundOrCancel = document.querySelector('input[name="option"]:checked').value;
		const reason = document.getElementById("reason").value;
		const detail = document.getElementById("details").value;
		const bankName = document.getElementById("bankName").value;
		const accountNumber = document.getElementById("accountNumber").value;
		const status = document.querySelector('.form-check').getAttribute('data-status');
		
		const refundVO = {
		        mno: document.getElementById("mno").value,
		        odno: document.getElementById("odno").value,
		        refundOrCancel: refundOrCancel,
		        reason: reason,
		        detail: detail,
		        bankName: bankName,
		        accountNumber: accountNumber
		    };
		console.log("RefundVO 데이터:", refundVO);
		
		fetch('/refund/refundProcess', {
		    method: 'POST',
		    headers: { 'Content-Type': 'application/json' },
		    body: JSON.stringify(refundVO)
		})
		.then(response => response.text())
		.then(data => {
		    console.log("서버 응답:", data);
		    alert("접수 완료");
		    location.href='/'
		})
		.catch(error => {
		    console.error("에러 발생:", error);
		});

    });

});

/*
document.querySelector(".form-check-input").addEventListener('click', ()=> {       
	if (button.value === 'exchange') {
		console.log('환불 선택됨');
		
		
	} else if (button.value === 'cancel') {
		console.log('취소 선택됨')
		}
       
   
});
*/





