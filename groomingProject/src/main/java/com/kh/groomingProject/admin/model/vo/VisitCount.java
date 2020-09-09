package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class VisitCount implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -6114928850667367615L;
	private String visitId;
    private Date visitTime;
    
	public VisitCount() {
	}

	public VisitCount(String visitId, Date visitTime) {
		this.visitId = visitId;
		this.visitTime = visitTime;
	}

	public String getVisitId() {
		return visitId;
	}

	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}

	public Date getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}

	@Override
	public String toString() {
		return "VisitCount [visitId=" + visitId + ", visitTime=" + visitTime + "]";
	}

    
}
