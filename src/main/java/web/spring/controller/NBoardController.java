package web.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.NBoardService;
import web.spring.service.UserService;
import web.spring.vo.Criteria;
import web.spring.vo.FileVO;
import web.spring.vo.NBoardVO;
import web.spring.vo.PageNavi;
import web.spring.vo.UserVO;

@Log4j
@Controller
public class NBoardController {

	@Autowired
	public NBoardService service;
	@Autowired
	public FileService fileService;
	@Autowired
	public UserService userService;
	
	@GetMapping("/nboard/nboardGet")
	public String get(Criteria cri, NBoardVO vo, Model model) {
		vo=service.get(vo.getNboard_no());
		model.addAttribute("vo",vo);
		return "nboard/nboardGet";
	}//get
	
	@GetMapping("/nboard/nboardList")
	public String getList(Criteria cri,Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		if(user==null) {
			return "/member/login";
		}
		//유저가 어드민이 아닐경우 공개된 nboard만 보여주도록 하는 조건문
		if (user.getUser_type().equals("0")){
			model.addAttribute("list",service.getList(cri));
			model.addAttribute("pageNavi",new PageNavi(cri,service.getTotal(cri)));
		}else{
			model.addAttribute("list",service.getOpendList(cri));
			model.addAttribute("pageNavi",new PageNavi(cri,service.getOpendTotal(cri)));
		}
		model.addAttribute("user", user);
		return "/nboard/nboardList";
	}//nboardList
	
	@GetMapping("/nboard/delete")
	public String delete(Criteria cri, NBoardVO vo, UserVO user,RedirectAttributes rttr) {
		String resMsg = "";
		if(user.getUser_type()=="0" || user.getUser_id()==vo.getUser_id()) {
			int res = service.delete(vo.getNboard_no());
		// 삭제 성공 -> 리스트
			if(res>0) {
				resMsg = vo.getNboard_no()+"번 게시글이 삭제 되었습니다.";
				rttr.addFlashAttribute("resMsg", resMsg);
				rttr.addAttribute("pageNo",cri.getPageNo());
				rttr.addAttribute("type",cri.getType());
				rttr.addAttribute("keyword",cri.getKeyword());
				
				return "redirect:/nboard/nboardList";
			
			} else {
		// 삭제 실패 -> 상세화면
			resMsg = "게시글 삭제 처리에 실패 했습니다.";
			rttr.addFlashAttribute("resMsg", resMsg);
			rttr.addAttribute("Nboard_no", vo.getNboard_no());
			rttr.addAttribute("pageNo",cri.getPageNo());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/nboard/nboardGet";
			}
		}else {
			resMsg="삭제에 실패하였습니다. id/pw를 확인해주세요.";
			return "redirect:/member/login";
		}
	}//delete
	
	@PostMapping("/nboard/nboardUpdate")
	public String editExe(Criteria cri, NBoardVO vo, RedirectAttributes rttr) {
		int res = service.update(vo);
		service.nboardLock(vo);
		String resMsg = "";
		if(res>0) {
			resMsg = "수정 되었습니다.";
		}
		else {
			resMsg = "수정 작업 실패 했습니다. 관리자에게 문의해주세요.";
		}
		
		// 상세화면 이동시 필요한 파라메터를 세팅
		rttr.addAttribute("Nboard_no", vo.getNboard_no());
		rttr.addAttribute("pageNo",cri.getPageNo());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("resMsg",resMsg);
		return "redirect:/nboard/nboardList";
	}//update
	
	@GetMapping("/nboard/nboardUpdate")
	public String edit(Criteria cri, NBoardVO vo,Model model) {
		log.info("============"+vo.getNboard_no());
		// 상세정보 조회
		vo = service.get(vo.getNboard_no());
		log.info("============"+vo.getNboard_no());
		//모델에 담아서 화면에 전달
		model.addAttribute("vo", vo);
		log.info("============"+vo);
		//리턴이 없으므로 /nboard/nboardGet(URL)로 페이지 연결
		return "/nboard/nboardUpdate";
	}
		//1. 등록페이지로 이동
		@GetMapping("/nboard/nboardRegister")
		public String insert() {
			return "/nboard/nboardRegister";
		}
		
		@PostMapping("/nboard/nboardRegister")
		public String insertExe(NBoardVO vo, RedirectAttributes rttr) {
			System.out.println("===========vo : "+vo);
			int res = service.insertNboard(vo);
			System.out.println("===========vo : "+vo);
			
			rttr.addFlashAttribute("resMsg",vo.getNboard_no()+"번 게시글이 작성 되었습니다.");
			
			return "redirect:/nboard/nboardList";
		}
	
}