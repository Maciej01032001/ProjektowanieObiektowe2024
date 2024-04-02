package com.example.projobj3

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.ResponseBody

@Controller
class Authorization{

    val userbase = listOf(
            Credentials("user1", "pass1"),
            Credentials("user2", "pass2")
    )

    @PostMapping("/login")
    @ResponseBody
    fun login(@RequestBody user: Credentials): String {
        val credentialsFound = userbase.find { it.login == user.login && it.password == user.password }

        return if (credentialsFound != null) {
            "Welcome: ${credentialsFound.login}"
        } else {
            "Bad credentials"
        }
    }


}