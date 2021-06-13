package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: XuYi
 * @date: 2021/6/9 9:02
 * @description:
 */

/**
 * 处理员工相关业务逻辑
 */
@Service
public class EmployeeService {
@Autowired
    private EmployeeMapper employeeMapper;



    /**
     * 查询所有员工的处理
     * @return
     */
    public List<Employee> getAll(){

        List<Employee> result=null;
        result=employeeMapper.selectAllWithDept();
        return  result;
    }

    /**
     * 删除员工
     * @return -1表示删除对象不存在 ，0：删除失败，>0：删除成功
     */
    public Integer deleteEmp(String ids){
        Integer result = null;
        /*拆分ids，得到id集合*/
        String[] ids_str = ids.split("-");
        List<Integer> ids_list=new ArrayList<>();
        for (String id_str : ids_str) {
            ids_list.add(Integer.parseInt(id_str));
        }
        /*1.检测删除对象是否存在*/
        List<Employee> delEmp=employeeMapper.selectByIdList(ids_list);
        if(delEmp.size()!=ids_list.size()){
            result = -1;
        }else{
            Integer opResult = employeeMapper.deleteByIdList(ids_list);
            if(opResult==ids_list.size()){
                return  opResult;
            }else {
                result=0;
                throw new RuntimeException("员工信息删除失败!");
            }
        }
        return result;
    }

    /**
     * 新增员工的处理
     * @param employee
     * @return
     */
    public Integer add(Employee employee){
        Integer result=0;
        /*验证用户名是否重复*/
        if(checkEmpName(employee.getEmpName())){
            result=employeeMapper.insert(employee);
        }else {
            result = -1;
        }
        return result;
    }

    /**
     * 验证用户名是否可用
     * @param empName
     * @return true：姓名不重复，可用 false：姓名重复，不可用
     */
    public Boolean checkEmpName(String empName){
        Boolean result = false;
        /*根据用户名查询*/
        if(employeeMapper.selectByEmpName(empName).size()==0){
            result=true;
        }
        return result;
    }


    public Employee getEmp(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        System.out.println("服务层selectByPrimaryKey:"+employee);
        return employee;
    }

    public void updateEmp(Employee employee){
//        Department department= new Department();
//        department.getDeptId();
//        System.out.println(" department.getDeptId()是:"+ department.getDeptId());
        employeeMapper.updateByPrimaryKey(employee);
        System.out.println("服务层：updateByPrimaryKey=》"+employee);
    }
}
