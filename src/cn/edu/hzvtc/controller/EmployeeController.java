package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.protobuf.EmptyProto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: XuYi
 * @date: 2021/6/9 9:01
 * @description:
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/checkName")
    @ResponseBody
    public ReturnMsg checkName(@RequestParam("empName")String empName){
        /*验证用户名非空，符合验证规则*/

        /*验证用户名是否重复*/
       if(employeeService.checkEmpName(empName)){

           return ReturnMsg.success().add("msg","用户名可用");
       }else{
           return ReturnMsg.fail().add("msg","用户名不可用！");
       }

    }

    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveEmp(@Valid Employee employee, BindingResult bindingResult) {


        //数据绑定出错
        if (bindingResult.hasErrors()) {
            Map<String,Object> map = new HashMap<String,Object>();
            for (FieldError fieldError:bindingResult.getFieldErrors()){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldError",map);
        } else {
            if (employeeService.add(employee) > 0) {
                return ReturnMsg.success();
            } else {
                return ReturnMsg.fail();
            }
        }
    }

    @RequestMapping("input")
    public String input(){
        return "input";
    }

    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delEmp(@PathVariable("ids")String ids){
        try {
            Integer result = employeeService.deleteEmp(ids);
            if (result == -1) {
                ReturnMsg returnMsg = new ReturnMsg();
                returnMsg.setCode(201);
                returnMsg.setMsg("删除对象不存在!");
                return returnMsg;
            } else if (result == 0) {
                return ReturnMsg.fail();
            } else {
                return ReturnMsg.success();
            }
        }catch (Exception e) {
            return ReturnMsg.fail();
        }
    }

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pn",defaultValue = "1",required = false) Integer pn, Map<String,Object> map){
        /*调用strtpage方法，启用分页查询功能，随后的第一个*/
//        PageHelper.startPage(pageNum,5);
//        List<Employee> employees = employeeService.getAll();
        /*使用分页信息对象可以对查询结果进行封装，可以通过PageInfo对象获取分页数据以及相关分页属性*/
        //PageInfo pageInfo = new PageInfo(employees,5);
        map.put("pn",pn);
        return "list";
    }

//    @RequestMapping("/emps")
//    @ResponseBody//将返回值写到respnebody中
//    public PageInfo emps(@RequestParam(value = "pn",defaultValue = "1") Integer pageNum){
//        /*调用strtpage方法，启用分页查询功能，随后的第一个*/
//        PageHelper.startPage(pageNum,10);
//        List<Employee> employees = employeeService.getAll();
//        /*使用分页信息对象可以对查询结果进行封装，可以通过PageInfo对象获取分页数据以及相关分页属性*/
//        PageInfo pageInfo = new PageInfo(employees,5);
//       // map.put("pageInfo",pageInfo);
//        return pageInfo;
//    }

    @RequestMapping("/emps")
    @ResponseBody//将返回值写到respnebody中
    public ReturnMsg emps(@RequestParam(value = "pn",defaultValue = "1") Integer pageNum) {
        try {
            /*调用strtpage方法，启用分页查询功能，随后的第一个*/
            PageHelper.startPage(pageNum, 5);
            List<Employee> employees = employeeService.getAll();
            /*使用分页信息对象可以对查询结果进行封装，可以通过PageInfo对象获取分页数据以及相关分页属性*/
            PageInfo pageInfo = new PageInfo(employees, 5);
            return ReturnMsg.success().add("pageInfo", pageInfo);
        } catch (Exception e) {
            return ReturnMsg.fail();
        }
    }


    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id,Map<String, Object> map){
        if(id.contains("_")){
            String[]s=id.split("_");
            System.out.println(s.length);
            map.put("empId",s[0]);
            System.out.println("empId"+s[0]);
            map.put("pn",s[1]);
            System.out.println("empId"+s[1]);
        }
        return "edit";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getEmp(@PathVariable("id")Integer id){
        Employee employee = employeeService.getEmp(id);
        System.out.println("controller中的employee:"+employee+"-------------");
        return ReturnMsg.success().add("emp",employee);

    }

    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody

    public ReturnMsg updateEmp(Employee employee,BindingResult result){
        System.out.println("控制层更新方法中的emp:"+employee+"--------------------");
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            System.out.println("controller中的errors");
            for(FieldError error : errors){
                map.put(error.getField(), error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors",map);
        }else {
            employeeService.updateEmp(employee);
            return ReturnMsg.success();
        }
    }

}
