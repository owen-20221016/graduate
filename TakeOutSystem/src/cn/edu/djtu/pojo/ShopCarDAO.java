package cn.edu.djtu.pojo;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * ShopCar entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see cn.edu.djtu.pojo.ShopCar
 * @author MyEclipse Persistence Tools
 */
public class ShopCarDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(ShopCarDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String TAKEOUT_ID = "takeoutId";
	public static final String NUM = "num";
	Session session = null;
	public void save(ShopCar transientInstance) {
		log.debug("saving ShopCar instance");
		try {
				session = getSession();
				Transaction transaction = session.beginTransaction();
				session.save(transientInstance);
				transaction.commit();
				session.close();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ShopCar persistentInstance) {
		log.debug("deleting ShopCar instance");
		try {
			Session session = getSession();
			Transaction transaction = session.beginTransaction();
			session.delete(persistentInstance);
			transaction.commit();
			session.close();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ShopCar findById(java.lang.Integer id) {
		log.debug("getting ShopCar instance with id: " + id);
		try {
			ShopCar instance = (ShopCar) getSession().get(
					"cn.edu.djtu.pojo.ShopCar", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ShopCar instance) {
		log.debug("finding ShopCar instance by example");
		try {
			List results = getSession()
					.createCriteria("cn.edu.djtu.pojo.ShopCar")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding ShopCar instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ShopCar as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByTakeoutId(Object takeoutId) {
		return findByProperty(TAKEOUT_ID, takeoutId);
	}

	public List findByNum(Object num) {
		return findByProperty(NUM, num);
	}

	public List findAll() {
		log.debug("finding all ShopCar instances");
		try {
			String queryString = "from ShopCar";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ShopCar merge(ShopCar detachedInstance) {
		log.debug("merging ShopCar instance");
		try {
			ShopCar result = (ShopCar) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void updateIntity(ShopCar instance) {
		log.debug("update ShopCar instance");
		try {
			session = getSession();
			Transaction transaction = session.beginTransaction();
			session.update(instance);
			transaction.commit();
			session.close();
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	
	public void attachDirty(ShopCar instance) {
		log.debug("attaching dirty ShopCar instance");
		try {
			Session session = getSession();
			Transaction transaction = session.beginTransaction();
			session.saveOrUpdate(instance);
			transaction.commit();
			session.close();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ShopCar instance) {
		log.debug("attaching clean ShopCar instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}