package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author: XuYi
 * @date: 2021/6/8 16:15
 * @description:
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    //@Transactional
    public void addDept(Department department){
        departmentMapper.insert(department);
//        int i=1/0;
    }

    public List<Department> getAll(){
        List<Department> result=null;
        result=departmentMapper.selectAll();
        return result;
    }
}
