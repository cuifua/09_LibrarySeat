package cuifua.libraryseat.dto;

import cuifua.libraryseat.entity.admin.ReadingRoom;
import cuifua.libraryseat.entity.admin.Seat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class SeatDTO
{
    private ReadingRoom readingRoom;//阅览室Id

    private Date createTime;//创建时间

    private Seat seat;
}
