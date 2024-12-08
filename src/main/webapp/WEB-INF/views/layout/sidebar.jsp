<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
  <h3>마이페이지</h3>
  <ul>
    <li>
      <a href="userInfo">
        <i class="bx bx-user"></i> 회원정보
      </a>
      <ul class="sub-menu">
        <li><a href="/User/myPageUpdate?userId=${vo.userId}">회원정보 수정</a></li>
        <li><a href="#">내 찜리스트</a></li>
      </ul>
    </li>
    <li>
      <a href="userShopping">
        <i class="bx bx-cart"></i> 쇼핑정보
      </a>
      <ul class="sub-menu">
        <li><a href="/User/OrderSelect?mno=${vo.mno}">주문목록/배송조회</a></li>
        <li><a href="#">취소/반품 내역</a></li>
      </ul>
    </li>
    <li>
      <a href="#">
        <i class="bx bx-bar-chart"></i> 활동정보
      </a>
      <ul class="sub-menu">
        <li><a href="/User/myCommenPost?userMno=${vo.mno}&filterType=posts">내 게시글/댓글</a></li>
        <li><a href="/User/myLikedWriterBookList?userMno=${vo.mno}">집필 북마크</a></li>
      </ul>
    </li>
    <li>
      <a href="/User/deleteAccount">
        <i class="bx bx-log-out"></i> 회원 탈퇴
      </a>
    </li>
  </ul>
</div>