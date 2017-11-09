package com.cs157a.PCBuilder.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.UserServiceImpl;
 
@Configuration
@ComponentScan("com.cs157a.PCBuilder.*")
@PropertySource("classpath:database.properties")
public class ApplicationContextConfig { 
    @Autowired
    private Environment env;
 
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
    	dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
    	dataSource.setUrl(env.getProperty("jdbc.url"));
        dataSource.setUsername(env.getProperty("jdbc.username"));
        dataSource.setPassword(env.getProperty("jdbc.password"));  
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
    @Bean(name = "bCryptPasswordEncoder")
    public BCryptPasswordEncoder getBCryptPasswordEncoder() {
    	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    	return bCryptPasswordEncoder;
    }
}