package com.kooream.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;
import com.kooream.domain.RntInterestVO;
import com.kooream.domain.RntReviewVO;
import com.kooream.service.RentalService;
import com.kooream.service.RntInterestService;
import com.kooream.service.RntReviewService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rental/*")
public class RantalController {
	
	@Setter(onMethod_= @Autowired)
	private RentalService service;
	
	// 댓글 서비스
	@Setter(onMethod_= @Autowired)
	private RntReviewService rp_service;
	
	// 관심상품 서비스
	@Setter(onMethod_= @Autowired)
	private RntInterestService interestService;
	
	
	
	// 렌탈 브랜드 목록 페이지 이동
	@GetMapping("/index")
	public String rentalPage(){
		return "/rental/index";
	}
	
	// 렌탈리스트 페이지 이동
	@GetMapping("/rentalList")
	public String rentalList() {	//required=false -> brand가 null값이어도 오류 안남
		return "/rental/rentalList";
	}
	
	// 상품 리스트 불러오는 ajax
	@PostMapping(value="/ajax/rentalList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductVO>> rentalList(RentalMenuVO vo) {	// required=false -> brand가 null값이어도 오류 안남
		List<ProductVO> list = service.getList(vo);
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
	}
	 
	// 렌탈 상품 등록 페이지로 이동
	@GetMapping("/addRntPrdtPage")
	public String addRntPrdtPage() {
		return "/rental/addRntPrdt";
	}
	
	// 렌탈 상품 등록 후 목록으로 이동
	@PostMapping("/addRntPrdt")
	public String addRntPrdt(ProductVO vo) {
		
		service.addRntPrdt(vo);
		
		return "redirect:/rental/rentalList";
	}
	
	// 상세보기 페이지 이동
	@GetMapping("/viewRntPrdt")
	public String viewRntPrdt(ProductVO vo, Model model) {
		// 이미지 불러오는 쿼리
		List<AttachFileVO> imageList = service.getViewImg(vo);
		// 상품 정보 불러오는 쿼리
		ProductVO pvo = service.viewPrdt(vo);
		// 리뷰 불러오는 쿼리
		List<RntReviewVO> reviewVO = rp_service.getReview(vo);
		// 관심상품 여부 보여주는 쿼리
		RntInterestVO interestVO = interestService.countInterest(vo);
		
		
		model.addAttribute("interestVO", interestVO);
		model.addAttribute("reviewVO", reviewVO);
		model.addAttribute("imageList", imageList);
		model.addAttribute("pvo", pvo);
		return "/rental/viewRntPrdt";
	}
	
	// 상품 수정 페이지 이동
	@GetMapping("/updateRntPrdtPage")
	public String updateRntPrdtPage(ProductVO vo, Model model) {
		model.addAttribute("pvo", service.viewPrdt(vo));
		// 파일 테이블에서 상품번호 기준으로 업로드된 파일(이미지) 정보 가져오기
		List<AttachFileVO> fvoList = service.getFile(vo);
		model.addAttribute("fvoList", fvoList);
		return "/rental/updateRntPrdtPage";
	}
	
	// 상품 수정 기능
	@PostMapping("/updateRntPrdt")
	public String updateRntPrdt(ProductVO vo, HttpServletRequest http) {
		service.updateRntPrdt(vo);
		return "redirect:/rental/rentalList";
	}
	
	// 상품 삭제 기능
	@PostMapping("/removeRntPrdt")
	public String removeRntPrdt(ProductVO vo) {
		service.removeRntPrdt(vo);
		return "redirect:/rental/rentalList";
	}
	
	// 관심상품추가 버튼 눌렀을때 기능
	@PostMapping(value="/insertInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int interestRnt(ProductVO vo) {
		
		// 관심상품 테이블에 상품번호 추가하는 쿼리
		int result = interestService.interestRnt(vo);
		
		
		return result;
	}

	
	// 관심상품삭제 버튼 눌렀을때 기능
	@PostMapping(value = "/removeInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int interesRemovetRnt(ProductVO vo) {
		
		// 관심상품 테이블에 상품번호 삭제하는 쿼리
		int result = interestService.intrstRemove(vo);
	
		return result;
	}
}
