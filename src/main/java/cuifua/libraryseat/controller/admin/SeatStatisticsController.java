package cuifua.libraryseat.controller.admin;

import cuifua.libraryseat.bean.Result;
import cuifua.libraryseat.service.admin.SeatStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/statistic")
public class SeatStatisticsController {

    @Autowired
    private SeatStatisticsService seatStatisticsService;

    /**
     * 进入占座统计页面
     * @return
     */
    @RequestMapping(value = "/occupied")
    public String list() {
        return "admin/statistics/occupied_statistics";
    }


    /**
     * 按照月份统计各个类型中的占座人数
     *
     * @return
     */
    @RequestMapping("/statisticsMap")
    @ResponseBody
    public Result<Map<String, List<Integer>>> statisticsList() {
        Map<String, List<Integer>> stringListMap = seatStatisticsService.seatStatisticsList();


        return Result.success(stringListMap);
    }
}