package ${package.Service};

<#list table.importPackages as pkg>
 import ${pkg};
</#list>
import ${package.Entity}.${entity};
import ${package.VO}.*;
import ${superServiceClassPackage};

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {
<#if table.addFields?size gt 0>
    void add${entity}(Add${entity}Request request);
</#if>
 <#if table.deleteFields?size gt 0>
  void delete${entity}(Delete${entity}Request request);
 </#if>
  void delete${entity}ById(Delete${entity}ByIdRequest request);
  void delete${entity}ByIds(Delete${entity}ByIdsRequest request);
 <#if table.updateFields?size gt 0>
  void update${entity}(Update${entity}Request request);
 </#if>
 <#if table.paginationFields?size gt 0>
 PaginationResponse<${entity}> pagination(Pagination${entity}Request request);
 </#if>
}
</#if>
