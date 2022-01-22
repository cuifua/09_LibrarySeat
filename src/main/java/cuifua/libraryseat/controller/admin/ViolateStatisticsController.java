package cuifua.libraryseat.controller.admin;

import cuifua.libraryseat.entity.admin.Statistics;
import cuifua.libraryseat.service.admin.ViolateStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/statistics")
public class ViolateStatisticsController
{
    @Autowired
    private ViolateStatisticsService violateStatisticsService;

    /**
     * 返回违规统计认数
     */
    @RequestMapping(value="/violate")
    public String list(){
        return "admin/statistics/violate_statistics";
    }

    /**
     * 按照月份统计违规人数
     * @return
     */
    @RequestMapping("/statisticsList")
    @ResponseBody
    public Statistics statisticsList()
    {
        Statistics data = violateStatisticsService.statisticsList();
        return data;
    }






}
