package ${package.Controller};

<#list table.importPackages as pkg>
 import ${pkg};
</#list>
import io.swagger.annotations.*;
import ${package.VO}.*;
import ${package.Entity}.*;
import ${package.Service}.*;
import org.springframework.web.bind.annotation.RequestMapping;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@Api(value = "${table.comment!}管理接口")
@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

@Autowired
private ${entity}Service ${entity?uncap_first}Service;

    <#if table.addFields?size gt 0>
     @ApiOperation("新增${table.comment!}")
     @PostMapping("/add")
     @RequireLoginUser
     public WrappedResult<Boolean> add${entity}(@Validated @RequestBody Add${entity}Request request) {
         ${entity?uncap_first}Service.add${entity}(request);
         return WrappedResult.successWrapedResult(true);
     }
    </#if>
    <#if table.deleteFields?size gt 0>
      @ApiOperation("删除${table.comment!}")
      @PostMapping("/delete")
      public WrappedResult<Boolean> delete${entity}(@Validated @RequestBody Delete${entity}Request request) {
        ${entity?uncap_first}Service.delete${entity}(request);
        return WrappedResult.successWrapedResult(true);
      }
    </#if>
     @ApiOperation("根据ID删除${table.comment!}")
     @PostMapping("/deleteById")
     public WrappedResult<Boolean> delete${entity}ById(@Validated @RequestBody Delete${entity}ByIdRequest request) {
        ${entity?uncap_first}Service.delete${entity}ById(request);
        return WrappedResult.successWrapedResult(true);
    }
     @ApiOperation("根据ID列表删除${table.comment!}")
     @PostMapping("/deleteByIds")
     public WrappedResult<Boolean> delete${entity}ByIds(@Validated @RequestBody Delete${entity}ByIdsRequest request) {
       ${entity?uncap_first}Service.delete${entity}ByIds(request);
       return WrappedResult.successWrapedResult(true);
    }
     <#if table.updateFields?size gt 0>
        @ApiOperation("更新${table.comment!}")
        @PostMapping("/update")
        @RequireLoginUser
        public WrappedResult<Boolean> update${entity}(@Validated @RequestBody Update${entity}Request request) {
            ${entity?uncap_first}Service.update${entity}(request);
            return WrappedResult.successWrapedResult(true);
        }
     </#if>
     <#if table.paginationFields?size gt 0>
         @ApiOperation("分页查询${table.comment!}")
         @PostMapping("/pagination")
      public WrappedResult<PaginationResponse<${entity}>> pagination(Pagination${entity}Request request) {
         return WrappedResult.successWrapedResult(${entity?uncap_first}Service.pagination(request));
      }
     </#if>

}
</#if>
