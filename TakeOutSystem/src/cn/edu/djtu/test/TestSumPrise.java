package cn.edu.djtu.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import cn.edu.djtu.bean.OrderBean;

public class TestSumPrise {
	List<OrderBean> orderBeans = new ArrayList();
	@Test
	public void sumPrise() {
		List<OrderBean> orderBeans = new ArrayList();
		orderBeans.set(0, this.orderBeans.get(0));
		int b = 0;
		for (int a = 1; a < this.orderBeans.size(); a++) {
			if (orderBeans.get(b).getOrderNumber().equals(this.orderBeans.get(a).getOrderNumber())) {
				orderBeans.get(b).setSumPrise(this.orderBeans.get(a).getSumPrise());
			} else {
				orderBeans.set(++b, this.orderBeans.get(a));
			}
		}
	}
}
