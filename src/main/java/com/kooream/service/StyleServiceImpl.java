package com.kooream.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleVO;
import com.kooream.mapper.StyleImageMapper;
import com.kooream.mapper.StyleMapper;
import com.kooream.mapper.StyleReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StyleServiceImpl implements StyleService{
	private StyleMapper mapper;
	private StyleImageMapper imageMapper;
	private StyleReplyMapper replyMapper;
	
	@Override
	public List<StyleVO> getList(Criteria cri) {
		List<StyleVO> list = mapper.getList(cri); 
		for (StyleVO styleVO : list) {
			long style_no = styleVO.getStyle_no();
			List<StyleImageVO> images = imageMapper.getImagesByStyle_no(style_no);
			styleVO.setStyle_image(images);
		}
		
		return list;
	}
	
	@Override
	public StyleVO get(long style_no) {
		return mapper.get(style_no);
	}
	
	@Override
	public List<StyleImageVO> getImageList(long style_no) {
		return imageMapper.getImagesByStyle_no(style_no);
	}
	
	@Override
	public void register(StyleVO vo) {
		mapper.insert(vo);		
		long style_no = mapper.getStyle_no();
		if (vo.getStyle_image() != null && vo.getStyle_image().size() > 0) {
			for (StyleImageVO image : vo.getStyle_image()) {
				image.setStyle_no(style_no);
				imageMapper.insert(image);
			}
		}
	}
	
	@Override
	@Transactional
	public boolean remove(long style_no) {
		if (mapper.getCountReply(style_no) > 0) {
			replyMapper.deleteByStyleNo(style_no);
		}
		imageMapper.deleteAll(style_no);
		return mapper.delete(style_no) == 1;
	}
	
	@Override
	public void update(StyleVO vo) {
		
	}
}