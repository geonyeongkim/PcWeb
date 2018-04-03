package kr.ac.skuniver.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.skuniver.member.MemberDAO;
import kr.ac.skuniver.member.MemberVO;

@Controller
public class PcController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/loginForm.sku")
	public String loginForm(){
		return "loginForm";
	}
	@RequestMapping("/login.sku")
	public String login(HttpServletRequest request, HttpServletResponse response){
		MemberVO vo=dao.getMember(request.getParameter("id"));
		if(request.getParameter("id").equals("admin")&&request.getParameter("password").equals("admin")){
			return "redirect:/seat.sku";
		}else{
			request.setAttribute("vo",vo);
			return "login";
		}
	}
	@RequestMapping("/seat.sku")
	public String seat(HttpServletRequest request, HttpServletResponse response){
		int seatnumber[][]={{1,2,3,4,5},
		        {6,7,8,9,10},
		        {11,12,13,14,15},
		        {16,17,18,19,20},
		        {21,22,23,24,25}}; 
			List numberList=new ArrayList();
			List idList=new ArrayList();
			List timeList=new ArrayList();
			List ageList=new ArrayList();
			List ageList2=new ArrayList();
			List<MemberVO> memberList=dao.getMemberList();
			
			for(MemberVO vo:memberList){
				if(!(vo.getSeatnumber().equals("50")))
				{
					numberList.add(vo.getSeatnumber());
					idList.add(vo.getId());
					timeList.add(vo.getTime());
					ageList.add(vo.getBirth());
					if(((Integer.parseInt(vo.getBirth()))/10000)>=1999){
						ageList2.add(vo.getSeatnumber());
					}
				}
			}
			request.setAttribute("seatnumber",seatnumber);
			request.setAttribute("numberList",numberList);
			request.setAttribute("idList",idList);
			request.setAttribute("timeList",timeList);
			request.setAttribute("ageList",ageList);
			request.setAttribute("ageList2",ageList2);
			return "seat";
	}
	@RequestMapping("/seatmap.sku")
	public String seatmap(HttpServletRequest request, HttpServletResponse response){
		int seatnumber[][]={{1,2,3,4,5},
		        {6,7,8,9,10},
		        {11,12,13,14,15},
		        {16,17,18,19,20},
		        {21,22,23,24,25}}; 
			List numberList=new ArrayList();
			List idList=new ArrayList();
			List timeList=new ArrayList();
			List<MemberVO> memberList=dao.getMemberList();
			
			for(MemberVO vo:memberList){
				if(!(vo.getSeatnumber().equals("50")))
				{
					numberList.add(vo.getSeatnumber());
					idList.add(vo.getId());
					timeList.add(vo.getTime());
				}
			}
			request.setAttribute("seatnumber",seatnumber);
			request.setAttribute("numberList",numberList);
			request.setAttribute("idList",idList);
			request.setAttribute("timeList",timeList);
			return "seatmap";
	}
	@RequestMapping("/memberJoin.sku")
	public String memberJoin(){
		return "memberJoin";
	}
	@RequestMapping("/addMember.sku")
	public String addMember(HttpServletRequest request, HttpServletResponse response){
		
		List<MemberVO> memberList=dao.getMemberList();
		MemberVO vo=new MemberVO();
		
		request.setAttribute("memberList",memberList);
		request.setAttribute("dao",dao);
		request.setAttribute("vo",vo);
		return "addMember";
	}
	@RequestMapping("/addtime.sku")
	public String addtime(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		 MemberVO vo1=dao.getMember((String)session.getAttribute("id"));
		 int time=Integer.parseInt(request.getParameter("time"));
		 vo1.setTime(Integer.toString(time));
		 dao.updateTime(vo1);
		 
		 return "redirect:/screen.sku";
	}
	@RequestMapping("/screen.sku")
	public String screen(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		MemberVO vo=dao.getMember((String)session.getAttribute("id"));
		int time=Integer.parseInt(vo.getTime());
		request.setAttribute("time", time);
		return "screen";
	}
	@RequestMapping("/logout.sku")
	public String logout(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		MemberVO vo=dao.getMember((String)session.getAttribute("id"));
		vo.setTime(request.getParameter("updatetime"));
		vo.setSeatnumber("50");
		dao.updateSeatNumber(vo);
		dao.updateTime(vo);
		dao.updateMember(vo);
		session.removeAttribute("id");
		session.removeAttribute("number");
		return "redirect:/loginForm.sku"; 
	}
	@RequestMapping("/adminlogout.sku")
	public String adminlogout(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		MemberVO vo=dao.getMembernumber(request.getParameter("number"));
		vo.setSeatnumber("50");
		dao.updateSeatNumber(vo);
		dao.updateMember(vo);
		session.removeAttribute("id");
		session.removeAttribute("number");
		return "redirect:/seat.sku";
	}
	@RequestMapping("/memberList.sku")
	public String memberList(HttpServletRequest request, HttpServletResponse response){
		List<MemberVO> memberList=dao.getMemberList();
		String msg=(String)request.getAttribute("msg");
		request.setAttribute("msg",msg);
		request.setAttribute("memberList",memberList);
		return "memberList";
	}
	@RequestMapping("/update.sku")
	public String update(HttpServletRequest request, HttpServletResponse response){
		MemberVO vo=dao.getMember(request.getParameter("id"));
		request.setAttribute("vo",vo);
		return "update";
	}
	@RequestMapping("/delete.sku")
	public String delete(HttpServletRequest request, HttpServletResponse response){
		MemberVO vo= dao.getMember(request.getParameter("id"));
		dao.deleteMember(vo);
		return "redirect:/memberList.sku";
	}
	@RequestMapping("/update2.sku")
	public String update2(HttpServletRequest request, HttpServletResponse response,MemberVO vo){
		dao.updateMember(vo);
		return "redirect:/memberList.sku";
	}
	@RequestMapping("/searchIdForm.sku")
	public String searchIdForm(){
		return "searchIdForm";
	}
	@RequestMapping("/searchPassForm.sku")
	public String searchPassForm(){
		return "searchPassForm";
	}
	@RequestMapping("/fee.sku")
	public String fee(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		 MemberVO vo=dao.getMember((String)session.getAttribute("id"));
		session.setAttribute("number",request.getParameter("number"));
		vo.setSeatnumber((String)session.getAttribute("number"));
		dao.updateSeatNumber(vo);
		dao.updateMember(vo);
		request.setAttribute("vo",vo);
		return "fee";
	}
	
	@RequestMapping(value="/Screen.sku", method=RequestMethod.POST)
	public @ResponseBody void Screen(HttpSession session){
		MemberVO vo=dao.getMember((String)session.getAttribute("id"));
		int time= Integer.parseInt(vo.getTime())-1;
		vo.setTime(Integer.toString(time));
		dao.updateTime(vo);
	}
	@RequestMapping("/SearchId.sku")
	public String SearchId(HttpServletRequest request, HttpServletResponse response){
		String name=request.getParameter("name");
		String birth=request.getParameter("birth");
		MemberVO vo=dao.getMember(name,birth);
		if(vo!=null){
			if(name.equals(vo.getName())&&birth.equals(vo.getBirth())){
				request.setAttribute("id",vo.getId());
				return "loginForm";
			}else{
				return "loginForm";
			}
		}else{
			String msg="해당하는 Id의 회원이 없습니다.";
			request.setAttribute("msg",msg);
			return "memberJoin";
		}
	}
	@RequestMapping("/SearchMember.sku")
	public String SearchMember(HttpServletRequest request, HttpServletResponse response){
		String id=request.getParameter("memberid");
		MemberVO vo=dao.getMember(id);
		if(vo!=null){
			request.setAttribute("getmemberList", vo);
			return "memberList";
		}else{
			String msg="아이디가 존재하지 않습니다.";
			request.setAttribute("msg",msg);
			return "memberList";
		}
	}
	@RequestMapping("/SearchPass.sku")
	public String SearchPass(HttpServletRequest request, HttpServletResponse response){
		MemberVO vo=dao.getMember(request.getParameter("id"));
		if(vo!=null)
		{
			String passmsg="찾는 비밀번호는 "+vo.getPassword()+"입니다.";
			request.setAttribute("passmsg",passmsg);
			return "loginForm";		
		}else{
			String noid="존재하는 아이디를 입력해주세요.";
			request.setAttribute("noid",noid);
			return "searchPassForm";
		}
	}

}
