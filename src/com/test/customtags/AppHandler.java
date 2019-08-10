package com.test.customtags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AppHandler extends SimpleTagSupport {
    private String format;
    private Date date;
    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public void doTag() throws JspException, IOException {
        SimpleDateFormat dateFormatter = new SimpleDateFormat(format);
        PageContext context = (PageContext)getJspContext();
        JspWriter writer = context.getOut();
        writer.println(dateFormatter.format(date));
    }
}
