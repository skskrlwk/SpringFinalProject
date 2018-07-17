package com.spring.finalproject.common;

import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	// *** ���ư� URL �������� ���� �˱� ���ؼ� ���� ���� URL �ּҸ� ������ �޼ҵ� *** //
	public static String getCurrentURL(HttpServletRequest request) {
	
	   String currentURL = request.getRequestURL().toString();                 
	   // http://localhost:9090/MyWeb/member/memberList.jsp
		   
	   String queryString = request.getQueryString();
	   // currentShowPageNo=9&sizePerPage=10
			   
	   currentURL += "?" + queryString;
	   // http://localhost:9090/MyWeb/member/memberList.jsp?currentShowPageNo=9&sizePerPage=10 
	   
	   String ctxName = request.getContextPath(); 
	   //   /MyWeb 
	   
	   int index = currentURL.indexOf(ctxName); 
	   //   21 
	   
	   int beginIndex = index + ctxName.length(); 
	   //  21 + 6 ==> 27 
	   
	   currentURL = currentURL.substring(beginIndex+1);		   
	  // member/memberList.jsp?currentShowPageNo=9&sizePerPage=10	
		
	   return currentURL;
	}// end of String getCurrentURL()---------------
	
	
	// ===== *** �������� ����� *** ======= //
	public static String getPageBar(String url
			                      , int currentShowPageNo
			                      , int sizePerPage
			                      , int totalPage
			                      , int blockSize) {
		
		String pageBar = "";
	    
		int pageNo = 1;
		int loop = 1;
		
		pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// ������.
		
		//     currentShowPageNo      pageNo
		//    -------------------------------
		//           1                  1
		//           2                  1
		//          ..                 ..
		//          10                  1
		//          
		//          11                 11
		//          12                 11
		//          ..                 ..
		//          20                 11
		//          
		//          21                 21                 
		//          22                 21 
		//          ..                 ..
		//          30                 21 
		
		if(pageNo == 1) {
			pageBar += "";
		}
		else {
			pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"\">[����]</a>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "&nbsp;<span style=\"color: red; font-size: 13pt; font-weight: bold; text-decoration: underline;\">"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"\">"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++;
			loop++;
		}// end of while-------------------------
		
		if(pageNo > totalPage) {
			pageBar += "";
		}
		else {
			pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"\">[����]</a>";
		}

		return pageBar;
		
	}// end of getPageBar(String url, int currentShowPageNo, int sizePerPage, int totalPage, int blockSize)-------------------	
	
	
	
	// ===== *** �˻�� ���Ե� �������� ����� *** ======= //
	public static String getSearchPageBar(String url
			                            , int currentShowPageNo
			                            , int sizePerPage
			                            , int totalPage
			                            , int blockSize
			                            , String colname, String search, String period) {
		
		String pageBar = "";
	    
		int pageNo = 1;
		int loop = 1;
		
		pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// ������.
		
		//     currentShowPageNo      pageNo
		//    -------------------------------
		//           1                  1
		//           2                  1
		//          ..                 ..
		//          10                  1
		//          
		//          11                 11
		//          12                 11
		//          ..                 ..
		//          20                 11
		//          
		//          21                 21                 
		//          22                 21 
		//          ..                 ..
		//          30                 21 
		
		if(pageNo == 1) {
			pageBar += "";
		}
		else {
			pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"&period="+period+"\">[����]</a>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "&nbsp;<span style=\"color: red; font-size: 13pt; font-weight: bold; text-decoration: underline;\">"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"&period="+period+"\">"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++;
			loop++;
		}// end of while-------------------------
		
		if(pageNo > totalPage) {
			pageBar += "";
		}
		else {
			pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"&period="+period+"\">[����]</a>";
		}

		return pageBar;
		
	}// end of getPageBar(String url, int currentShowPageNo, int sizePerPage, int totalPage, int blockSize)-------------------	
	
	
	// *** ���ڸ� �Է¹޾Ƽ� ���ڸ� ���� �޸�(,)�� �� ���Ͻ����ִ� �޼ҵ� *** // 
	public static String getMoney(long number) {
		
		DecimalFormat df = new DecimalFormat("#,###");
		// ���ڷ� �Ǿ��� �����͸� ���ڸ� ���� �޸�(,)�� ����ִ� ��ü ������.
		
		String result = df.format(number);
		
		return result;
	}// end of getMoney(long number)---------------
	
	
	// ****  ����ð��� ��Ÿ����  **** //
	public static String getNowTime() {
		Date now = new Date();
		String today = String.format("%tF %tT", now, now);
        return today;
	}
	
	// ===== *** 페이지바 만들기 *** ======= 검색이없는 페이지바 //
		public static String getPageBar1(String url
				                      , int currentShowPageNo
				                      , int sizePerPage
				                      , int totalPage
				                      , int blockSize) {
			
			String pageBar = "";
		    
			int pageNo = 1;
			int loop = 1;
			
			pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
			// 공식임.
			
			//     currentShowPageNo      pageNo
			//    -------------------------------
			//           1                  1
			//           2                  1
			//          ..                 ..
			//          10                  1
			//          
			//          11                 11
			//          12                 11
			//          ..                 ..
			//          20                 11
			//          
			//          21                 21                 
			//          22                 21 
			//          ..                 ..
			//          30                 21 
			
			if(pageNo == 1) {
				pageBar += "";
			}
			else {
				pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"\">[이전]</a>";
					
			}
			
			while( !(loop > blockSize || pageNo > totalPage) ) {
				
				if(pageNo == currentShowPageNo) {
					pageBar += "&nbsp;<span style=\"color: purple; font-size: 20pt; font-weight: bold; text-decoration: underline;  border: 2px solid purple;\">"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"\">"+pageNo+"</a>&nbsp;";
				}
				
				pageNo++;
				loop++;
			}// end of while-------------------------
			
			if(pageNo > totalPage) {
				pageBar += "";
			}
			else {
				pageBar += "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"\">[다음]</a>";
			}

			return pageBar;
			
		}// end of getPageBar(String url, int currentShowPageNo, int sizePerPage, int totalPage, int blockSize)-------------------	
		
	
	
}
