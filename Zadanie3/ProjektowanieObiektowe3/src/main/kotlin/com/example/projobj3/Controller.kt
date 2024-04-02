package com.example.projobj3
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody

@Controller
class Controller{

    val items = listOf(
            Item("Rolki", 10),
            Item("Pilka", 10)

    )

    @GetMapping("/items")
    @ResponseBody
    fun getAllItems(): List<Item> {
        return items
    }
}