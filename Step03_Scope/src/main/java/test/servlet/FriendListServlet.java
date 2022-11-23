package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//친구 목록을 얻어오는 비즈니스 로직 수행
		List<String> list = new ArrayList<>();
		list.add("kim");
		list.add("lee");
		list.add("choi");
		
		//로직 수행 결과로 얻어넨 데이터(모델)
		req.setAttribute("list", list);
		
		//jsp페이지로 (view page) forward 이동해서 응답하기(forward 이동은 WEB-INF 폴더 안쪽도 가능)
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/friend/list.jsp");
		rd.forward(req, resp);
		
		
		
	}
}
