package cn.edu.hzvtc.test;

import cn.edu.hzvtc.entity.Employee;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author: XuYi
 * @date: 2021/6/8 16:22
 * @description:
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:./web/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @Before
    public void init(){
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testAddDept() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/addDept")).andReturn();
        //System.out.println(mvcResult);
    }

    @Test
    public void testEmps() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/list").param("pn","5")).andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        //List<Employee> employees = (List<Employee>)request.getAttribute("emps");
        PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
        System.out.println(pageInfo.getPageNum());
    }
}
