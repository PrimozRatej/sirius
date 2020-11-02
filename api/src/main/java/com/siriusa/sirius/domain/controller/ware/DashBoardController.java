package com.siriusa.sirius.domain.controller.ware;
import com.siriusa.sirius.domain.model.ware.DashBoardDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.bytebuddy.implementation.bytecode.Throw;

@RestController
@RequestMapping("/api/ware")
public class DashBoardController {
    // Get All Addresses
    @GetMapping("/dashboard")
    public DashBoardDTO get() throws InterruptedException {
        DashBoardDTO dto = new DashBoardDTO();
        dto.quaToPacked = (int) ((Math.random() * (150 - 20)) + 20);
        dto.packToShiped = (int) ((Math.random() * (150 - 20)) + 20);;
        dto.packToBeDelivered = (int) ((Math.random() * (150 - 20)) + 20);;
        dto.packToBeInvoice = (int) ((Math.random() * (150 - 20)) + 20);;
        dto.inHand = (int) ((Math.random() * (150 - 20)) + 20);;
        dto.toBeReceived = (int) ((Math.random() * (150 - 20)) + 20);;
        return dto;
    }
}