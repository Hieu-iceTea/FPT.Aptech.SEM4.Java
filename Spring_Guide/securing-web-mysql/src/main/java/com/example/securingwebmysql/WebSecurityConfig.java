package com.example.securingwebmysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    //region - JDBC Authentication -
    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                //.withDefaultSchema()
                /*.withUser(
                        User.withUsername("user")
                                .password("123456")
                                .roles("USER")
                )
                .withUser(
                        User.withUsername("admin")
                                .password("123456")
                                .roles("ADMIN")
                )
                .withUser(
                        User.withUsername("Hieu_iceTea")
                                .password("123456")
                                .roles("USER", "ADMIN")
                )
                .withUser(
                        User.withUsername("Hieu_IT")
                                .password("123456")
                                .roles("USER", "ADMIN")
                )*/
        ;
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
    //endregion

    //region - Configure -
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/home").permitAll()
                .anyRequest().authenticated()
                .and()

                .formLogin()
                //.loginPage("/login") //Bỏ dòng này sẽ dùng trang login mặc định
                .permitAll()
                .and()

                .logout()
                .permitAll();
    }
    //endregion

    //region - In-Memory Authentication -
    /*@Bean
    @Override
    public UserDetailsService userDetailsService() {
        UserDetails user =
                User.withDefaultPasswordEncoder()
                        .username("Hieu_iceTea")
                        .password("123456")
                        .roles("USER")
                        .build();

        return new InMemoryUserDetailsManager(user);
    }*/
    //endregion
}