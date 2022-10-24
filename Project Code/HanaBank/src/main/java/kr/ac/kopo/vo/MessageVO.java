package kr.ac.kopo.vo;

import kr.ac.kopo.tag.StatusEnum;
import lombok.Data;

@Data
public class MessageVO {

    private StatusEnum status;
    private String message;
    private Object data;

    public MessageVO() {
        this.status = StatusEnum.BAD_REQUEST;
        this.data = null;
        this.message = null;
    }
}