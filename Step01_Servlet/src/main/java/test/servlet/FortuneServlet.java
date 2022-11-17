package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//3. 어떤 경로로 들어온 요청을 처리할 것인지 설정
@WebServlet("/fortune")
//1. HttpServlet 클래스를 상속받고
public class FortuneServlet extends HttpServlet{
	//2. service method를 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//요청을 한 클라이언트에게 문자열을 출력할 수 있는 객체의 참조값 얻어낸다
		
		//응답 인코딩 설정
	    resp.setCharacterEncoding("utf-8");
	    //응답 컨텐트 설정
	    resp.setContentType("text/html; charset=utf-8");
	    //클라이언트의 웹브라우저에 문자열을 출력할수 있는 객체의 참조값 얻어내기
	    
	    PrintWriter pw = resp.getWriter();
	    
		Random ran = new Random();
		int num = ran.nextInt(1, 100);
		int rnum = ran.nextInt(0, 5);
		String[] todayFortune = {"몸조심", "좋은날", "로또 사라", "연금복권 사라","뭐 하려고 하지마"};
		
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<title>운세</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("<h1>lucky! 오늘의 행운 번호 : "+num+"</h1>");
		
		pw.println("<h1>lucky! 오늘의 운세 : "+todayFortune[rnum].toString()+"</h1>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
