package com.filmlog.common.vo;

public class Paging {

	private int totalData;
	private int totalPage;
	private int numPerPage = 20; //20
	private int limitPageNo;
	private int nowPage = 1;
	
	private int pageBarSize = 5; //5
	private int pageBarStart;
	private int pageBarEnd;
	
	private boolean prev = true;
	private boolean next = true;
	
	public int getTotalData() {
		return totalData;
	}
	public void setTotalData(int totalData) {
		this.totalData = totalData;
		calcPaging();
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getLimitPageNo() {
		return limitPageNo;
	}
	public void setLimitPageNo(int limitPageNo) {
		this.limitPageNo = limitPageNo;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getPageBarSize() {
		return pageBarSize;
	}
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize = pageBarSize;
	}
	public int getPageBarStart() {
		return pageBarStart;
	}
	public void setPageBarStart(int pageBarStart) {
		this.pageBarStart = pageBarStart;
	}
	public int getPageBarEnd() {
		return pageBarEnd;
	}
	public void setPageBarEnd(int pageBarEnd) {
		this.pageBarEnd = pageBarEnd;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void calcPaging() {
		limitPageNo = (nowPage-1)*numPerPage;
		totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		pageBarStart = ((nowPage-1)/pageBarSize)*pageBarSize +1;
		
		pageBarEnd = pageBarStart + pageBarSize -1;
		if(pageBarEnd >  totalPage) pageBarEnd = totalPage;
		
		if(pageBarStart == 1) prev = false;
		if(pageBarEnd >= totalPage) next = false;
	}
	
}
