package cn.hm.model;

public class Phone {
    private Integer pno;

    private String pname;

    private Float hightprice;

    private Float lessprice;

    private String date;

    private Integer memory;

    public Integer getPno() {
        return pno;
    }

    public void setPno(Integer pno) {
        this.pno = pno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Float getHightprice() {
        return hightprice;
    }

    public void setHightprice(Float hightprice) {
        this.hightprice = hightprice;
    }

    public Float getLessprice() {
        return lessprice;
    }

    public void setLessprice(Float lessprice) {
        this.lessprice = lessprice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public Integer getMemory() {
        return memory;
    }

    public void setMemory(Integer memory) {
        this.memory = memory;
    }
}