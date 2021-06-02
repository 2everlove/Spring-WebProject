package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import web.spring.service.NBoardService;
import web.spring.vo.Criteria;
import web.spring.vo.NBoardVO;
import web.spring.vo.PageNavi;

@Log4j
@Controller
public class NBoardController {

	@Autowired
	NBoardService service;
	
	
	@GetMapping("/nboard/nboardGet")
	public String get(Criteria cri, NBoardVO vo, Model model) {
		vo=service.get(vo.getNboard_no());
		model.addAttribute("vo",vo);
		return "nboard/nboardGet";
	}//get
	
	@GetMapping("/nboard/nboardList")
	public String getList(Criteria cri,Model model) {
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri,service.getTotal(cri)));
		return "/nboard/nboardList";
	}//nboardList
	
	@GetMapping("/nboard/delete")
	public String delete(Criteria cri, NBoardVO vo, RedirectAttributes rttr) {
		
		int res = service.delete(vo.getNboard_no());
		String resMsg = "";
		// �궘�젣 �꽦怨� -> 由ъ뒪�듃
		if(res>0) {
			resMsg = vo.getNboard_no()+"踰� 寃뚯떆湲��씠 �궘�젣 �릺�뿀�뒿�땲�떎.";
			rttr.addFlashAttribute("resMsg", resMsg);
			rttr.addAttribute("pageNo",cri.getPageNo());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/nboard/nboardList";
		} else {
		// �궘�젣 �떎�뙣 -> �긽�꽭�솕硫�
			resMsg = "寃뚯떆湲� �궘�젣 泥섎━�뿉 �떎�뙣 �뻽�뒿�땲�떎.";
			rttr.addFlashAttribute("resMsg", resMsg);
			rttr.addAttribute("Nboard_no", vo.getNboard_no());
			rttr.addAttribute("pageNo",cri.getPageNo());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/nboard/nboardGet";
		}
	}//delete
	
	@PostMapping("/nboard/update")
	public String editExe(Criteria cri, NBoardVO vo, RedirectAttributes rttr) {
		int res = service.update(vo);
		service.nboardLock(vo);
		String resMsg = "";
		if(res>0) {
			resMsg = "�닔�젙 �릺�뿀�뒿�땲�떎.";
		}
		else {
			resMsg = "�닔�젙 �옉�뾽 �떎�뙣 �뻽�뒿�땲�떎. 愿�由ъ옄�뿉寃� 臾몄쓽�빐二쇱꽭�슂.";
		}
		
		// �긽�꽭�솕硫� �씠�룞�떆 �븘�슂�븳 �뙆�씪硫뷀꽣瑜� �꽭�똿
		rttr.addAttribute("Nboard_no", vo.getNboard_no());
		rttr.addAttribute("pageNo",cri.getPageNo());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("resMsg",resMsg);
		return "redirect:/nboard/nboardGet";
	}//update
	
	@GetMapping("/nboard/update")
	public String edit(Criteria cri, NBoardVO vo,Model model) {
		System.out.println("============"+vo.getNboard_no());
		// �긽�꽭�젙蹂� 議고쉶
		vo = service.get(vo.getNboard_no());
		System.out.println("============"+vo.getNboard_no());
		//紐⑤뜽�뿉 �떞�븘�꽌 �솕硫댁뿉 �쟾�떖
		model.addAttribute("vo", vo);
		System.out.println("============"+vo);
		//由ы꽩�씠 �뾾�쑝誘�濡� /nboard/nboardGet(URL)濡� �럹�씠吏� �뿰寃�
		return "/nboard/nboardUpdate";
	}
		//1. �벑濡앺럹�씠吏�濡� �씠�룞
		@GetMapping("/nboard/nboardRegister")
		public String insert() {
			return "/nboard/nboardRegister";
		}
		
		@PostMapping("/nboard/nboardRegister")
		public String insertExe(NBoardVO vo, RedirectAttributes rttr) {
			System.out.println("===========vo : "+vo);
			int res = service.insertNboard(vo);
			System.out.println("===========vo : "+vo);
			
			rttr.addFlashAttribute("resMsg",vo.getNboard_no()+"踰� 寃뚯떆湲��씠 �옉�꽦 �릺�뿀�뒿�땲�떎.");
			
			return "redirect:/nboard/nboardList";
		}
	
}