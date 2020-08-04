package log.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Log;
import log.service.LogService;
import log.service.LogServiceImpl;

/**
 * Servlet implementation class SearchLogController
 */
@WebServlet("/SearchLogController")
public class SearchLogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchLogController() {
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
		
		/*구매자,판매자의 예약 조회*/
		
		LogService service = new LogServiceImpl();
		
		HttpSession session = request.getSession();
		int type = (int)session.getAttribute("memberType");	// 1 : 구매자, 2 : 판매자
		
		/*구매자가 본인의 최근 방문 가게 리스트 가져옴*/
		if(type == 1){	
			  String g_id = (String) session.getAttribute("id");
			  ArrayList<Log> vlist = service.getByG_Name(g_id);
			  request.setAttribute("vlist", vlist);
		}
		
		String path = "/web/log/logList.jsp";
		
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
