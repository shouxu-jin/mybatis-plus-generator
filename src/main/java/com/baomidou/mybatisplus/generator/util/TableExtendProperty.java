package com.baomidou.mybatisplus.generator.util;

public class TableExtendProperty {
    private String propertyName;
    private int min;
    private int max;
    private boolean require;
    private boolean likeQuery;

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public boolean isRequire() {
        return require;
    }

    public void setRequire(boolean require) {
        this.require = require;
    }

    public boolean isLikeQuery() {
        return likeQuery;
    }

    public void setLikeQuery(boolean likeQuery) {
        this.likeQuery = likeQuery;
    }
}
