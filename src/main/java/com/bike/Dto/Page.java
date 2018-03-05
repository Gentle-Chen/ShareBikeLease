package com.bike.Dto;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class Page {

    private int currentPage;

    private int pageSize;

    private int totalCount;

    private int totalPage;

    private List listObject;

    private List<JSONObject> aggList1 = new ArrayList<JSONObject>();

    private List<JSONObject> aggList2 = new ArrayList<JSONObject>();

    private List<JSONObject> aggList3 = new ArrayList<JSONObject>();

    private List<JSONObject> aggList4 = new ArrayList<JSONObject>();

    public int getTotalPage() {
        return totalPage;
    }

    public Page(int pageSize, int totalCount) {
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        if (currentPage < 0) {
            this.currentPage = 1;
        } else if (totalPage > 0 && currentPage > totalPage) {
            this.currentPage = totalPage;
        } else {
            this.currentPage = currentPage;
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public List getListObject() {
        return listObject;
    }

    public void setListObject(List listObject) {
        this.listObject = listObject;
    }

    public List<JSONObject> getAggList1() {
        return aggList1;
    }

    public void setAggList1(List aggList1) {
        this.aggList1 = aggList1;
    }

    public List<JSONObject> getAggList2() {
        return aggList2;
    }

    public void setAggList2(List aggList2) {
        this.aggList2 = aggList2;
    }

    public List<JSONObject> getAggList3() {
        return aggList3;
    }

    public void setAggList3(List aggList3) {
        this.aggList3 = aggList3;
    }

    public List<JSONObject> getAggList4() {
        return aggList4;
    }

    public void setAggList4(List aggList4) {
        this.aggList4 = aggList4;
    }

}
