package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author: XuYi
 * @date: 2021/6/8 15:13
 * @description:
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;
    private EmployeeMapper employeeMapper;
    private Employee employee;

    @Test
    public void testInsertDept(){
        Department dept=new Department(null,"开发部");
        Department dept1=new Department(null,"开发部");
        Department dept2=new Department(null,"开发部");
        Department dept3=new Department(null,"财务部");
        Department dept4=new Department(null,"开发部");
        Department dept5=new Department(null,"开发部");
        Department dept6=new Department(null,"财务部");
        Department dept7=new Department(null,"开发部");
        Department dept8=new Department(null,"开发部");
        departmentMapper.insert(dept);
        departmentMapper.insert(dept1);
        departmentMapper.insert(dept2);
        departmentMapper.insert(dept3);
        departmentMapper.insert(dept4);
        departmentMapper.insert(dept5);
        departmentMapper.insert(dept6);
        departmentMapper.insert(dept7);
        departmentMapper.insert(dept8);
    }

//    @Test
//    public void testInserEmp(){
//        for (int i = 0; i < 10; i++) {
//            String uid= UUID.randomUUID().toString().substring(0,6);
//            employeeMapper.insert(new Employee(null,uid,uid+"@qq.com",(int)(Math.random()*2)==1,null));
//        }
//
//    }


}
