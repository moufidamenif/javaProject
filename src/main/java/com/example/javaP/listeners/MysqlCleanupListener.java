package com.example.javaP.listeners;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener
public class MysqlCleanupListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Nettoyer le thread MySQL
        AbandonedConnectionCleanupThread.checkedShutdown();

        // Désenregistrer les drivers JDBC
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (SQLException e) {
                sce.getServletContext().log("Error deregistering driver " + driver, e);
            }
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialisation si nécessaire
    }
}