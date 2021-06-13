package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: XuYi
 * @date: 2021/6/8 16:19
 * @description:
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/addDept")
    public String addDept(){
        Department department= new Department(null,"测试部1");
        departmentService.addDept(department);
        return "list";
    }

    @RequestMapping("/depts")
    @ResponseBody
    public ReturnMsg getDepts(){
       /*获取所有部门信息*/
        List<Department> depts = departmentService.getAll();
        /*返回结果*/
        return ReturnMsg.success().add("depts",depts);
    }
}
