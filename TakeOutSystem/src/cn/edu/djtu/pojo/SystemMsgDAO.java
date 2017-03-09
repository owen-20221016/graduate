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
 * SystemMsg entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see cn.edu.djtu.pojo.SystemMsg
 * @author MyEclipse Persistence Tools
 */
public class SystemMsgDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(SystemMsgDAO.class);
	// property constants
	public static final String MESSAGE = "message";

	public void save(SystemMsg transientInstance) {
		log.debug("saving SystemMsg instance");
		try {
			Session sess = getSession();
			Transaction teTransaction = sess.beginTransaction();
			sess.save(transientInstance);
			teTransaction.commit();
			sess.close();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SystemMsg persistentInstance) {
		log.debug("deleting SystemMsg instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SystemMsg findById(java.lang.Integer id) {
		log.debug("getting SystemMsg instance with id: " + id);
		try {
			SystemMsg instance = (SystemMsg) getSession().get("cn.edu.djtu.pojo.SystemMsg", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SystemMsg instance) {
		log.debug("finding SystemMsg instance by example");
		try {
			List results = getSession().createCriteria("cn.edu.djtu.pojo.SystemMsg").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding SystemMsg instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from SystemMsg as model where model." + propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMessage(Object message) {
		return findByProperty(MESSAGE, message);
	}

	public List findAll() {
		log.debug("finding all SystemMsg instances");
		try {
			String queryString = "from SystemMsg";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SystemMsg merge(SystemMsg detachedInstance) {
		log.debug("merging SystemMsg instance");
		try {
			SystemMsg result = (SystemMsg) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SystemMsg instance) {
		log.debug("attaching dirty SystemMsg instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SystemMsg instance) {
		log.debug("attaching clean SystemMsg instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}