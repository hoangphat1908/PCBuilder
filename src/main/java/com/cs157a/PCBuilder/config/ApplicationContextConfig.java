package com.cs157a.PCBuilder.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.UserServiceImpl;
 
@Configuration
@ComponentScan("com.cs157a.PCBuilder.*") 
public class ApplicationContextConfig { 
  
      
 
    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
    
    @Bean(name = "dataSource")
    public DataSource getDataSource() {
    	DriverManagerDataSource dataSource = new DriverManagerDataSource();
    	dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    	dataSource.setUrl("jdbc:mysql://localhost/db");
        dataSource.setUsername("root");
        dataSource.setPassword("abc123");
        
        
        //SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
        //dataSource.setDriver(new com.mysql.jdbc.Driver());
        
        return dataSource;
    }
    
    @Bean(name = "jdbcTemplate")
    public JdbcTemplate getjdbcTemplate(DataSource dataSource) {
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate;
    }
  
    @Bean(name = "userService")
    public UserService getUserService() {
    	UserServiceImpl userService = new UserServiceImpl();
        return userService;
    }
}