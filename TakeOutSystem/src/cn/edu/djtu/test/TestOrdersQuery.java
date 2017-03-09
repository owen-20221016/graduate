package cn.edu.djtu.test;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import cn.edu.djtu.pojo.BaseHibernateDAO;
import cn.edu.djtu.pojo.Orders;

public class TestOrdersQuery {
	@Test
	public void testOdersQuery() {
	/*	BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Query query = session.createSQLQuery("select * from public.orders where ordernumber='" + "161124093018"
				+ "' and user_id=" + "1" + ";").addEntity(Orders.class);
		List<Orders> orders = query.list();
		for (Orders orders2 : orders) {
			System.out.println(orders2.getOrdernumber());
		}
		*/
		
		BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Transaction transaction = session.beginTransaction();
		Query query = session.createSQLQuery("delete from public.orders where ordernumber='"+ "161124093018" +"' and user_id="+ "1"+";");
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
}
