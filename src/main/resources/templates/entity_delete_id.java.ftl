package ${package.Entity};

<#list table.importPackages as pkg>
    import ${pkg};
</#list>
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.*;
<#if swagger>
    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
</#if>
<#if entityLombokModel>
    import lombok.Getter;
    import lombok.Setter;
    <#if chainModel>
        import lombok.experimental.Accessors;
    </#if>
</#if>

/**
* <p>
    * 根据ID删除${table.comment!}请求对象
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if entityLombokModel>
    @Getter
    @Setter
    <#if chainModel>
        @Accessors(chain = true)
    </#if>
</#if>
<#if swagger>
    @ApiModel(value = "根据ID删除${table.comment!}请求对象", description = "根据ID删除${table.comment!}请求对象")
</#if>
<#if superEntityClass??>
    public class ${entity} extends ${superEntityClass}<#if activeRecord><${entity}></#if> {
<#elseif activeRecord>
    public class ${entity} extends Model<${entity}> {
<#else>
    public class Delete${entity}ByIdRequest {
</#if>
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>
    <#if field.keyFlag>
        <#if field.comment!?length gt 0>
            <#if swagger>
                @ApiModelProperty("${field.comment}")
            <#else>
                /**
                * ${field.comment}
                */
            </#if>
        </#if>
        @NotBlank(message = "主键不能为空")
        private String id;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }
    </#if>
</#list>
<#------------  END 字段循环遍历  ---------->
}
