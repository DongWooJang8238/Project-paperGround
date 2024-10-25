function sendMessage() {
            const input = document.getElementById('chatInput');
            const message = input.value;
            if (message) {
                const chatBody = document.getElementById('chatBody');
                const messageDiv = document.createElement('div');
                messageDiv.className = 'message myMessage';
                messageDiv.innerHTML = `<div>${message}</div>
                                        <div style="font-size: smaller;">${new Date().toLocaleString()}</div>`;
                chatBody.appendChild(messageDiv);
                input.value = ''; // 입력창 비우기
                chatBody.scrollTop = chatBody.scrollHeight; // 스크롤 하단으로 이동
            }
        }