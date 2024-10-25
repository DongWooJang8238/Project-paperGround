console.log("kaak");

document.addEventListener("DOMContentLoaded", function () {
    // 모든 페이징 링크 가져오기
    const paginationLinks = document.querySelectorAll(".paging a");

    // 각 페이징 링크에 클릭 이벤트 추가
    paginationLinks.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault(); // 기본 페이지 이동 방지

            const page = this.getAttribute("href").split("=")[1]; // 페이지 번호 가져오기
            loadPage(page);
        });
    });
});

// AJAX로 페이지 데이터를 가져오는 함수
function loadPage(page) {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", `board.jsp?page=${page}`, true); // 선택한 페이지 번호를 포함한 요청

    xhr.onload = function () {
        if (xhr.status === 200) {
            // 응답을 HTML로 파싱하여 테이블 내용과 페이징 링크 업데이트
            const parser = new DOMParser();
            const doc = parser.parseFromString(xhr.responseText, "text/html");

            const newTableBody = doc.querySelector("tbody").innerHTML;
            const newPaging = doc.querySelector(".paging").innerHTML;

            document.querySelector("tbody").innerHTML = newTableBody;
            document.querySelector(".paging").innerHTML = newPaging;

            // 새로운 페이징 링크에 이벤트 재설정
            rebindPaginationEvents();
        }
    };

    xhr.send();
}

// 페이징 링크에 이벤트 다시 바인딩
function rebindPaginationEvents() {
    const newPaginationLinks = document.querySelectorAll(".paging a");

    newPaginationLinks.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault();
            const page = this.getAttribute("href").split("=")[1];
            loadPage(page);
        });
    });
}
