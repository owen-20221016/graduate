package cn.edu.djtu.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;

import cn.edu.djtu.pojo.BaseHibernateDAO;
import cn.edu.djtu.pojo.Orders;
import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.User;

public class TestUseSQL {
	@Test
	public void testUseSQL() {
		/*
		 * BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO(); Session
		 * session = baseHibernateDAO.getSession(); Query query =
		 * session.createSQLQuery("select * from user_").addEntity(User.class);
		 * List<User> list = query.list(); for (User user : list) {
		 * System.out.println(user.getUsername()); }
		 */

		/*BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Query query = session.createSQLQuery("select * from public.takeout order by sellnum desc limit 3").addEntity(Takeout.class);
		List<Takeout> list = query.list();
		for (Takeout takeout : list) {
			System.out.println(takeout.getName());
		}*/
		
		String sql = "select avg(user_id) as user_id, sum(sum_prise) as sum_prise ,max(number)as number,max(takeout_id) as takeout_id,ordernumber from public.orders group by ordernumber";
		BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Query query = session.createSQLQuery(sql).addEntity(Orders.class);
		List<Orders> orders = query.list();
	}

}
