package log.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Log;
import model.Shop;
import log.service.LogService;
import log.service.LogServiceImpl;

/**
 * Servlet implementation class AddLogController
 */
@WebServlet("/AddLogController")
public class AddLogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLogController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		/*판매자가 방문완료 처리했을 경우 */
		LogService logservice = new LogServiceImpl();
		HttpSession session = request.getSession();
		
		Shop s = (Shop) session.getAttribute("shop");	// 판매자의 이름
		
		/* 판매자로부터 (고객 이름, pnum)을 파라미터로 받아와야 함 */
		String g_name = request.getParameter("g_name");
		String s_name = s.getName();
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String r_date = request.getParameter("r_date");
		
		boolean flag_log = false;	// 대기열 추가 확인 변수(초기 false)
		
		Log q = new Log(0, s_name, g_name, pnum, r_date);
		
		int add_num = logservice.write(q);		// Log 테이블에 해당 대기열 추가 - 추가 개수로 받음
		
		if(add_num > 0) {		// 로그 추가 확인
			flag_log = true;	// 추가 완료 true로 표시
		}
		request.setAttribute("flag_log", flag_log);
		
		String path = "/web/log/logWrite.jsp";	// 로그 추가 확인 페이지
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
