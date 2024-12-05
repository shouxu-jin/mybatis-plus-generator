package com.baomidou.mybatisplus.generator.util;

import java.util.List;

public class TableExtends {
    private List<TableExtendProperty> add;
    private List<TableExtendProperty> update;
    private List<TableExtendProperty> delete;
    private List<TableExtendProperty> pagination;

    public List<TableExtendProperty> getAdd() {
        return add;
    }

    public void setAdd(List<TableExtendProperty> add) {
        this.add = add;
    }

    public List<TableExtendProperty> getUpdate() {
        return update;
    }

    public void setUpdate(List<TableExtendProperty> update) {
        this.update = update;
    }

    public List<TableExtendProperty> getDelete() {
        return delete;
    }

    public void setDelete(List<TableExtendProperty> delete) {
        this.delete = delete;
    }

    public List<TableExtendProperty> getPagination() {
        return pagination;
    }

    public void setPagination(List<TableExtendProperty> pagination) {
        this.pagination = pagination;
    }
}
