<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<style>
	.content_area{
		overflow: hidden;
		max-width: 780px;
		min-height: 900px;
		margin: 0 auto;
		padding: 20px 40px 160px;
	}
	
	.buy_before{
		-webkit-box-align: center;
		align-items: center;
		width: 100%;
		margin-bottom: 20px;
	}
	
	.product_info{
		padding: 32px 32px 28px;
		box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
		background-color: #fff;
		border-bottom: 1px solid #ebebeb;
	}
	
	.product_image{
		border-radius: 7px;
		height: 80px;
		width: 80px;
		float: left;
		margin-right: 16px;
		position: relative;
	}
	
	.code{
		line-height: 17px;
		font-size: 14px;
		font-weight: 700;
	}
	
	.name{
		line-height: 17px;
		font-size: 14px;
	}
	
	.kor_name{
		line-height: 16px;
		font-size: 13px;
		letter-spacing: -.05px;
		color: rgba(34,34,34,.5);
	}
	
	.p_size{
		font-size: 14px;
		font-weight: 700;
		margin-top: 7px;
		margin-bottom: 7px;
	}
	
	.infobox{
		border-bottom: 1px solid #ebebeb;
		padding-bottom: 30px;
	}
	
	.buy_price, .sell_price{
		align-items: center;
		padding-top: 28px;
		padding-bottom: 22px;
	}
	
	.buy_price {
		width : 50%;
		float: left;
		text-align: center;
	}
	
	.box_border{
		border-right: 1px solid #ebebeb;
	}
	
	.sell_price {
		width : 50%;
		float: right;
		text-align: center;
	}
	
	.price_descision_box{
		overflow : hidden;
	}
	
	.now_buysell{
		font-size: 12px;
		letter-spacing: -.06px;
		color: rgb(144 144 144);
	}
	
	.now_price, .won{
		font-size: 16px;
	}
	
	.select_box{
		border-radius: 80px;
		border: 1px solid #ebebeb;
		margin-bottom: 27px;
		background-color: #f4f4f4;
	}
	
	.box_test{
		overflow : hidden;
	}
	
	.bid_box{
		float: left;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #41b979;
		color:white;
		font-weight: 700;
	}
	
	.sell_box{
		float: right;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		color: rgba(34,34,34,.8);
		text-align: center;
		width:50%;
		cursor:pointer;
	}
	
	.sell_box{
		font-weight: 700;
	}
	
	.sell_box2{
		float: right;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #41b979;
		color:white;
		
	}
	
	.bid_box2{
		float: left;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		color: rgba(34,34,34,.8);
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #f4f4f4;
		font-weight: 700;
	}
	
	.orenge_box{
	
	}
	
	.price{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		margin-top: 15px;
		float: right;
	}
	
	.price_now_box{
		display: flex;
		justify-content: space-between;
		padding-bottom: 10px;
		border-bottom: 2px solid #ebebeb;
		
	}
	
	.price_now_title{
		font-size: 14px;
		letter-spacing: -.21px;
		font-weight: 700;
		min-width: 63px;
	}
	
	.price{
		font-size: 20px;
		font-weight: 600;
	}
	
	.price_bind{
		color: rgba(34,34,34,.5);
		padding-top: 10px;
		font-size: 14px;
	}
	
	.price_bind_empty{
		color: rgba(34,34,34,.5);
		padding: 15px 0 30px 0;
		font-size: 14px;
	}
	
	.buy_total_confirm{
		border-top: 1px solid #ebebeb;
		background-color: #fff;
	}
	
	.price_total{
		padding-top: 16px;
		padding-bottom: 12px;
	}
	
	.price_title{
		font-size: 13px;
		letter-spacing: -.07px;
	}
	
	.price_box{
		display: flex;
		justify-content: space-between;
		align-items: center;
    }
    
    .price_empty_desc{
		color: #909090;
    }
    
    .btn_confirm{
    	font-weight: 600;
	}
    
    .btn_box{
		width: 100%;
		font-size: 16px;
		letter-spacing: -.16px;
		height: 52px;
		border-radius: 12px;
		color: #fff;
		background-color: #222;
		vertical-align: middle;
		text-align: center;
		align-items: center;
    }
    
    .full{
		display: inline-flex;
		cursor: pointer;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: center;
		justify-content: center;
		vertical-align: middle;
		text-align: center;
    }
    
	.price_input{
		border: none;
		text-align: right;
    }
    
    .bid_now_box{
    	display: none;
    }
    
	input:focus {outline: none;}
	
	.buy_bid_btn{
		display: none;
	}

</style>

<div class="content_area">
	<form name="shop_bidsell" method="post" id="bidSellForm">
		<div class="buy_before">
			<div class="product_info">
				<div class="infobox">
					<c:forEach items="${imageUrls}" var="imageUrl" begin="0" end="0">
						<img class="product_image" src="${imageUrl }">
					</c:forEach>
					<div class="product_infobox">
						<div class="code">${vo.p_model_no }</div>
						<div class="name">${vo.p_name_en }</div>
						<div class="kor_name">${vo.p_name_ko }</div>
						<div class="p_size">${vo2.pp_size }</div>
					</div>
				</div>
				<div class="price_descision_box">
					<div class="buy_price">
						<div class="box_border">
							<div class="now_buysell">즉시 구매가</div>
							<span class="now_price"><fmt:formatNumber value="${vo3.bid_buy }" pattern="#,###,###"/></span><span class="won">원</span>
						</div>
					</div>
					<div class="sell_price">
						<div class="now_buysell">즉시 판매가</div>
						<span class="now_price"><fmt:formatNumber value="${vo2.bid_sell }" pattern="#,###,###"/></span><span class="won">원</span>
					</div>
				</div>
					<div class="instant_group">
						<div class="select_box">
							<div class="box_test">
								<div class="bid_box">	
									즉시 판매
								</div>
								<div class="sell_box">
									판매 입찰
								</div>
							</div>
						</div>
						<div class="price_now">
							<dl class="price_now_box">
								<dt class="price_now_title">즉시 판매가</dt>
								<dd class="price">
									<span class="amount" ><fmt:formatNumber value="${vo2.bid_sell }" pattern="#,###,###"/></span>
									<span class="won">원</span>
								</dd>
							</dl>
							<dl class="bid_now_box">
								<dt class="price_now_title">판매 입찰</dt>
								<dd class="price">
									<input type="number" placeholder="희망가 입력" name="bid_buy" id="bid_buy" class="price_input"/>
									<span class="won">원</span>
									<input type="hidden" name="p_no" value="${vo.p_no}">
									<input type="hidden" name="bid_sell" id="bid_sell" value="${vo2.bid_sell }">
									<input type="hidden" name="pp_size" value="${vo2.pp_size }">
								</dd>
							</dl>
						</div>
						<div class="price_bind">
							<p class="price_bind_empty">총 결제금액은 다음 화면에서 계산됩니다.</p>
						</div>
						<div class="buy_total_confirm">
							<div class="price_total">
								<dl class="price_box">
									<dt class="price_title">정산 금액</dt>
									<dd class="price_empty_desc">다음 화면에서 확인</dd>
								</dl>
							</div>
						</div>
						<div class="now_buy_btn">
							<div class="btn_box full" onclick="now_sell()">즉시 판매 하기</div>
						</div>
						<div class="buy_bid_btn">
							<div class="btn_box full" onclick="bid_sell()">판매 입찰 하기</div>
						</div>
					</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(".bid_box").on('click', function(){
	    $(this).removeClass("bid_box2");
	    $(".sell_box").removeClass("sell_box2");
	    $(".bid_now_box").hide();
		$(".price_now_box").show();
		$(".now_buy_btn").show();
		$(".buy_bid_btn").hide();
	});
	
	$(".sell_box").on('click', function(){
	    $(this).addClass("sell_box2");
	    $(".bid_box").addClass("bid_box2");
	    $(".price_now_box").hide();
		$(".bid_now_box").show();
		$(".buy_bid_btn").show();
		$(".now_buy_btn").hide();
	});

	function bid_sell() {
		var form = $('form');
		var bid_price = $('#bid_buy').val();	
		var now_sell = ${vo2.bid_sell };
		console.log(now_sell);
		console.log(bid_price);
		
		if (now_sell == 0) {
			var form = $('#bidSellForm');
			$('input[name="bid_sell"]').remove();
			form.attr("action", "/shop/shop_Bidsellconfirm")
			form.submit();
		} else if (bid_price < now_sell){
			alert("판매 입찰가는 즉시 판매가보다 낮을 수 없습니다.");
			return false;
		} else {
			$('input[name="bid_sell"]').remove();
			form.attr("action", "/shop/shop_Bidsellconfirm")
			form.submit();
		}
	}
	
	var m_no = $('input[name="pri_m_no"]').val();
	var m_no_input = '<input type="hidden" name ="m_no" value="'+ m_no +'">';
	console.log(m_no_input);
	$('.price_box2').html(m_no_input);

	function now_sell() {
		var form = $('form');
		if (now_sell == 0) {
			alert("입찰 유저가 없어 즉시 판매할 수 없습니다.");
			return false;
		} else {
			$('input[name="bid_buy"]').remove();
			form.attr("action", "/shop/shop_Nowsellconfirm");
			console.log(form);
			console.log(${vo.p_no });
			console.log(${vo2.bid_sell });
			$(form).submit();
		}
	}

</script>
<jsp:include page="../include/footer.jsp"/>