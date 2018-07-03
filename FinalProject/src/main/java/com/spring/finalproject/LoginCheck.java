package com.spring.finalproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.spring.finalproject.common.MyUtil;


/* === �־���(<��:�۾���, �ۼ���, ��۾��� ���>�� �����ϱ� �ռ� 
             �̷��� �־������� ���� �α����� �ؾ߸� ��밡���� �۾��̹Ƿ�  
             �־����� ���� �������� ��ü�� �α��� ���θ� üũ�ϴ� ���� Ŭ����(��ü)�� �����Ͽ� 
             ����Ʈ�ư� ���Ҿ� �����̽��� �����Ͽ� �����ϵ��� ����ڴ�.       
 */

// ===== #52. ������ɻ� Ŭ����(Aspect Ŭ����)�����ϱ� =====
@Aspect
/* ������ɻ� Ŭ���� ��ü�� ����Ѵ�.
  - ������ XML <aop:aspect> ������ �Ѵ�. */
@Component
/* XML���� ���� ����� ��ſ� Ŭ������ �տ� @Component ������̼��� �����ָ� �ش� Ŭ������ bean���� �ڵ� ��ϵȴ�. 
     �׸��� bean�� �̸�(ù���ڴ� �ҹ���)�� �ش� Ŭ�������� �ȴ�. */
public class LoginCheck {

		    // Pointcut�� �����Ѵ�.
			// - �Ʒ��� �޼ҵ尡 ������ XML <aop:pointcut> ������ �Ѵ�.
			// - void + ���ڰ� �������� �����Ѵ�. 
			// - �����ص� ������ ������̼��� AspectJ ǥ������ �켱�̱� ������ �޼ҵ� ��ü�� ������ �ǹ̰� ����.
			// - ���� �����ε� �ǹ̾���.
			// - ��� �޼ҵ� �̸��� ���߿� ������ Advice���� �ĺ��ڷ� ����
	@Pointcut("execution(public * com.spring.*.*Controller.requireLogin_*(..))")
	public void requireLogin() {}
		
		
			// ����(�����̽�)���� �߰�
			// -- �޸� �ۼ��ϱ� �� ���� �ð��� �α׿� ����� �������� 
			
			// Adivce ���� ����� ���ÿ� �������� ����
			// - �Ʒ��� ������̼��� ������ XML <aop:before> ������ �Ѵ�.
			// - Pointcut�� ��ܿ� �̹� ����Ǿ� �ֱ� ������ ���� �����ϴ� Before Advice�� ���Ḹ �����ش�.
			// �̹� �����Ǿ� �ִ� requireLogin() �޼ҵ������ Pointcut("execution()")�� �ֱ� ������
			// @Before ������̼��� ���� Advice �� �߰����ִ� �͸����� ������ ������. 
	@Before("requireLogin()")
	public void before(JoinPoint joinPoint) {
		
		// �α��� ������ Ȯ���ϱ� ���ؼ� request �� ���� session �� ���´�.
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		HttpSession session = request.getSession();
		
		HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];
		
		// �������� ����
		// - �ش� ��û�ڰ� �������� ���� ���¶�� ȸ�� ���� �������� ������ �� ���⿡ �ٸ�������(/WEB-INF/viewsnotiles/msg.jsp)�� ���� �̵���Ų��. 
		if( session.getAttribute("loginuser") == null ) {
			try {
				String msg = "���� �α��� �ϼ���.";
				String loc = "/finalproject/login.action";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				// >>>> �α��� ���� �� �α��� �ϱ��� �������� ���ư��� �۾��ϱ� <<<<
				// ===> ���� �������� �ּ�(URL) �˾Ƴ��� <====
				String url = MyUtil.getCurrentURL(request);
				
				// System.out.println(">>>> Ȯ�ο� ���� ������ URL : " + url);
				
				session.setAttribute("gobackURL", url); // ���ǿ� url ������ ������ѵд�.
								
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp"); 
				dispatcher.forward(request, response);
			
				// response.sendRedirect("/finalproject/index.action");
				
			} catch(ServletException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
			
		} // end of if---------------------
	
	}// end of before(JoinPoint joinPoint)-------------------
	
	
	
}
