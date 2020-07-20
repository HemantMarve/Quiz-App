package com.marve;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marve.dao.CandidateDao;
import com.marve.dao.CreateConnection;
import com.marve.dao.FeedabackDao;
import com.marve.dao.TestDao;
import com.marve.entity.Candidate;
import com.marve.entity.Feedback;
import com.marve.entity.Question;
@Controller
public class IndexController {
	@Autowired
	TestDao td;
	@Autowired
	FeedabackDao fd;
	@Autowired
	CandidateDao cd;
	
	@RequestMapping("/")
	String home()
	{
	return "home";	
	}
	
	@RequestMapping("/tester.htm")
	String starttest()
	{
	return "starttest";	
	
	}
	
	@RequestMapping("/letstart.htm")
	String letstart(HttpServletRequest request,@ModelAttribute Candidate c) throws SQLException
	{
	
		if(cd.isValidate(c))
		{
			request.setAttribute("error","Wrong TestID");
			List<Question> l=td.getTest(c.getTestid());
			if(l.size()==0)
			{
			
				request.setAttribute("error","Wrong TestID");
				return "starttest";
			}
			
		request.getSession().setAttribute("candidate",c);
		request.getSession().setAttribute("test",l);
		}
		else
		{
		request.setAttribute("error","user with this roll already given this test or contact 7508540989 if not");
		return "starttest";
		}
		return "focus";
	}
	
	
	
	@RequestMapping("/test.htm")
	String test()
	{
	return "test";	
	}
	@RequestMapping("/feedback.htm")
	String feedback()
	{
	return "feedback";	
	}
	
	@RequestMapping("/addfeedback")
	String addfeedback(@ModelAttribute Feedback feedback) throws SQLException
	{
		fd.addFeedback(feedback);
	
	return "thanks";	
	}
	@RequestMapping(value="/submittest.htm",method = RequestMethod.POST)
	String submitTest(HttpServletRequest request,@RequestParam("size") int size) throws SQLException
	{
		int marks=0;
		ArrayList<String> a=new ArrayList<String>();
		for(int i=1;i<size;i++)
		{
			String ans=request.getParameter(""+i);
			String correctans=request.getParameter("ans"+i);
			if(ans.equals(correctans))
			{
				marks++;
			}
			a.add(ans);
		}
		request.setAttribute("answers", a);
		Candidate c=(Candidate)request.getSession().getAttribute("candidate");
		c.setMarks(marks);
		cd.addResult(c);
		request.setAttribute("marks",marks);
		request.setAttribute("size",size-1);
		return "result";
		
	}
	
	@RequestMapping("/starttest.htm")
	String startTest(HttpServletRequest request,@RequestParam("testname") String testname) throws SQLException
	{
		
		/*boolean status=false;
		status=td.validate(testid,testname);
			if(status)
			{
			request.getSession().setAttribute("testid",testid);
			request.getSession().setAttribute("qnumber", 1);
			request.getSession().setAttribute("qmax", qmax);
		return "question";
			}
			else */
		System.out.println("HEllo");
		String user=(String) request.getSession().getAttribute("user");
		Boolean creator=true;
		if(user==null||!creator)
		{
			request.setAttribute("errormessage","First Login");
			return "login";
		}
		else if(!creator)
		{
			request.setAttribute("errormessage","You must Login as creator");
			return "login";
		}
		Integer testid=td.generateTestid(testname,user);
		if(testid!=0)
		{
			request.getSession().setAttribute("testid",testid.toString());
			request.getSession().setAttribute("qnumber", 1);
			
		}
		return "question";
	}
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String loginValidate(HttpServletRequest request,@RequestParam("uname") String uname,@RequestParam("psw") String psw) throws SQLException
	{
		System.out.println(uname+" "+psw);
		boolean status=td.validateUser(uname,psw);
		System.out.println(status);
		if(status)
		{
			request.getSession().setAttribute("user",uname);
			return "home";
		}
		else
		{
			request.setAttribute("loginerror","Incorrect Credentials");
		}
		return "login";
	}
	@RequestMapping("/feedbacks.htm")
	public ModelAndView getFeedbacks() throws SQLException
	{
		ModelAndView mv=new ModelAndView("showfeedbacks");
		mv.addObject("feedbacks",fd.getFeedbacks());
		return mv;
		
		}
	@RequestMapping(value="/addquestion",method = RequestMethod.POST)
	String addQuestion(HttpServletRequest request,@ModelAttribute Question tq) throws SQLException
	{
		HttpSession h=request.getSession();
		Integer qnumber=(Integer)h.getAttribute("qnumber");
		td.addQuestion((String) h.getAttribute("testid"),tq,h.getAttribute("qnumber").toString());
		qnumber++;
		String sc=request.getParameter("submitormore");
		if(sc.equals("submittest"))
		{
			try 
			{
			CreateConnection.getConnection().close();
			}
			catch(Exception e)
			{}
			request.setAttribute("testid",h.getAttribute("testid"));
			return "home";
		}
		h.setAttribute("qnumber",qnumber);
		return "question";
		}
}
