package ${controllerUrl};

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.item.util.AppPage;
import com.item.util.JsonResult;
import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**   
 * 
 * @描述:  ${entityComment}REST api相关功能
 * @作者:  ${author}
 * @时间:  ${createTime}
 * @Version:${version}
 *    
 */
@Api(description = "${entityComment}",value="${entityComment}" )
@RestController
@RequestMapping("/${objectName}")
public class ${entityName}Controller {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public ${entityName}Service ${objectName}Service;
	
	/**
	 * @查询${entityComment}对象
	 * @param   对象参数：id
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@GetMapping("/{id}")
	@ApiOperation(value = "获取${entityComment}信息", notes = "获取${entityComment}")
	@ApiImplicitParam(paramType="path", name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public JsonResult<${entityName}> get${entityName}ById(@PathVariable("id")${idType} id){
		JsonResult<${entityName}> result=new JsonResult<${entityName}>();
		try {
			${entityName} ${objectName}=${objectName}Service.selectByPrimaryKey(id);
			if (${objectName}!=null) {
				result.setCode(1);
				result.setMessage("成功");
				result.setData(${objectName});
			} else {
				logger.error("获取${entityComment}失败ID："+id);
				result.setCode(-1);
				result.setMessage("你获取的${entityComment}不存在");
			}
		} catch (Exception e) {
			logger.error("获取${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	/**
	 * @添加${entityComment}对象
	 * @param   对象参数：${objectName}
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@PostMapping("/")
	@ApiOperation(value = "添加${entityComment}", notes = "添加${entityComment}")
	public JsonResult<${entityName}> insertSelective(${entityName} ${objectName}){
		JsonResult<${entityName}> result=new JsonResult<${entityName}>();
		try {
			int rg=${objectName}Service.insertSelective(${objectName});
			if (rg>0) {
				result.setCode(1);
				result.setMessage("成功");
				result.setData(${objectName});
			} else {
				logger.error("添加${entityComment}执行失败："+${objectName}.toString());
				result.setCode(-1);
				result.setMessage("执行失败，请稍后重试");
			}
		} catch (Exception e) {
			logger.error("添加${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	/**
	 * @删除${entityComment}对象
	 * @param   对象参数：id
	 * @return  int
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@DeleteMapping("/{id}")
	@ApiOperation(value = "删除${entityComment}", notes = "删除${entityComment}")
	@ApiImplicitParam(paramType="query", name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public JsonResult<Object> deleteByPrimaryKey( @PathVariable("id") ${idType} id){
		JsonResult<Object> result=new JsonResult<Object>();
		try {
			int reg=${objectName}Service.deleteByPrimaryKey(id);
			if (reg>0) {
				result.setCode(1);
				result.setMessage("成功");
				result.setData(id);
			} else {
				logger.error("删除${entityComment}失败ID："+id);
				result.setCode(-1);
				result.setMessage("执行错误，请稍后重试");
			}
		} catch (Exception e) {
			logger.error("删除${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	/**
	 * @ 修改${entityComment}对象
	 * @param   对象参数：${objectName}
	 * @return  ${objectName}
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "修改${entityComment}", notes = "修改${entityComment}")
	@PutMapping("/")
	public JsonResult<${entityName}> updateByPrimaryKeySelective(${entityName} ${objectName}){
		JsonResult<${entityName}> result=new JsonResult<${entityName}>();
		try {
			int reg = ${objectName}Service.updateByPrimaryKeySelective(${objectName});
			if (reg>0) {
				result.setCode(1);
				result.setMessage("成功");
				result.setData(${objectName});
			} else {
				logger.error("修改${entityComment}失败ID："+${objectName}.toString());
				result.setCode(-1);
				result.setMessage("执行错误，请稍后重试");
			}
		} catch (Exception e) {
			logger.error("修改${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	/**
	 * @获取匹配${entityComment}
	 * @param   对象参数：${objectName}
	 * @return  List<${entityName}>
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@ApiOperation(value = "条件查询${entityComment}", notes = "条件查询[${objectName}]")
	@PostMapping("/query${entityName}List")
	public JsonResult<List<${entityName}>> query${entityName}List(${entityName} ${objectName}){
		JsonResult<List<${entityName}>> result=new JsonResult<List<${entityName}>>();
		try {
			List<${entityName}> list = ${objectName}Service.query${entityName}List(${objectName});
			result.setCode(1);
			result.setMessage("成功");
			result.setData(list);
		} catch (Exception e) {
			logger.error("获取${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	/**
	 * @分页条件查询${entityComment}
	 * @param   对象参数：AppPage<${entityName}>
	 * @return  PageInfo<${entityName}>
	 * @author  ${author}
	 * @time    ${createTime}
	 */
	@GetMapping("/getPage${entityName}")
	@ApiOperation(value = "分页查询", notes = "分页查询返回对象[PageInfo<${entityName}>]")
	@ApiImplicitParams({
        @ApiImplicitParam(paramType="query", name = "pageNum", value = "当前页", required = true, dataType = "int"),
        @ApiImplicitParam(paramType="query", name = "pageSize", value = "页行数", required = true, dataType = "int")
    })
	public JsonResult<PageInfo<${entityName}>> get${entityName}BySearch(Integer pageNum,Integer pageSize){
		JsonResult<PageInfo<${entityName}>> result=new JsonResult<PageInfo<${entityName}>>();
		AppPage<${entityName}> page =new AppPage<${entityName}>();
		page.setPageNum(pageNum);
		page.setPageSize(pageSize);
		//其他参数
		${entityName} ${objectName}=new ${entityName}();
		page.setParam(${objectName});
		//分页数据
		try {
			PageInfo<${entityName}> pageInfo = ${objectName}Service.get${entityName}BySearch(page);
			result.setCode(1);
			result.setMessage("成功");
			result.setData(pageInfo);
		} catch (Exception e) {
			logger.error("分页查询${entityComment}执行异常："+e.getMessage());
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
}