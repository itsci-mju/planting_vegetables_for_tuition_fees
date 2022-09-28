package util;
import bean.*;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;



public class HibernateConnection {
	public static SessionFactory sessionFactory;

    public static SessionFactory doHibernateConnection() {
        Properties database = new Properties();
        database.setProperty("hibernate.hbm2ddl.auto", "create");
        database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
        database.setProperty("hibernate.connection.username", "root");
        database.setProperty("hibernate.connection.password", "1234");
        database.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/project_vegetable");
        database.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
        Configuration cfg = new Configuration().setProperties(database).addPackage("bean")
        		.addAnnotatedClass(member.class)
        		.addAnnotatedClass(logins.class)
        		.addAnnotatedClass(transaction.class)
        		.addAnnotatedClass(projects.class)
        		.addAnnotatedClass(register.class)
        		.addAnnotatedClass(member_shifts.class)
        		.addAnnotatedClass(assets.class)
        		.addAnnotatedClass(transaction_details.class);
        

        StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
        sessionFactory = cfg.buildSessionFactory(ssrb.build());
        return sessionFactory;
    }
}
