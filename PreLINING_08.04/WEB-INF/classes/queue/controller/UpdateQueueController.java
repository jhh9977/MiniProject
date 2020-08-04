package queue.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.Shop;
import queue.service.QueueService;
import queue.service.QueueServiceImpl;
import shop.service.ShopService;
import shop.service.ShopServiceImpl;

/**
 * Servlet implementation class updateQueueController
 */
@WebServlet("/UpdateQueueController")
public class UpdateQueueController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQueueController() {
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
		
		QueueService service = new QueueServiceImpl();
		ShopService shopservice = new ShopServiceImpl();		
		HttpSession session = request.getSession(false);
		
		Shop s = (Shop)  session.getAttribute("shop");
		String s_name = s.getName();
		int queue_num = service.totalQueueByS_Name(s_name);
		shopservice.editQnum(queue_num, s_name);
		s = shopservice.getShopByName(s_name);
		String menu = s.getMenu();
		String menulist[] = menu.split(",");
		session.setAttribute("menulist", menulist);
		session.setAttribute("shop", s);		
			
		String path = "/web/shop/shopDetail.jsp?num="+s.getNum();	// 
		
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
