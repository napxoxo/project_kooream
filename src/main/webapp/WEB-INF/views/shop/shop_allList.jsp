<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>

<style>
	.shop_title{
		border-bottom: 1px solid #ebebeb;
	}
	
	.shop_text{
		font-size: 28px;
		font-weight: 600;
		overflow: hidden;
	}
	
	.shop_title .shop_text {
		width: 200px;
		text-align: center;
		margin: 0 auto;
	}
	.categoty{
		position: relative;
		font-size: 20px;
		letter-spacing: -.07px;
		font-weight: 600;
	}
	.all_category{
		margin-top: 4px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 14px;
		letter-spacing: -.15px;
		color: rgba(34,34,34,.5);
	}
	
	.filter_title {
		padding: 16px 0;
		justify-content: space-between;
		align-items: center;
		cursor: pointer;
		display: flex;
	}
	
	.all_category{
		display: block;
	}
	
	.plus_btn {
		float: right;
		font-weight: bold;
		font-size: 14px;
		padding-right: 10px;
	}
	
	.minus_btn{
		float: right;
		font-weight: bold;
		font-size: 14px;
		padding-right: 10px;
		display:none;
	}
	
	.all_category.clicked {
		display:none;
	}
	.plus_btn.clicked {
		display:none;
	}

	.minus_btn.clicked {
		display: block;
	}
	
	.category_menu{
		display: none;
	}
	
	.category_menu.clicked {
		display: block;
	}
	
	.filter_box{
		display: inline-block;
	}
	
	.product_photo{
		display: inline-block;
		border: 1px solid black;
		width: 165px;
		height : 320px;
	}
	
</style>
	<div class="shop_title" style="height: 110px; width: 100%;">
		<h2 class="shop_text">SHOP</h2>
	</div>
	<div class="filter_box" style="border : 1px solid black; width : 210px;">
		<div class="filter_status" style="padding : 23px 0 15px;">
			<span class="filter_text">필터</span>
		</div>
		<div class="filter_title" id="filter_title">
			<div class="title_box">
				<span class="categoty">카테고리</span><br/>
				<span class="all_category">모든 카테고리</span>
			</div>
			<div class="plus_btn">+</div>
			<div class="minus_btn">-</div>
		</div>
		<div class="category_menu" id="category_menu">
			<label><input type="checkbox" value="신발">신발</label><br/>
			<label><input type="checkbox" value="의류">의류</label><br/>
			<label><input type="checkbox" value="패션잡화">패션잡화</label>
		</div>
		<div class="filter_title">
			<div class="title_box">
				<span class="categoty">브랜드</span><br/>
				<span class="all_category">모든 브랜드</span>
			</div>
			<div class="plus_btn">+</div>
			<div class="minus_btn">-</div>
		</div>
		<div class="category_menu" id="category_menu">
			<label><input type="checkbox" value="Nike">Nike</label><br/>
			<label><input type="checkbox" value="Vans">Vans</label><br/>
			<label><input type="checkbox" value="Jordan">Jordan</label><br/>
			<label><input type="checkbox" value="Apple">Apple</label>
		</div>
		<div class="filter_title">
				<div class="title_box">
					<span class="categoty">신발 사이즈</span><br/>
					<span class="all_category">모든 사이즈</span>
				</div>
			<div class="plus_btn">+</div>
			<div class="minus_btn">-</div>
		</div>
			<div class="category_menu" id="category_menu">
				<label><input type="checkbox" value="Nike">Nike</label><br/>
				<label><input type="checkbox" value="Vans">Vans</label><br/>
				<label><input type="checkbox" value="Jordan">Jordan</label>
				<label><input type="checkbox" value="Apple">Apple</label>
			</div>
	</div>
	<div class="product_photo">
		ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
	</div>
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	var filters = $('.filter_title');
	
	filters.on('click', function(e) {
		$(e.target).closest('.filter_title').find('.all_category').toggleClass('clicked');
		$(e.target).closest('.filter_title').find('.plus_btn').toggleClass('clicked');
		$(e.target).closest('.filter_title').find('.minus_btn').toggleClass('clicked');
	});
	
// 	var elementToToggle = $('.category_menu');
	var button = $('.filter_title');

	$(button).on('click', (e) => {
		var category_menu = $(e.target).closest('.filter_title').next('.category_menu'); // 가장 가까운 .filter_title 부모 요소 선택
		if ($(category_menu).css('display') === 'block') {
			$(category_menu).css('display', 'none');
		} else {
			$(category_menu).css('display', 'block');
		}
	});
	
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');

	checkboxes.forEach(checkbox => {
	  checkbox.addEventListener('change', event => {
	    const checkedCheckbox = event.target;
	    checkboxes.forEach(checkbox => {
	      if (checkbox !== checkedCheckbox) {
	        checkbox.checked = false;
	      }
	    });
	  });
	});
</script>