# SSM1
这是一个SSM简单例子的整合，实现了对一个图书信息表的增删改查,对于搭建SSM脚手架有帮助。
## 配置文件
### web.xml
```xml
<servlet>
    <!--  配置SpringMVC的核心控制器 Servlet容器  -->
    <servlet-name>springmvc</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <!--  配置SpringMVC的核心控制器处理所有请求  -->
    <servlet-name>springmvc</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>

    <!-- 为创建Spring容器指定多个配置文件 -->
  <context-param>
    <param-name>contextConfigLocation</param-name>
<!--    多个配置文件之间以","隔开-->
    <param-value>/WEB-INF/daoContext.xml,/WEB-INF/appContext.xml</param-value>
  </context-param>

  <listener>
<!--    使用ContextLoaderListener在Web应用启动时初始化Spring容器 ROOT容器 -->
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>

<!--  定义字符编码的过滤器：CharacterEncodingFilter  -->
  <filter>
    <filter-name>characterEncodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>UTF-8</param-value>
    </init-param>
  </filter>

<!--  使用characterEncodingFilter过滤所有请求-->
  <filter-mapping>
    <filter-name>characterEncodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
```
通过web.xml提供两个重要的组件和一个过滤组件。
1. `DispatcherServlet`：SpringMVC的核心Servlet，负责拦截所有请求
2. `ContextLoaderListener`:负责在应用启动时初始化Spring容器
3. `CharacterEncodingFilter`：负责过滤所有请求，使用指定的字符集对请求进行处理。该过滤器主要用于解决POST请求的中文请求参数。
其中`ContextLoaderListener`初始化的Spring容器被称为`根容器`，主要负责管理应用中的`Service组件、DAO组件、DataSource等后端组件`。
而`DispatcherServlet`初始化的Spring容器被称为`Servlet容器`，主要负责配置、管理应用中的`Controller、视图解析器、HandlerMapping等组件`。
### appContext.xml与daoContext.xml
该实例为了方便扩展，将根容器的配置文件分为两个，其中appContext.xml作为管理应用业务的组件，主要负责加载Service组件和事务管理器等；而daoContext.xml负责加载DAO组件和DataSource数据源。虽然有两个配置文件，但是只会生成一个Spring容器
appContext.xml
```xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:p="http://www.springframework.org/schema/p" xmlns:c="http://www.springframework.org/schema/c"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.0.xsd
        http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx.xsd">

<!--    appContext.xml用于管理应用的业务服务组件-->

<!--    自动扫描指定包及其子包下的所有Bean类-->
    <context:component-scan base-package="com.yg.Service" />
<!--    配置事务管理器-->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager" p:dataSource-ref="dataSource" />
<!--    根据注解来生成事务代理-->
    <tx:annotation-driven transaction-manager="transactionManager"/>
</beans>
```
daoCOntext.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:mybatis="http://mybatis.org/schema/mybatis-spring" xmlns:p="http://www.springframework.org/schema/p"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
http://www.springframework.org/schema/beans/spring-beans.xsd
http://mybatis.org/schema/mybatis-spring
http://mybatis.org/schema/mybatis-spring.xsd">

<!--    daoContext.xml用于管理应用的DAO组件-->

    <!--    定义数据源-->
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource"
          destroy-method="close"
          p:driverClass="com.mysql.jdbc.Driver"
          p:jdbcUrl="jdbc:mysql://localhost:3306/ssm1?useUnicode=true&amp;characterEncoding=UTF-8"
          p:user="root"
          p:password="Yg_20001008"
    />

    <!--    配置Mybatis核心组件：SqlSessionFactory
            并为该SqlSessionFactory配置它的依赖DataSource
            指定为Bean包下面的所有实体类注册别名-->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"
          p:dataSource-ref="dataSource"
          p:typeAliasesPackage="com.yg.Bean"/>

<!--    自动扫描指定包及其子包下的所有Mapper组件-->
    <mybatis:scan base-package="com.yg.Dao"/>

</beans>
```
## 业务代码的编写
这部分不复杂，直接看代码。需要注意的是，对于Mapper组件使用@AutoWrite自动注入的时候，IDEA会标红，但是项目能够正常运行，不影响。
