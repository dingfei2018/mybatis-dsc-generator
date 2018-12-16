
package ${daoUrl};

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import ${entityUrl}.${entityName};

/**
*
* 描述:  ${entityComment}dao接口
* 作者:  ${author}
* 时间:  ${createTime}
* @Version: ${version}
*
*/

@Mapper
public interface ${entityName}Dao {
	
	public ${entityName} selectByPrimaryKey(${idType} id);
	
	public int deleteByPrimaryKey(${idType} id);
	
	public int insertSelective(${entityName} ${objectName});
	
	public int updateByPrimaryKeySelective(${entityName} ${objectName});
	
	public List<${entityName}> query${entityName}List(${entityName} ${objectName});
}
	