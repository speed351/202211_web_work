package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼 전송되는 닉네임 읽어오기
		req.setCharacterEncoding("utf-8");
		String nick = req.getParameter("nick");
		//session에 "nick"이라는 키값으로 저장하기
		HttpSession session = req.getSession();
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		
		
		//응답
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/test/save.jsp");
		rd.forward(req, resp);
		
		
	}
}
