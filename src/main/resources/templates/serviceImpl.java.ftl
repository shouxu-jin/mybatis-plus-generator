package ${package.ServiceImpl};

<#list table.importPackages as pkg>
 import ${pkg};
</#list>
import ${package.VO}.*;
import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {
 <#if table.addFields?size gt 0>
  @Override
  @Transactional
  public void add${entity}(Add${entity}Request request) {
    ${entity} ${entity?cap_first} = new ${entity}();
    ${entity?cap_first}.setId(UUID.randomUUID().toString().replace("-", ""));
    BeanUtils.copyProperties(request, ${entity?cap_first});
    ${entity?cap_first}.setCreatorId(LoginUserHolder.getUserId());
    ${entity?cap_first}.setCreatorName(LoginUserHolder.getUserName());
    ${entity?cap_first}.setCreateTime(new Date());
    ${entity?cap_first}.setUpdaterId(LoginUserHolder.getUserId());
    ${entity?cap_first}.setUpdaterName(LoginUserHolder.getUserName());
    ${entity?cap_first}.setUpdateTime(new Date());
    save(${entity?cap_first});
  }
 </#if>
 <#if table.deleteFields?size gt 0>
  @Override
  @Transactional
  public void delete${entity}(Delete${entity}Request request) {
      lambdaUpdate()
      <#list table.deleteFields as field>
       <#if field.propertyType == "String">
      .eq(StringUtils.isNotBlank(request.get${field.capitalName}()), ${entity}::get${field.capitalName}, request.get${field.capitalName}())
       <#else>
      .eq(null != request.get${field.capitalName}), ${entity}::get${field.capitalName}, request.get${field.capitalName}())
       </#if>
      </#list>
      .remove();
  }
 </#if>
 @Override
 @Transactional
 public void delete${entity}ById(Delete${entity}ByIdRequest request) {
     removeById(request.getId());
 }
 @Override
 @Transactional
 public void delete${entity}ByIds(Delete${entity}ByIdsRequest request) {
     removeByIds(request.getIds());
 }
 <#if table.updateFields?size gt 0>
  @Override
  @Transactional
  public void update${entity}(Update${entity}Request request) {
    ${entity} ${entity?cap_first} = getById(request.getId());
    if (null == ${entity?cap_first}) {
       return;
    }
    BeanUtils.copyProperties(request, ${entity?cap_first});
    ${entity?cap_first}.setUpdaterId(LoginUserHolder.getUserId());
    ${entity?cap_first}.setUpdaterName(LoginUserHolder.getUserName());
    ${entity?cap_first}.setUpdateTime(new Date());
    updateById(${entity?cap_first});
  }
 </#if>
 <#if table.paginationFields?size gt 0>
  @Override
  public PaginationResponse<${entity}> pagination(Pagination${entity}Request request) {
  Page<${entity}> page = page(new Page<>(request.getPageIndex(), request.getPageSize()), Wrappers.<${entity}>lambdaQuery()
     <#list table.paginationFields as field>
      <#if field.likeQuery>
       <#assign queryprefix="like"/>
      <#else>
       <#assign queryprefix="eq"/>
      </#if>
      <#if field.propertyType == "String">
       .${queryprefix}(StringUtils.isNotBlank(request.get${field.capitalName}()), ${entity}::get${field.capitalName}, request.get${field.capitalName}())
      <#else>
       .${queryprefix}(null != request.get${field.capitalName}), ${entity}::get${field.capitalName}, request.get${field.capitalName}())
      </#if>
     </#list>
  );
  return new PaginationResponse<>(page.getTotal(), page.getRecords());
  }
 </#if>
}
</#if>
