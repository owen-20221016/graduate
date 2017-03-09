package cn.edu.djtu.test;

import java.util.UUID;

import org.junit.Test;

public class TestUUID {
	@Test
	public void testUUID () {
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
	}
}
